# LLM Wiki — реализация системы персональной памяти для Claude Code

> **Кому это:** этот документ описывает **идею** и **архитектуру** системы, а не дамп кода.
> Дай его своему Claude Code в новой сессии — он соберёт похожую систему сам, адаптировав под твою машину, vault, привычки.

---

## Идея в одном абзаце

У Claude Code нет долговременной памяти между сессиями. Каждый новый чат начинается с чистого листа — приходится пересказывать контекст проекта. **Метод Карпати** ([оригинал на Reddit](https://www.reddit.com/r/learnmachinelearning/comments/1jzu53c/karpathys_idea_for_an_llm_personal_knowledge_base/)) решает это так: после каждой сессии хук автоматически извлекает важные решения и паттерны → накапливает в дейли-логи → периодически компилирует в структурированную базу знаний → инжектирует index базы в начало следующей сессии. **Не RAG, не векторная БД** — просто Markdown + grep + инъекция в системный промпт через хук.

Готовая реализация движка — [coleam00/claude-memory-compiler](https://github.com/coleam00/claude-memory-compiler). Этот документ описывает как поднять её в личной wiki + жить с ней (Obsidian, multi-device sync, кастомизации).

---

## Архитектура

### Цикл жизни сессии

```
┌─────────────────────────────────────────────────────────────────┐
│ Старт сессии в Claude Code                                      │
│   └─ SessionStart hook:                                         │
│       1. git pull (свежее состояние с другой машины)            │
│       2. читает vault/knowledge/index.md                        │
│       3. читает последние записи vault/daily/                   │
│       4. инжектирует это в системный промпт                     │
│       Claude видит: "ты уже работал над X, решил Y, открыто Z"  │
├─────────────────────────────────────────────────────────────────┤
│ Идёт работа → разговор накапливается в transcript               │
├─────────────────────────────────────────────────────────────────┤
│ Конец сессии (или PreCompact перед авто-сжатием контекста)      │
│   └─ flush.py (фоновый процесс, не блокирует выход):            │
│       1. читает transcript                                      │
│       2. через Claude Agent SDK выделяет ВАЖНОЕ                 │
│          (решения, паттерны, gotchas — НЕ опечатки/тривию)      │
│       3. дописывает в vault/daily/YYYY-MM-DD.md                 │
│       4. git push (улетает на другую машину)                    │
├─────────────────────────────────────────────────────────────────┤
│ Раз в N сессий (или вручную):                                   │
│   └─ compile.py:                                                │
│       читает все vault/daily/*.md → синтезирует в:              │
│       vault/knowledge/concepts/   (концепции)                   │
│       vault/knowledge/connections/ (связи между концепциями)    │
│       vault/knowledge/qa/          (Q&A кэш)                    │
│       vault/knowledge/index.md     (карта)                      │
└─────────────────────────────────────────────────────────────────┘
```

### Почему не RAG

- **Скорость:** инъекция через хук = 0 запросов к БД за сессию. Index уже в контексте.
- **Прозрачность:** база знаний — обычный Markdown. Открыл в Obsidian, прочитал, поправил руками.
- **Версионирование:** `git diff` показывает как менялась "память" со временем.
- **Limit:** работает до ~200-500 страниц на проект. После — RAG неизбежен.

### Структура репо

```
<repo>/
├── memory-compiler/             ← движок (форк coleam00/claude-memory-compiler)
│   ├── hooks/
│   │   ├── session-start.py     ← инжектит контекст + git pull
│   │   ├── session-end.py       ← триггерит flush
│   │   └── pre-compact.py       ← триггерит flush перед авто-сжатием
│   ├── scripts/
│   │   ├── config.py            ← пути и timezone (единый источник правды)
│   │   ├── flush.py             ← извлечение важного из transcript → daily
│   │   ├── compile.py           ← daily/* → knowledge/
│   │   ├── query.py             ← поиск по knowledge
│   │   └── lint.py              ← проверка здоровья wiki
│   ├── pyproject.toml           ← uv зависимости
│   └── AGENTS.md                ← как работают скрипты (для Claude)
│
├── vault/                       ← Obsidian vault, всё видно в Obsidian-граф
│   ├── CLAUDE.md                ← схема wiki (конвенции для Claude)
│   ├── daily/YYYY-MM-DD.md      ← дейли-логи (пишет flush.py)
│   ├── knowledge/               ← скомпилированная база (пишет compile.py)
│   │   ├── index.md             ← карта, инжектится в SessionStart
│   │   ├── concepts/            ← концепции
│   │   ├── connections/         ← связи между концепциями
│   │   └── qa/                  ← закэшированные ответы
│   ├── raw/Clippings/           ← исходники из Obsidian Web Clipper
│   ├── wiki/<project>/          ← wiki по конкретным проектам
│   ├── _meta/                   ← системная документация (Pipeline, User Flow)
│   └── log.md                   ← лог операций wiki
│
├── setup.ps1                    ← bootstrap-скрипт для Windows
├── README.md                    ← краткий обзор
└── SETUP.md                     ← этот документ
```

### Ключевая инвариантность путей

`memory-compiler/` и `vault/` живут **рядом** в одном репо. Это критично:
- `git pull/push` в SessionStart/end синкает оба сразу → multi-device работает
- `flush.py` пишет в `../vault/daily/`, `compile.py` читает оттуда → один источник правды
- Obsidian видит `daily/` и `knowledge/` как часть vault → всё в графе

---

## Кастомизации поверх апстрима

Апстрим [coleam00/claude-memory-compiler](https://github.com/coleam00/claude-memory-compiler) "из коробки" хранит `daily/` и `knowledge/` внутри своей же папки. Для интеграции с Obsidian + multi-device sync нужны 3 правки:

### 1. `scripts/config.py` — пути в vault, не в memory-compiler

Апстрим:
```python
ROOT_DIR = Path(__file__).resolve().parent.parent  # memory-compiler/
DAILY_DIR = ROOT_DIR / "daily"                     # → memory-compiler/daily
KNOWLEDGE_DIR = ROOT_DIR / "knowledge"             # → memory-compiler/knowledge
TIMEZONE = "America/Chicago"
```

Кастом:
```python
ROOT_DIR = Path(__file__).resolve().parent.parent  # memory-compiler/
REPO_DIR = ROOT_DIR.parent                         # repo root
VAULT_DIR = REPO_DIR / "vault"
DAILY_DIR = VAULT_DIR / "daily"                    # → vault/daily ✓ Obsidian видит
KNOWLEDGE_DIR = VAULT_DIR / "knowledge"            # → vault/knowledge ✓ в графе
TIMEZONE = "Europe/Moscow"                         # своя tz
```

**Почему:** хочется чтобы дейли-логи и компилированная база лежали в Obsidian vault — тогда они видны в графе, ищутся встроенным поиском, синкаются вместе с твоей wiki по проектам.

### 2. `hooks/session-start.py` — добавить git pull в начало

Апстрим только инжектирует контекст. Добавляем `git pull --rebase --autostash` перед чтением, чтобы получить свежие записи с другой машины.

```python
def git_pull() -> None:
    """Pull latest changes from remote so we always start with fresh state."""
    try:
        subprocess.run(
            ["git", "pull", "--rebase", "--autostash"],
            cwd=str(REPO_DIR),
            capture_output=True, text=True, timeout=12,
        )
    except Exception:
        pass  # non-fatal, продолжаем с локальным состоянием

# вызвать в самом начале main()
```

### 3. `scripts/flush.py` — git push в конце фонового процесса

После того как flush дописал в daily — пушим:
```python
subprocess.run(["git", "add", "vault/daily/"], cwd=str(REPO_DIR), ...)
subprocess.run(["git", "commit", "-m", f"daily: {today}"], cwd=str(REPO_DIR), ...)
subprocess.run(["git", "push"], cwd=str(REPO_DIR), ...)
```

Опционально, если коллеге не нужна синхронизация между машинами — эти 2 правки можно пропустить.

---

## Установка

### Требования

- **Windows 10/11** (для других OS адаптируй setup.ps1 под свой shell)
- **Node.js** ([nodejs.org](https://nodejs.org/)) — для Claude Code
- **Git**
- **uv** ([astral.sh/uv](https://astral.sh/uv)) — Python package manager
- **Аккаунт Claude** Pro / Max / Team / Enterprise — Claude Agent SDK покрыт подпиской, **API-кредиты не нужны**
- **Obsidian** ([obsidian.md](https://obsidian.md/)) — опционально, для просмотра vault как граф

### Шаги

**1. Создай свой репо**

```bash
mkdir my-llm-wiki && cd my-llm-wiki
git init
```

**2. Клонируй апстрим как `memory-compiler/`**

Не сабмодуль (это создаёт лишнюю сложность с обновлениями), а просто копию:
```bash
git clone https://github.com/coleam00/claude-memory-compiler memory-compiler
rm -rf memory-compiler/.git  # отвязываемся от апстрима
```

**3. Применить 3 кастомизации выше** (config.py, session-start.py, flush.py)

**4. Создать структуру vault**

```bash
mkdir -p vault/{daily,knowledge/{concepts,connections,qa},raw/Clippings,wiki,_meta}
touch vault/log.md
```

**5. `vault/CLAUDE.md` — схема wiki**

Минимальная версия (можно потом дополнить):
```markdown
# CLAUDE.md — Схема wiki

Цель: накапливать контекст по проектам между сессиями.

## Структура vault

\`\`\`
wiki/<project>/index.md   # каталог проекта + текущее состояние
wiki/<project>/decisions/ # архитектурные решения
wiki/<project>/concepts/  # ключевые концепции проекта
wiki/<project>/qa/        # сохранённые Q&A
raw/Clippings/            # из Obsidian Web Clipper (иммутабельно)
log.md                    # хронологический лог операций
\`\`\`

## Что фиксировать обязательно
- Архитектурные решения с обоснованием (почему так)
- Нетривиальные паттерны и gotchas
- Решённые неочевидные баги
- Вопросы которые возникали >1 раза

## Что НЕ фиксировать
- Опечатки, тривиальные правки
- Временные решения (которые будут переделаны)
- То что очевидно из кода

## Frontmatter (для всех wiki-файлов)
\`\`\`yaml
---
title: "Название"
project: "<slug>"
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags: []
---
\`\`\`
```

**6. Поставить Python зависимости**

```powershell
cd memory-compiler
uv sync
cd ..
```

**7. Зарегистрировать хуки в `~/.claude/settings.json`**

Хуки запускаются Claude Code при событиях. Указывают абсолютный путь к скриптам:

```json
{
  "hooks": {
    "SessionStart": [{
      "matcher": "",
      "hooks": [{
        "type": "command",
        "command": "powershell -NoProfile -NonInteractive -Command \"Set-Location 'C:\\\\path\\\\to\\\\my-llm-wiki\\\\memory-compiler'; uv run python hooks/session-start.py\"",
        "timeout": 15
      }]
    }],
    "SessionEnd": [{
      "matcher": "",
      "hooks": [{
        "type": "command",
        "command": "powershell -NoProfile -NonInteractive -Command \"Set-Location 'C:\\\\path\\\\to\\\\my-llm-wiki\\\\memory-compiler'; uv run python hooks/session-end.py\"",
        "timeout": 30
      }]
    }],
    "PreCompact": [{
      "matcher": "",
      "hooks": [{
        "type": "command",
        "command": "powershell -NoProfile -NonInteractive -Command \"Set-Location 'C:\\\\path\\\\to\\\\my-llm-wiki\\\\memory-compiler'; uv run python hooks/pre-compact.py\"",
        "timeout": 30
      }]
    }]
  }
}
```

> На Linux/Mac команды будут проще: `cd /path && uv run python hooks/session-start.py`. Подробности по hooks: [docs.claude.com/en/docs/claude-code/hooks](https://docs.claude.com/en/docs/claude-code/hooks).

**8. (Опционально) `setup.ps1` для повторного развёртывания**

Bootstrap-скрипт который автоматизирует шаги 6-7. Полезен если разворачиваешь на второй машине. См. примерную структуру:

```powershell
# 1. uv sync в memory-compiler/
# 2. Прочитать ~/.claude/settings.json (создать если нет)
# 3. Добавить 3 хука с абсолютными путями (idempotent — не дублировать)
# 4. Сохранить settings.json обратно
```

**9. Open Vault в Obsidian**

Указать на папку `vault/`. Все дейли-логи и компилированные знания будут видны в графе.

---

## Multi-device sync (опционально)

Если работаешь с двух машин (десктоп + ноут):

1. Создать **приватный** репо на GitHub: `https://github.com/<you>/my-llm-wiki`
2. `git remote add origin <url>` + `git push -u origin master`
3. На второй машине: `git clone <url>` + повторить шаги 6-9

`session-start.py` делает `git pull` на старте, `flush.py` делает `git push` после записи в daily. Конфликты разруливаются через `--rebase --autostash` — обычно работает само.

**Важно:** не пушить если в репо есть секреты (API-ключи, токены). `.gitignore` должен покрывать всё чувствительное.

---

## Первая проверка что всё работает

1. Запусти `claude` в любой папке
2. Проверь что появилось в начале промпта что-то типа `[knowledge index injected: ...]` — значит SessionStart отработал
3. Поговори с Claude несколько минут о любой технической задаче
4. Закрой сессию (`/exit`)
5. Через 30-60 секунд проверь `vault/daily/YYYY-MM-DD.md` — там должны появиться записи
6. Через несколько таких сессий запусти `cd memory-compiler && uv run python scripts/compile.py`
7. Проверь `vault/knowledge/` — там появятся структурированные статьи

---

## Полезные команды

```powershell
cd memory-compiler

# Скомпилировать дейли-логи в knowledge/
uv run python scripts/compile.py

# Спросить базу знаний
uv run python scripts/query.py "вопрос"

# Спросить + сохранить ответ как qa/
uv run python scripts/query.py "вопрос" --file-back

# Полная проверка здоровья wiki (использует API)
uv run python scripts/lint.py

# Только структурные проверки (без API, бесплатно)
uv run python scripts/lint.py --structural-only
```

---

## Подводные камни

- **Кириллица/пробелы/em-dash в путях ломают bash и Python.** Имя папки vault — `vault/`, не `Моя База Знаний`. Содержимое (имена файлов внутри) — на русском сколько хочешь, это не путь к скрипту.
- **Timezone в `config.py`** — определяет какой дейли-лог "сегодня". Если запускаешь с двух часовых поясов, фиксируй один.
- **`SessionEnd` хук запускает фоновый процесс через subprocess+Popen с DEVNULL** — иначе на Windows наследуются stdout/stderr-handles и Claude Code зависает на выходе. Логи flush идут в `memory-compiler/scripts/flush.log`.
- **`compile.py` дорог по токенам** — гоняет Claude Agent SDK по всем дейли. Не запускай каждую сессию, раз в неделю достаточно.
- **`PreCompact` срабатывает перед авто-сжатием контекста** — это спасает от потери данных в длинных сессиях. Если выключишь — память будет терять детали из чатов >100K токенов.
- **`--recurse-submodules` НЕ нужно** при клонировании — `memory-compiler/` это обычная папка, не сабмодуль.

---

## Дальше

После того как система заработала и пара недель данных накопилась:

- **Lint раз в неделю** — выявляет противоречия, orphan-страницы, устаревшее
- **Project-wiki** — для каждого активного проекта создавай `vault/wiki/<project>/index.md`. Это становится первым что Claude читает когда ты говоришь "поработаем над X"
- **Web Clipper** в Obsidian — клипы статей попадают в `vault/raw/Clippings/`, потом руками просишь Claude `wiki(<project>): ingest эту статью` → попадает в проектную wiki

---

## Credits

- **Идея:** [Andrej Karpathy](https://github.com/karpathy) — [LLM Personal Knowledge Base gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
- **Движок:** [coleam00/claude-memory-compiler](https://github.com/coleam00/claude-memory-compiler) — реализация Карпати-метода для Claude Code
- **Этот документ:** описание адаптации движка под Obsidian + multi-device sync

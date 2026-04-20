# Setup — установка на новую машину

## Требования

- Windows 10/11
- [Node.js](https://nodejs.org/) (для Claude Code)
- [Git](https://git-scm.com/)
- [uv](https://astral.sh/uv) — Python package manager (установится автоматически если нет)
- Аккаунт Claude (Max / Pro / Team)

## Установка

### 1. Клонировать репо

```powershell
git clone --recurse-submodules https://github.com/YOUR_USERNAME/YOUR_REPO.git
cd YOUR_REPO
```

> `--recurse-submodules` важно — иначе `memory-compiler` будет пустой папкой.

### 2. Запустить setup скрипт

```powershell
powershell -ExecutionPolicy Bypass -File setup.ps1
```

Скрипт автоматически:
- Инициализирует git submodule
- Устанавливает Python зависимости (`uv sync`)
- Патчит пути в `memory-compiler` (DAILY_DIR → vault)
- Добавляет хуки SessionStart/SessionEnd/PreCompact в `~/.claude/settings.json`

### 3. Claude Code

```powershell
npm install -g @anthropic-ai/claude-code
claude auth   # войти в аккаунт
```

### 4. peon-ping (звуковые уведомления)

```powershell
claude plugin install peon-ping
```

Восстановить настройки — скопировать в `~/.claude/hooks/peon-ping/config.json`:

```json
{
    "enabled": true,
    "default_pack": "peasant_ru",
    "volume": 0.2,
    "pack_rotation": [],
    "pack_rotation_mode": "random",
    "annoyed_threshold": 3,
    "annoyed_window_seconds": 10,
    "desktop_notifications": true,
    "silent_window_seconds": 0,
    "categories": {
        "task.acknowledge": true,
        "session.start": true,
        "input.required": true,
        "task.error": true,
        "resource.limit": true,
        "task.complete": true,
        "user.spam": true
    }
}
```

Установить голосовые паки:

```powershell
peon packs install peasant_ru
peon packs install peon
peon packs install glados
peon packs install dota2_axe
peon packs install tf2_engineer
peon packs install duke_nukem
peon packs install hd2_helldiver
peon packs install ra2_kirov
peon packs install sc_battlecruiser
peon packs install sc_kerrigan
```

### 5. Obsidian

1. Скачать [Obsidian](https://obsidian.md/)
2. Open Vault → выбрать папку `Anekeika LLM Wiki — Метод Карпати`

## Структура репо

```
.
├── Anekeika LLM Wiki — Метод Карпати/   # Obsidian vault (основная wiki)
│   ├── daily/                            # дейли-логи сессий (пишутся автоматически)
│   ├── raw/Clippings/                    # исходники из Obsidian Web Clipper
│   ├── wiki/                             # wiki по проектам
│   │   ├── llm-wiki/                     # концепции LLM Wiki + оптимизация токенов
│   │   ├── peon-ping/                    # документация peon-ping
│   │   ├── uphuman/                      # проект UpHuman
│   │   └── bottelegram/                  # Telegram бот
│   ├── CLAUDE.md                         # схема wiki для Claude
│   └── log.md                            # лог операций wiki
├── memory-compiler/                      # git submodule (автоматический инжект памяти)
│   ├── hooks/                            # SessionStart / SessionEnd / PreCompact
│   ├── scripts/                          # flush.py, compile.py, query.py, lint.py
│   └── knowledge/                        # скомпилированная база знаний
├── setup.ps1                             # скрипт установки
└── SETUP.md                              # эта инструкция
```

## Как работает memory-compiler

```
Разговор с Claude → SessionEnd hook → flush.py извлекает важное
    → daily/YYYY-MM-DD.md → compile.py → knowledge/
        → SessionStart hook инжектирует контекст → следующая сессия
```

Полезные команды:
```powershell
cd memory-compiler
uv run python scripts/compile.py          # скомпилировать логи в базу знаний
uv run python scripts/query.py "вопрос"  # спросить базу знаний
uv run python scripts/lint.py            # проверить здоровье wiki
```

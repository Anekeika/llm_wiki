# Anekeika LLM Wiki

Персональная база знаний по методу Андрея Карпати: AI-агент автоматически накапливает и структурирует знания из сессий Claude Code.

## Как это работает

```
Разговор с Claude → SessionEnd hook → flush.py извлекает важное
    → daily/YYYY-MM-DD.md → compile.py → knowledge/
        → SessionStart hook инжектирует контекст → следующая сессия
```

Вместо RAG (поиск при каждом запросе) — знания компилируются **один раз при ingestion** и хранятся как структурированные Markdown-файлы.

## Структура

```
vault/                              # Obsidian vault — основная wiki
  daily/                            # дейли-логи (пишутся автоматически)
  knowledge/                        # скомпилированная база знаний
  raw/Clippings/                    # исходники из Obsidian Web Clipper
  wiki/                             # wiki по проектам
    llm-wiki/                       # концепции LLM Wiki + оптимизация токенов
    peon-ping/                      # голосовые уведомления для Claude Code
    uphuman/                        # RPG-геймификация личного развития (Vue3)
    bottelegram/                    # Telegram-бот (задачи + Notion + календарь)
  _meta/                            # системная документация (Pipeline, User Flow и т.д.)
  CLAUDE.md                         # схема wiki для Claude
  log.md                            # лог операций

memory-compiler/                    # движок памяти (форк, см. Credits)
  hooks/                            # SessionStart / SessionEnd / PreCompact
  scripts/                          # flush.py, compile.py, query.py, lint.py, config.py

setup.ps1                           # установка на новую машину
SETUP.md                            # подробная инструкция (можно отдать коллеге)
```

## Установка на новую (свою) машину

```powershell
git clone https://github.com/Anekeika/llm_wiki.git
cd llm_wiki
powershell -ExecutionPolicy Bypass -File setup.ps1
```

Скрипт ставит зависимости (`uv sync`) и добавляет хуки в `~/.claude/settings.json`.

## Поделиться системой с кем-то

[SETUP.md](SETUP.md) — самодостаточный документ с описанием идеи и архитектуры. Можно отдать коллеге: его Claude Code прочитает и соберёт похожую систему с нуля (без доступа к этому приватному репо).

## Полезные команды

```powershell
cd memory-compiler
uv run python scripts/compile.py           # скомпилировать логи в базу знаний
uv run python scripts/query.py "вопрос"   # спросить базу знаний
uv run python scripts/lint.py             # проверить здоровье wiki
```

## Credits

Папка `memory-compiler/` — адаптация [coleam00/claude-memory-compiler](https://github.com/coleam00/claude-memory-compiler) (изначально подключалась как git submodule, поглощена в репо для свободы модификации). Архитектура движка — оригинальная работа автора апстрима. Изменения относительно апстрима:

- `scripts/flush.py` — пути логов перенаправлены в Obsidian vault
- `hooks/session-start.py` — git pull/push для синхронизации между устройствами

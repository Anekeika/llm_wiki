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
Anekeika LLM Wiki — Метод Карпати/   # Obsidian vault
  daily/                              # дейли-логи (пишутся автоматически)
  raw/Clippings/                      # исходники из Obsidian Web Clipper
  wiki/                               # wiki по проектам
    llm-wiki/                         # концепции LLM Wiki + оптимизация токенов
    peon-ping/                        # голосовые уведомления для Claude Code
    uphuman/                          # RPG-геймификация личного развития (Vue3)
    bottelegram/                      # Telegram-бот (задачи + Notion + календарь)
  CLAUDE.md                           # схема wiki для Claude
  log.md                              # лог операций

memory-compiler/                      # git submodule — движок памяти
  hooks/                              # SessionStart / SessionEnd / PreCompact
  scripts/                            # flush.py, compile.py, query.py, lint.py
  knowledge/                          # скомпилированная база знаний

setup.ps1                             # установка на новую машину
SETUP.md                              # инструкция
```

## Установка на новую машину

```powershell
git clone --recurse-submodules https://github.com/Anekeika/llm_wiki.git
cd llm_wiki
powershell -ExecutionPolicy Bypass -File setup.ps1
```

Скрипт автоматически: инициализирует submodule, устанавливает зависимости (`uv sync`), патчит пути, добавляет хуки в `~/.claude/settings.json`.

Подробнее → [SETUP.md](SETUP.md)

## Полезные команды

```powershell
cd memory-compiler
uv run python scripts/compile.py           # скомпилировать логи в базу знаний
uv run python scripts/query.py "вопрос"   # спросить базу знаний
uv run python scripts/lint.py             # проверить здоровье wiki
```

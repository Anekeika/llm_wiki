---
title: "peon-ping"
project: "peon-ping"
created: 2026-04-20
updated: 2026-04-20
tags: [index, claude-code, hooks, audio]
---

# peon-ping — index

## Что это

Claude Code hook: играет голосовые реплики игровых персонажей когда агент заканчивает задачу, ждёт разрешения, или встречает ошибку. Работает с Claude Code, Codex, Cursor, Windsurf, Kiro и другими.

> Идея, которая вдохновила Microsoft добавить native sound hooks в VS Code (50M+ пользователей).

## Состояние

Установлен. `enabled: false` (включать командой `/peon-ping-toggle`).

- **Активный пак:** `peasant_ru` (Крестьянин из WC3, русский)
- **Громкость:** `0.2` (20%)
- **Все категории:** включены

## Стек

- PowerShell (основной хук `peon.ps1`)
- Хуки Claude Code: SessionStart, Stop, Notification, PermissionRequest, PostToolUseFailure, PreCompact, UserPromptSubmit
- Реестр паков: `https://peonping.github.io/registry/index.json`

## Ключевые файлы

- `~/.claude/hooks/peon-ping/peon.ps1` — главный скрипт
- `~/.claude/hooks/peon-ping/config.json` — настройки
- `~/.claude/hooks/peon-ping/packs/` — голосовые паки
- `~/.claude/settings.json` — регистрация хуков

## Установленные паки

- [[concepts/installed-packs]] — все 11 паков с описаниями

## Инструкции

- [[concepts/installation]] — установка на новую машину
- [[concepts/usage]] — команды управления

## Открытые вопросы

- Нет (всё работает)

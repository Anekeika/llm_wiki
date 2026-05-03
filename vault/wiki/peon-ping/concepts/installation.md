---
title: "peon-ping — установка на новую машину"
project: "peon-ping"
created: 2026-04-20
updated: 2026-04-20
tags: [peon-ping, installation, setup]
---

# Установка peon-ping на новую машину (Windows)

**TLDR:** Установить через Claude Code plugin, затем добавить паки и восстановить config.json.

## Требования

- Windows (PowerShell 5.1+, рекомендуется PS 7+)
- Claude Code установлен и настроен

## Шаг 1 — Установить плагин

```bash
# В терминале Claude Code:
claude plugin install peon-ping
```

Это создаст:
- `~/.claude/hooks/peon-ping/` — все файлы хука
- `~/.claude/skills/` — скиллы (peon-ping-toggle, peon-ping-use, и др.)
- `~/.claude/settings.json` — хуки добавятся автоматически
- `~/.local/bin/peon.cmd` — CLI команда `peon`

## Шаг 2 — Восстановить конфиг

Заменить содержимое `~/.claude/hooks/peon-ping/config.json`:

```json
{
    "silent_window_seconds": 0,
    "pack_rotation": [],
    "enabled": true,
    "pack_rotation_mode": "random",
    "default_pack": "peasant_ru",
    "annoyed_threshold": 3,
    "desktop_notifications": true,
    "categories": {
        "task.acknowledge": true,
        "session.start": true,
        "input.required": true,
        "task.error": true,
        "resource.limit": true,
        "task.complete": true,
        "user.spam": true
    },
    "annoyed_window_seconds": 10,
    "volume": 0.2
}
```

> Изменения от дефолта: `enabled: true`, `default_pack: "peasant_ru"`, `volume: 0.2`

## Шаг 3 — Установить голосовые паки

```bash
# Основные паки (в Claude Code или терминале):
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

# peasant устанавливается вместе с основным плагином
```

## Шаг 4 — Проверить хуки в settings.json

Убедиться что в `~/.claude/settings.json` есть эти хуки:

```json
"SessionStart": [{ "type": "command", "command": "powershell -NoProfile -NonInteractive -File \"%USERPROFILE%\\.claude\\hooks\\peon-ping\\peon.ps1\"", "timeout": 10 }],
"SessionEnd":   [{ "type": "command", "command": "powershell -NoProfile -NonInteractive -File \"%USERPROFILE%\\.claude\\hooks\\peon-ping\\peon.ps1\"", "timeout": 10 }],
"Stop":         [{ "type": "command", "command": "powershell -NoProfile -NonInteractive -File \"%USERPROFILE%\\.claude\\hooks\\peon-ping\\peon.ps1\"", "timeout": 10 }],
"Notification": [{ "type": "command", "command": "powershell -NoProfile -NonInteractive -File \"%USERPROFILE%\\.claude\\hooks\\peon-ping\\peon.ps1\"", "timeout": 10 }]
```

> Обычно плагин добавляет это автоматически.

## Шаг 5 — Проверить

```bash
# В Claude Code:
/peon-ping-toggle    # включить/выключить
/peon-ping-use peasant_ru    # переключить пак
```

Или в терминале:
```powershell
peon status
peon packs list
```

## Trainer (дополнительно)

peon-ping включает Peon Trainer — напоминания делать упражнения во время сессий. Использовать:
```
/peon-ping-log 25 pushups
/peon-ping-log 30 squats
```

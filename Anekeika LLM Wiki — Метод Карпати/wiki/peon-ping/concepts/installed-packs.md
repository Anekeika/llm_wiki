---
title: "peon-ping — установленные паки"
project: "peon-ping"
created: 2026-04-20
updated: 2026-04-20
tags: [peon-ping, packs, audio]
---

# Установленные голосовые паки

**TLDR:** 11 паков установлены локально в `~/.claude/hooks/peon-ping/packs/`

## Текущий активный пак

`peasant_ru` — **Крестьянин (Русский)** (WC3)

## Все установленные паки

| Pack ID | Отображаемое имя | Язык | Автор |
|---|---|---|---|
| `peasant_ru` | Human Peasant (Russian) | ru | maksimfedin |
| `peon` | Orc Peon | en | tonyyont |
| `peasant` | Human Peasant | en | — |
| `glados` | GLaDOS (Portal) | en | DoubleGremlin181 |
| `dota2_axe` | Axe (Dota 2) | en | x-n2o |
| `tf2_engineer` | TF2 Engineer | en | Arie |
| `duke_nukem` | Duke Nukem | en | — |
| `hd2_helldiver` | Helldivers 2 Helldiver | en | — |
| `ra2_kirov` | RA2 Kirov (C&C) | en | — |
| `sc_battlecruiser` | StarCraft Battlecruiser | en | — |
| `sc_kerrigan` | StarCraft Kerrigan | en | — |

## Примеры реплик (peasant_ru — активный)

| Событие | Реплики |
|---|---|
| session.start | "Я готов.", "Да, господин?" |
| task.acknowledge | "Угу.", "Хорошо." |
| task.complete | "Опять работа?!", "Ну, я пошёл!" |
| task.error | "Прощайте.", "Ну вот, меня убьют." |
| input.required | "Чего?", "Опять работа?!" |
| resource.limit | "ААААА" |
| user.spam | "Ты что ли король? А я за тебя не голосовал!", "Помогите! На меня давят!" |

## Как переключить пак

```
/peon-ping-use glados
/peon-ping-use peon
/peon-ping-use peasant_ru
```

## Установить новый пак (из реестра)

```powershell
# В терминале:
peon packs install <pack-name>

# Или через команду в Claude Code:
/peon-ping-use <pack-name>   # автоустановит если нет
```

Реестр: https://peonping.github.io/registry/index.json

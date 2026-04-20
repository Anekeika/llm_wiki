---
title: "UpHuman / Endless Quests"
project: "uphuman"
created: 2026-04-20
updated: 2026-04-20
tags: [index, vue3, typescript, gamification]
---

# UpHuman — index

## Что это

Геймификация личного развития — RPG-интерфейс для прокачки реальных навыков. Персонаж, квесты, навыки, достижения.

**GitHub:** https://github.com/Runtime-Sufferers/endless-quests

## Состояние проекта

В разработке. Нет README. Базовая структура роутов и страниц готова.

## Стек

- **Vue 3** + Composition API
- **TypeScript** + vue-tsc
- **Vite** (сборка)
- **Vue Router 4**
- **marked** (рендеринг markdown)

## Архитектура

Feature-Sliced Design (FSD):
```
src/
  pages/        # страницы роутера
    dashboard/
    quests/
    skills/     # + SkillDetailPage
  entities/     # бизнес-сущности
    character/
    habit/
    quest/
    skill/
    achievement/
  shared/       # общие утилиты, конфиги
  widgets/      # составные блоки UI
  router/       # роуты + конфиги путей
```

## Роуты

| Путь | Компонент |
|---|---|
| `/` | → redirect dashboard |
| `/dashboard` | DashboardPage |
| `/skills` | SkillsPage |
| `/skills/:id` | SkillDetailPage |
| `/quests` | QuestsPage |

## Стиль

Два дизайн-контракта:
- `cyber_punk_component_style_contract.md` — cyberpunk тема
- `neo_terminal_component_style_contract.md` — neo terminal тема

## Ключевые файлы

- `src/router/routes.ts` — роутинг
- `src/shared/config` — ROUTE_NAMES и ROUTE_PATHS константы
- `vite.config.ts` — сборка
- `package.json` — зависимости

## Команды

```bash
npm install
npm run dev        # dev-сервер
npm run build      # сборка (vue-tsc + vite)
npm run preview    # превью сборки
npm run type-check # только проверка типов
```

## Открытые вопросы

- Нет бэкенда — где хранятся данные? (localStorage / API?)
- Состояние страниц character/achievement пока не роутятся
- Нет README — задокументировать концепцию

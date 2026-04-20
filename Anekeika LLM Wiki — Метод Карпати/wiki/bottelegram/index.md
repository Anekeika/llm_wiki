---
title: "BotTelegram"
project: "bottelegram"
created: 2026-04-20
updated: 2026-04-20
tags: [index, telegram, bot, grammy, notion, google-calendar]
---

# BotTelegram — index

## Что это

Telegram-бот личного планирования: задачи, события, уведомления с синхронизацией Notion и Google/Yandex Calendar.

**Путь:** `E:\BotTelegram`

## Состояние проекта

В разработке. Последние коммиты — апрель 2026. Нет README.

## Стек

- **Runtime:** Node.js + TypeScript 6
- **Bot framework:** grammy + @grammyjs/conversations
- **DB:** PostgreSQL + Prisma 7 (adapter-pg)
- **Интеграции:** Notion API, Google Calendar (googleapis), Yandex Calendar
- **Scheduler:** node-cron
- **Logging:** winston
- **Dev:** tsx (hot reload)

## Архитектура

```
src/
  config/          # конфиги (botToken, env)
  modules/
    scheduler/     # cron-задачи
    calendar/
      import/      # импорт событий
      google/      # Google OAuth + sync
      yandex/      # Yandex Calendar sync
  repositories/    # Prisma-репозитории (CRUD)
    user.repository.ts
    task.repository.ts
    event.repository.ts
    integration.repository.ts
    notification.repository.ts
  services/
    user.service.ts
    task.service.ts        # CRUD задач + Notion sync
    event.service.ts       # CRUD событий
    notion.service.ts      # Notion API клиент
    notification.service.ts
  telegram/
    handlers/      # регистрация команд бота
      start / task / event / settings / calendar
    conversations/ # многошаговые диалоги
      createTask / createEvent / rescheduleTask / editTask
    keyboards/     # inline-клавиатуры
    scenes/        # (задел)
    context.ts     # BotContext + SessionData
  types/
  utils/           # logger, date, crypto
  index.ts         # точка входа
```

## Модели данных (Prisma)

| Модель | Ключевые поля |
|---|---|
| `User` | telegramUserId, timezone, morningReportTime, morningReportEnabled |
| `Task` | title, status (NEW/IN_PROGRESS/DONE/CANCELLED), priority (LOW/MEDIUM/HIGH), plannedDate, plannedTime, **notionPageId** |
| `CalendarEvent` | title, startAt, endAt, sourceType (INTERNAL / GOOGLE_CALENDAR / YANDEX_CALENDAR) |
| `NotificationRule` | fireAt, offsetMinutes, status (PENDING/SENT/FAILED) |
| `CalendarIntegration` | provider (GOOGLE/YANDEX/NOTION), токены AES-256, syncEnabled |
| `SyncState` | cursor (page/sync token для incremental sync) |

## Переменные окружения (.env)

```env
BOT_TOKEN=                    # Telegram Bot Token
DATABASE_URL=postgresql://... # PostgreSQL
TOKEN_ENCRYPTION_KEY=         # 32 байта hex (64 символа) для AES-256
GOOGLE_CLIENT_ID=
GOOGLE_CLIENT_SECRET=
GOOGLE_REDIRECT_URI=
LOG_LEVEL=info
NODE_ENV=development
```

> ⚠️ Notion API ключ — судя по наличию notion.service.ts, нужен NOTION_TOKEN (не в .env.example — проверить!)

## Команды

```bash
npm run dev          # tsx watch — hot reload
npm run build        # tsc → dist/
npm run start        # node dist/index.js

npm run db:generate  # prisma generate
npm run db:migrate   # prisma migrate dev
npm run db:push      # prisma db push (без миграций)
npm run db:studio    # Prisma Studio UI
```

## Ключевые файлы

- `src/index.ts` — точка входа, регистрация middleware/conversations/handlers
- `src/services/notion.service.ts` — Notion интеграция
- `src/services/task.service.ts` — бизнес-логика задач
- `src/modules/scheduler/index.ts` — cron-задачи (утренний отчёт, уведомления)
- `prisma/schema.prisma` — схема БД
- `assistant_requirements_agent_instruction_v2.md` — ТЗ для агента

## Открытые вопросы

- Где NOTION_TOKEN в .env? Отсутствует в .env.example
- Есть ли деплой? (нет docker/deploy конфигов)
- Yandex Calendar — через какой API? (OAuth?)
- `src/config/index.ts` — что ещё кроме botToken?

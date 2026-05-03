---
title: "LLM Wiki — Метод Карпати"
project: "llm-wiki"
created: 2026-04-18
updated: 2026-04-18
tags: [index]
---

# LLM Wiki — index

## Состояние проекта
Начальный ingest: три клиппинга о методе Карпати и оптимизации токенов. Wiki-структура создана.

## Стек
- Obsidian (Graph View, Dataview, Web Clipper)
- Git (version control для знаний)
- Claude Code (ingest/query/lint агент)
- qmd (поиск при >100 страниц)

## Ключевые файлы
- `raw/Clippings/` — исходники (иммутабельно)
- `wiki/llm-wiki/concepts/` — концепции

## Концепции
- [[concepts/llm-wiki-vs-rag]] — в чём отличие LLM Wiki от RAG, операции метаболизма
- [[concepts/token-hygiene]] — 24 хака оптимизации токенов Claude Code

## Открытые вопросы
- Как настроить qmd для этого vault?
- Нужен ли отдельный проект-slug для Claude Code hacks или это часть llm-wiki?

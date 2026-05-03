# notebooks/

Jupyter / Marimo ноутбуки для исследования.

## Что сюда класть

- Эксперименты с Claude Agent SDK (новые промпты, форматы вывода)
- Анализ данных из `vault/daily/` (графики активности, темы по неделям, частота тегов)
- Прототипы compile/lint логики перед переносом в `memory-compiler/scripts/`
- Обучающие ноутбуки (читаешь статью → пробуешь концепт → результат сюда)

## Стек

Минимально: `uv` + `jupyter` или `marimo`.

```bash
uv venv
uv pip install jupyter marimo pandas matplotlib
uv run jupyter lab     # или: uv run marimo edit
```

## Конвенция именования

```
notebooks/
  YYYY-MM-DD-короткое-название.ipynb
  2026-05-03-daily-logs-stats.ipynb
  2026-05-10-prompt-tuning-flush.ipynb
```

Дата помогает находить когда что исследовалось — комплементарно к `vault/daily/`.

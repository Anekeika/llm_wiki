"""Path constants and configuration for the personal knowledge base."""

from pathlib import Path
from datetime import datetime, timezone

# ── Paths ──────────────────────────────────────────────────────────────
# memory-compiler/ lives next to vault/ inside the repo:
#   <repo>/memory-compiler/scripts/config.py  ← this file
#   <repo>/vault/                              ← Obsidian vault, daily/, knowledge/
ROOT_DIR = Path(__file__).resolve().parent.parent  # memory-compiler/
REPO_DIR = ROOT_DIR.parent                          # repo root
VAULT_DIR = REPO_DIR / "vault"

DAILY_DIR = VAULT_DIR / "daily"
KNOWLEDGE_DIR = VAULT_DIR / "knowledge"
CONCEPTS_DIR = KNOWLEDGE_DIR / "concepts"
CONNECTIONS_DIR = KNOWLEDGE_DIR / "connections"
QA_DIR = KNOWLEDGE_DIR / "qa"
REPORTS_DIR = ROOT_DIR / "reports"
SCRIPTS_DIR = ROOT_DIR / "scripts"
HOOKS_DIR = ROOT_DIR / "hooks"
AGENTS_FILE = ROOT_DIR / "AGENTS.md"

INDEX_FILE = KNOWLEDGE_DIR / "index.md"
LOG_FILE = KNOWLEDGE_DIR / "log.md"
STATE_FILE = SCRIPTS_DIR / "state.json"

# ── Timezone ───────────────────────────────────────────────────────────
TIMEZONE = "Europe/Moscow"


def now_iso() -> str:
    """Current time in ISO 8601 format."""
    return datetime.now(timezone.utc).astimezone().isoformat(timespec="seconds")


def today_iso() -> str:
    """Current date in ISO 8601 format."""
    return datetime.now(timezone.utc).astimezone().strftime("%Y-%m-%d")

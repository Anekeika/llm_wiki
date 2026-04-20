# setup.ps1 — Настройка wiki на новой машине (Windows)
# Запуск: powershell -ExecutionPolicy Bypass -File setup.ps1
# Или из PowerShell: .\setup.ps1

$ErrorActionPreference = "Stop"
$RepoRoot = $PSScriptRoot
$MemoryCompilerDir = Join-Path $RepoRoot "memory-compiler"
$VaultDir = Join-Path $RepoRoot "Anekeika LLM Wiki — Метод Карпати"
$ClaudeDir = Join-Path $env:USERPROFILE ".claude"
$SettingsFile = Join-Path $ClaudeDir "settings.json"

Write-Host ""
Write-Host "=== Wiki Setup ===" -ForegroundColor Cyan
Write-Host "Repo: $RepoRoot"
Write-Host ""

# ─── 1. Submodule ──────────────────────────────────────────────────────────
Write-Host "[1/4] Инициализация submodule memory-compiler..." -ForegroundColor Yellow
Set-Location $RepoRoot
git submodule update --init --recursive
Write-Host "  OK" -ForegroundColor Green

# ─── 2. Python зависимости ─────────────────────────────────────────────────
Write-Host "[2/4] Установка Python зависимостей (uv sync)..." -ForegroundColor Yellow
if (-not (Get-Command uv -ErrorAction SilentlyContinue)) {
    Write-Host "  uv не найден. Установка..." -ForegroundColor Yellow
    Invoke-RestMethod https://astral.sh/uv/install.ps1 | Invoke-Expression
}
Set-Location $MemoryCompilerDir
uv sync
Set-Location $RepoRoot
Write-Host "  OK" -ForegroundColor Green

# ─── 3. Патч DAILY_DIR в memory-compiler ───────────────────────────────────
Write-Host "[3/4] Патч путей в memory-compiler (DAILY_DIR → vault)..." -ForegroundColor Yellow

$VaultDirEscaped = $VaultDir -replace '\\', '\\\\'

# flush.py
$FlushPath = Join-Path $MemoryCompilerDir "scripts\flush.py"
$FlushContent = Get-Content $FlushPath -Raw
if ($FlushContent -notmatch "VAULT_DIR") {
    $FlushContent = $FlushContent -replace `
        'ROOT = Path\(__file__\)\.resolve\(\)\.parent\.parent\r?\nDAILY_DIR = ROOT / "daily"', `
        "ROOT = Path(__file__).resolve().parent.parent`nVAULT_DIR = ROOT.parent / `"Anekeika LLM Wiki — Метод Карпати`"`nDAILY_DIR = VAULT_DIR / `"daily`""
    Set-Content $FlushPath $FlushContent -Encoding UTF8
    Write-Host "  flush.py — patched" -ForegroundColor Green
} else {
    Write-Host "  flush.py — уже patched, пропускаем" -ForegroundColor Gray
}

# session-start.py
$SessionStartPath = Join-Path $MemoryCompilerDir "hooks\session-start.py"
$SessionContent = Get-Content $SessionStartPath -Raw
if ($SessionContent -notmatch "VAULT_DIR") {
    $SessionContent = $SessionContent -replace `
        'ROOT = Path\(__file__\)\.resolve\(\)\.parent\.parent\r?\nKNOWLEDGE_DIR = ROOT / "knowledge"\r?\nDAILY_DIR = ROOT / "daily"', `
        "ROOT = Path(__file__).resolve().parent.parent`nKNOWLEDGE_DIR = ROOT / `"knowledge`"`nVAULT_DIR = ROOT.parent / `"Anekeika LLM Wiki — Метод Карпати`"`nDAILY_DIR = VAULT_DIR / `"daily`""
    Set-Content $SessionStartPath $SessionContent -Encoding UTF8
    Write-Host "  session-start.py — patched" -ForegroundColor Green
} else {
    Write-Host "  session-start.py — уже patched, пропускаем" -ForegroundColor Gray
}

# ─── 4. Хуки в ~/.claude/settings.json ────────────────────────────────────
Write-Host "[4/4] Настройка хуков Claude Code в settings.json..." -ForegroundColor Yellow

$MemoryCompilerDirJson = $MemoryCompilerDir -replace '\\', '\\'

$HookSessionStart = "powershell -NoProfile -NonInteractive -Command `"Set-Location '$MemoryCompilerDir'; uv run python hooks/session-start.py`""
$HookSessionEnd   = "powershell -NoProfile -NonInteractive -Command `"Set-Location '$MemoryCompilerDir'; uv run python hooks/session-end.py`""
$HookPreCompact   = "powershell -NoProfile -NonInteractive -Command `"Set-Location '$MemoryCompilerDir'; uv run python hooks/pre-compact.py`""

if (-not (Test-Path $SettingsFile)) {
    Write-Host "  settings.json не найден — создаём базовый..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Force -Path $ClaudeDir | Out-Null
    @{ hooks = @{} } | ConvertTo-Json -Depth 10 | Set-Content $SettingsFile -Encoding UTF8
}

$settings = Get-Content $SettingsFile -Raw | ConvertFrom-Json

# Функция добавления хука если его нет
function Add-Hook {
    param($Settings, [string]$Event, [string]$Command, [int]$Timeout = 30)
    if (-not $Settings.hooks.$Event) {
        $Settings.hooks | Add-Member -NotePropertyName $Event -NotePropertyValue @() -Force
    }
    $exists = $Settings.hooks.$Event | Where-Object { $_.hooks.command -eq $Command }
    if (-not $exists) {
        $Settings.hooks.$Event += @{ hooks = @(@{ type = "command"; command = $Command; timeout = $Timeout }) }
        return $true
    }
    return $false
}

$changed = $false
$changed = (Add-Hook $settings "SessionStart" $HookSessionStart 15) -or $changed
$changed = (Add-Hook $settings "SessionEnd"   $HookSessionEnd   30) -or $changed
$changed = (Add-Hook $settings "PreCompact"   $HookPreCompact   30) -or $changed

if ($changed) {
    $settings | ConvertTo-Json -Depth 10 | Set-Content $SettingsFile -Encoding UTF8
    Write-Host "  Хуки добавлены в settings.json" -ForegroundColor Green
} else {
    Write-Host "  Хуки уже настроены, пропускаем" -ForegroundColor Gray
}

# ─── Готово ────────────────────────────────────────────────────────────────
Write-Host ""
Write-Host "=== Готово! ===" -ForegroundColor Green
Write-Host ""
Write-Host "Следующие шаги:" -ForegroundColor Cyan
Write-Host "  1. Установи Claude Code если ещё нет: npm install -g @anthropic-ai/claude-code"
Write-Host "  2. Войди в аккаунт: claude auth"
Write-Host "  3. Установи peon-ping: claude plugin install peon-ping"
Write-Host "  4. Открой Obsidian → Open Vault → укажи папку:"
Write-Host "     $VaultDir"
Write-Host ""

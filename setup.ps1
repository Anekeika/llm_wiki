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

# ─── 3. Применение патчей из patches/ ─────────────────────────────────────
Write-Host "[3/4] Применение патчей (vault paths + git sync)..." -ForegroundColor Yellow

$PatchesDir = Join-Path $RepoRoot "patches"

# Патчи хранятся как полные файлы в patches/ — просто копируем поверх submodule
Copy-Item (Join-Path $PatchesDir "flush.py")         (Join-Path $MemoryCompilerDir "scripts\flush.py")        -Force
Copy-Item (Join-Path $PatchesDir "session-start.py") (Join-Path $MemoryCompilerDir "hooks\session-start.py")  -Force

Write-Host "  flush.py — OK" -ForegroundColor Green
Write-Host "  session-start.py — OK" -ForegroundColor Green

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

# setup.ps1 — Настройка wiki на новой машине (Windows)
# Запуск: powershell -ExecutionPolicy Bypass -File setup.ps1
# Или из PowerShell: .\setup.ps1

$ErrorActionPreference = "Stop"
$RepoRoot = $PSScriptRoot
$MemoryCompilerDir = Join-Path $RepoRoot "memory-compiler"
$VaultDir = Join-Path $RepoRoot "vault"
$ClaudeDir = Join-Path $env:USERPROFILE ".claude"
$SettingsFile = Join-Path $ClaudeDir "settings.json"

Write-Host ""
Write-Host "=== Wiki Setup ===" -ForegroundColor Cyan
Write-Host "Repo: $RepoRoot"
Write-Host ""

# ─── 1. Python зависимости ─────────────────────────────────────────────────
Write-Host "[1/2] Установка Python зависимостей (uv sync)..." -ForegroundColor Yellow
if (-not (Get-Command uv -ErrorAction SilentlyContinue)) {
    Write-Host "  uv не найден. Установка..." -ForegroundColor Yellow
    Invoke-RestMethod https://astral.sh/uv/install.ps1 | Invoke-Expression
}
Set-Location $MemoryCompilerDir
uv sync
Set-Location $RepoRoot
Write-Host "  OK" -ForegroundColor Green

# ─── 2. Хуки в ~/.claude/settings.json ────────────────────────────────────
Write-Host "[2/2] Настройка хуков Claude Code в settings.json..." -ForegroundColor Yellow

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

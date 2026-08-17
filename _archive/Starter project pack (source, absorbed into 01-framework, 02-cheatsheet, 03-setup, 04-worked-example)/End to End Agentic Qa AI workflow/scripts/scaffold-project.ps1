param(
  [Parameter(Mandatory = $true)]
  [string]$Target,
  [string]$Source = (Split-Path -Parent (Split-Path -Parent $PSCommandPath))
)

$ErrorActionPreference = "Stop"

Write-Host "╔══════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║   Project Scaffold — Agentic QA Init    ║" -ForegroundColor Cyan
Write-Host "╚══════════════════════════════════════════╝" -ForegroundColor Cyan

# Resolve paths
$targetPath = Resolve-Path $Target -ErrorAction SilentlyContinue
if (-not $targetPath) {
  $targetPath = New-Item -ItemType Directory -Path $Target -Force | Select-Object -ExpandProperty FullName
} else {
  $targetPath = $targetPath.Path
}

$sourceName = Split-Path $Source -Leaf
$targetStarterPath = Join-Path $targetPath $sourceName

Write-Host "`nSource: $Source" -ForegroundColor White
Write-Host "Target: $targetStarterPath" -ForegroundColor White

# ── Step 1: Copy entire folder ──
Write-Host "`n==> Copying starter pack to project..." -ForegroundColor Green
if (Test-Path $targetStarterPath) {
  Write-Host "  ⚠️  Target already exists at $targetStarterPath. Remove it first or choose a different target." -ForegroundColor Yellow
  exit 1
}

Copy-Item -LiteralPath $Source -Destination $targetStarterPath -Recurse -Force

# Remove artifacts that don't belong in a fresh project
$toRemove = @(
  "AgentE2EQAWorkflow-Playwright-main.zip",
  "AgentE2EQAWorkflow-Playwright-main"
)
foreach ($item in $toRemove) {
  $itemPath = Join-Path $targetStarterPath $item
  if (Test-Path $itemPath) {
    Remove-Item -LiteralPath $itemPath -Recurse -Force -ErrorAction SilentlyContinue
  }
}

Write-Host "  ✅ Copied to $targetStarterPath" -ForegroundColor Green

# ── Step 2: Create qa-config.json from template ──
Write-Host "`n==> Creating qa-config.json..." -ForegroundColor Green
$templatePath = Join-Path $targetStarterPath "QA_CONFIG_TEMPLATE.json"
$configPath = Join-Path $targetStarterPath "qa-config.json"
if (Test-Path $templatePath) {
  Copy-Item $templatePath $configPath
  Write-Host "  ✅ Created qa-config.json — edit it with your project's values" -ForegroundColor Green
}

# ── Step 3: Create .env from .env.example ──
Write-Host "`n==> Setting up .env..." -ForegroundColor Green
$examplePath = Join-Path $targetStarterPath ".env.example"
$envPath = Join-Path $targetStarterPath ".env"
if (Test-Path $examplePath) {
  Copy-Item $examplePath $envPath
  Write-Host "  ✅ Created .env — fill in APP_URL, TEST_USERNAME, TEST_PASSWORD" -ForegroundColor Green
}

# ── Step 4: Initialize state files ──
Write-Host "`n==> Initializing state files..." -ForegroundColor Green
$qaStatePath = Join-Path $targetStarterPath "qa-state.json"
@"
{
  "last_updated": "$(Get-Date -Format 'yyyy-MM-dd')",
  "stories_tested": [],
  "total_test_suites": 0,
  "total_individual_tests": 0,
  "latest_pass_rate": null,
  "last_audit_date": null,
  "last_audit_result": null,
  "healed_tests_total": 0,
  "healed_tests_this_run": 0,
  "escalated_patterns_total": 0,
  "flaky_tests": [],
  "untested_stories": []
}
"@ | Set-Content $qaStatePath -Encoding UTF8

$telemetryPath = Join-Path $targetStarterPath "TELEMETRY_LOG.ndjson"
Set-Content $telemetryPath "" -Encoding UTF8

Write-Host "  ✅ qa-state.json initialized" -ForegroundColor Green
Write-Host "  ✅ TELEMETRY_LOG.ndjson initialized (empty)" -ForegroundColor Green

# ── Step 5: Launch installer as admin ──
Write-Host "`n==> Launching Playwright installer as admin..." -ForegroundColor Green
$installerPath = Join-Path $targetStarterPath "scripts\install-playwright-agents.ps1"

try {
  Start-Process powershell.exe -Verb RunAs -ArgumentList "-NoExit", "-File", "`"$installerPath`"", "-ProjectDir", "`"$targetStarterPath`""
  Write-Host "  ✅ Installer launched in a new elevated window" -ForegroundColor Green
} catch {
  Write-Host "  ⚠️  Could not launch as admin: $_" -ForegroundColor Yellow
  Write-Host "  Run this manually as Administrator:" -ForegroundColor Yellow
  Write-Host "    powershell.exe -File `"$installerPath`" -ProjectDir `"$targetStarterPath`"" -ForegroundColor Yellow
}

# ── Summary ──
Write-Host "`n═══════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  ✅ PROJECT SCAFFOLDED" -ForegroundColor Green
Write-Host "═══════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  Location:   $targetStarterPath" -ForegroundColor White
Write-Host "`n  Files to customize:" -ForegroundColor Yellow
Write-Host "  1. 📝 qa-config.json        → story ID, URLs, selectors, test data" -ForegroundColor Yellow
Write-Host "  2. 📝 .env                  → APP_URL, TEST_USERNAME, TEST_PASSWORD" -ForegroundColor Yellow
Write-Host "  3. 📝 user-stories/         → write your story files here" -ForegroundColor Yellow
Write-Host "`n  Then, in your AI tool, say:" -ForegroundColor Cyan
Write-Host "  "I want to QA story [STORY_ID]. Read SESSION_START.md and begin."" -ForegroundColor White
Write-Host "═══════════════════════════════════════════`n" -ForegroundColor Cyan

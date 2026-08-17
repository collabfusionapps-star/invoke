param(
  [Parameter(Mandatory = $true)]
  [string]$Target,
  [string]$Source = ""
)

# ── /init — Scaffold a new project from the Agentic Coding Framework ──
# $PSScriptRoot is 03-setup/ — the framework root is one level up from here.
if ([string]::IsNullOrEmpty($Source)) {
  $Source = Split-Path -Parent $PSScriptRoot
}
Write-Host @"

  /init — Agentic Project Scaffold

  Source: $Source
  Target: $Target

  This will:
    1. Copy the framework (01-framework, 02-cheatsheet, 03-setup) and the
       QA worked example (04-worked-example) into your project
    2. Create qa-config.json from template (in 04-worked-example/)
    3. Create .env from .env.example (in 04-worked-example/)
    4. Initialize QA state files
    5. Launch Playwright installer as administrator

"@ -ForegroundColor Cyan

$confirm = Read-Host "Proceed? (y/n)"
if ($confirm -ne "y") {
  Write-Host "Aborted." -ForegroundColor Yellow
  exit
}

& "$PSScriptRoot\scripts\scaffold-project.ps1" -Target $Target -Source $Source

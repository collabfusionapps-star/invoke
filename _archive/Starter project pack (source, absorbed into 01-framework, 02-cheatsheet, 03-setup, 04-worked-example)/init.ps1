param(
  [Parameter(Mandatory = $true)]
  [string]$Target,
  [string]$Source = ""
)

# ── /init — Scaffold a new project from the starter pack ──
if ([string]::IsNullOrEmpty($Source)) {
  $Source = $PSScriptRoot
}
Write-Host @"

  /init — Agentic Project Scaffold

  Source: $Source
  Target: $Target

  This will:
    1. Copy the starter pack into your project
    2. Create qa-config.json from template
    3. Create .env from .env.example
    4. Initialize QA state files
    5. Launch Playwright installer as administrator

"@ -ForegroundColor Cyan

$confirm = Read-Host "Proceed? (y/n)"
if ($confirm -ne "y") {
  Write-Host "Aborted." -ForegroundColor Yellow
  exit
}

& "$Source\End to End Agentic Qa AI workflow\scripts\scaffold-project.ps1" -Target $Target -Source $Source

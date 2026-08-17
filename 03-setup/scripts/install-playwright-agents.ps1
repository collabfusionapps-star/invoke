param(
  [string]$Platform = "auto",
  [string]$ProjectDir = (Get-Location).Path
)

# ── Self-elevate if not admin ──
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
  Write-Host "⏫ Not running as admin. Re-launching with elevation..." -ForegroundColor Yellow
  Start-Process powershell.exe -Verb RunAs -ArgumentList "-NoExit", "-File", "`"$PSCommandPath`"", "-Platform", "`"$Platform`"", "-ProjectDir", "`"$ProjectDir`""
  exit
}

function Detect-Platform {
  if ($Platform -ne "auto") { return $Platform }

  if ($env:OPENCODE_INTERNAL -or (Test-Path "$env:USERPROFILE\.config\opencode\opencode.json")) {
    return "opencode"
  }
  if ($env:CLAUDE_CODE_INTERNAL -or (Test-Path "$env:APPDATA\Claude\claude_desktop_config.json") -or (Test-Path "$env:HOME\Library\Application Support\Claude\claude_desktop_config.json")) {
    return "claude"
  }
  if ($env:VSCODE_INJECTED -or (Test-Path ".vscode\launch.json") -or (Test-Path ".vscode\tasks.json")) {
    return "vscode"
  }

  Write-Host "Could not auto-detect platform. Select one:" -ForegroundColor Yellow
  Write-Host "  1) OpenCode" -ForegroundColor Cyan
  Write-Host "  2) Claude Code" -ForegroundColor Cyan
  Write-Host "  3) VS Code" -ForegroundColor Cyan
  $choice = Read-Host "Enter 1, 2, or 3"
  switch ($choice) {
    "1" { return "opencode" }
    "2" { return "claude" }
    "3" { return "vscode" }
    default { throw "Invalid selection" }
  }
}

function Install-McpServer {
  param([string]$Platform)

  Write-Host "`n==> Installing Playwright MCP Server (@playwright/mcp)..." -ForegroundColor Green

  switch ($Platform) {
    "opencode" {
      $configPath = "$env:USERPROFILE\.config\opencode\opencode.json"
      if (Test-Path $configPath) {
        $config = Get-Content $configPath -Raw | ConvertFrom-Json
        if (-not $config.mcpServers) { $config | Add-Member -NotePropertyName "mcpServers" -NotePropertyValue @{} }
        if (-not $config.mcpServers.playwright) {
          $config.mcpServers | Add-Member -NotePropertyName "playwright" -NotePropertyValue @{
            command = "npx"
            args = @("@playwright/mcp@latest")
          }
          $config | ConvertTo-Json -Depth 10 | Set-Content $configPath
          Write-Host "  ✅ Added @playwright/mcp to opencode.json" -ForegroundColor Green
        } else {
          Write-Host "  ⏭️  @playwright/mcp already configured in opencode.json" -ForegroundColor Yellow
        }
      } else {
        Write-Host "  ⚠️  opencode.json not found at $configPath. Install manually: add @playwright/mcp to your mcpServers." -ForegroundColor Yellow
      }
    }
    "claude" {
      $possiblePaths = @(
        "$env:APPDATA\Claude\claude_desktop_config.json",
        "$env:HOME\Library\Application Support\Claude\claude_desktop_config.json"
      )
      $found = $false
      foreach ($p in $possiblePaths) {
        if (Test-Path $p) {
          $config = Get-Content $p -Raw | ConvertFrom-Json
          if (-not $config.mcpServers) { $config | Add-Member -NotePropertyName "mcpServers" -NotePropertyValue @{} }
          if (-not $config.mcpServers.playwright) {
            $config.mcpServers | Add-Member -NotePropertyName "playwright" -NotePropertyValue @{
              command = "npx"
              args = @("@playwright/mcp@latest")
            }
            $config | ConvertTo-Json -Depth 10 | Set-Content $p
            Write-Host "  ✅ Added @playwright/mcp to Claude config" -ForegroundColor Green
          } else {
            Write-Host "  ⏭️  @playwright/mcp already configured in Claude" -ForegroundColor Yellow
          }
          $found = $true
          break
        }
      }
      if (-not $found) {
        Write-Host "  ⚠️  Claude config not found. Create manually." -ForegroundColor Yellow
      }
    }
    "vscode" {
      $vscodeDir = Join-Path $ProjectDir ".vscode"
      if (-not (Test-Path $vscodeDir)) { New-Item -ItemType Directory -Path $vscodeDir -Force | Out-Null }
      $mcpPath = Join-Path $vscodeDir "mcp.json"
      $config = @{}
      if (Test-Path $mcpPath) { $config = Get-Content $mcpPath -Raw | ConvertFrom-Json }
      if (-not $config.mcpServers) { $config | Add-Member -NotePropertyName "mcpServers" -NotePropertyValue @{} }
      if (-not $config.mcpServers.playwright) {
        $config.mcpServers | Add-Member -NotePropertyName "playwright" -NotePropertyValue @{
          command = "npx"
          args = @("@playwright/mcp@latest")
        }
        $config | ConvertTo-Json -Depth 10 | Set-Content $mcpPath
        Write-Host "  ✅ Added @playwright/mcp to .vscode/mcp.json" -ForegroundColor Green
      } else {
        Write-Host "  ⏭️  @playwright/mcp already configured in .vscode/mcp.json" -ForegroundColor Yellow
      }
    }
  }
}

function Install-AgentDefinitions {
  param([string]$Platform)

  Write-Host "`n==> Installing Playwright Test Agents (planner, generator, healer)..." -ForegroundColor Green
  Write-Host "  Running: npx playwright init-agents --loop=$Platform" -ForegroundColor Cyan

  $originalDir = Get-Location
  Set-Location $ProjectDir

  try {
    $output = & npx playwright init-agents --loop=$Platform 2>&1 | Out-String
    Write-Host $output
    if ($LASTEXITCODE -eq 0) {
      Write-Host "  ✅ Agent definitions generated in .github/" -ForegroundColor Green
    } else {
      Write-Host "  ⚠️  Agent installation had issues (exit code: $LASTEXITCODE)" -ForegroundColor Yellow
      Write-Host "  The project may need 'npm init' or 'npm install @playwright/test' first." -ForegroundColor Yellow
    }
  } catch {
    Write-Host "  ⚠️  Error running init-agents: $_" -ForegroundColor Yellow
    Write-Host "  Ensure Node.js and npx are installed." -ForegroundColor Yellow
  } finally {
    Set-Location $originalDir
  }
}

function Ensure-DotEnv {
  Write-Host "`n==> Checking .env file..." -ForegroundColor Green
  $examplePath = Join-Path $ProjectDir ".env.example"
  $envPath = Join-Path $ProjectDir ".env"

  if (Test-Path $envPath) {
    Write-Host "  ✅ .env found" -ForegroundColor Green
    return
  }

  if (Test-Path $examplePath) {
    Copy-Item $examplePath $envPath
    Write-Host "  ⚠️  Created .env from .env.example — fill in your actual values before running the workflow" -ForegroundColor Yellow
  } else {
    Write-Host "  ⚠️  No .env or .env.example found. Create .env manually with APP_URL, TEST_USERNAME, TEST_PASSWORD" -ForegroundColor Yellow
  }
}

function Show-Summary {
  param([string]$Platform)

  Write-Host "`n═══════════════════════════════════════════" -ForegroundColor Cyan
  Write-Host "  ✅ PLAYWRIGHT QA WORKFLOW INSTALLED" -ForegroundColor Green
  Write-Host "═══════════════════════════════════════════" -ForegroundColor Cyan
  Write-Host "  Platform:       $Platform" -ForegroundColor White
  Write-Host "  Project:        $ProjectDir" -ForegroundColor White
  Write-Host "  MCP Server:     @playwright/mcp" -ForegroundColor White
  Write-Host "  Agents:         planner | generator | healer" -ForegroundColor White
  Write-Host "  Agent defs:     .github/" -ForegroundColor White
  Write-Host "`n  Next steps:" -ForegroundColor Yellow
  Write-Host "  1. Copy QA_CONFIG_TEMPLATE.json → qa-config.json and fill in your values" -ForegroundColor Yellow
  Write-Host "  2. Place your user story in user-stories/[STORY_ID].md" -ForegroundColor Yellow
  Write-Host "  3. Ask your AI agent to execute the workflow per TEMPLATE_prompt_workflow.md" -ForegroundColor Yellow
  Write-Host "═══════════════════════════════════════════`n" -ForegroundColor Cyan
}

# ── Main ──────────────────────────────────────────────
Write-Host "╔══════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║   Playwright Agentic QA Workflow Setup   ║" -ForegroundColor Cyan
Write-Host "╚══════════════════════════════════════════╝" -ForegroundColor Cyan

$detectedPlatform = Detect-Platform
Write-Host "Detected platform: $detectedPlatform" -ForegroundColor Cyan

Install-McpServer -Platform $detectedPlatform
Install-AgentDefinitions -Platform $detectedPlatform
Ensure-DotEnv
Show-Summary -Platform $detectedPlatform

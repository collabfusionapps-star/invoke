#!/usr/bin/env bash
set -euo pipefail

PLATFORM="${1:-auto}"
PROJECT_DIR="${2:-$(pwd)}"

detect_platform() {
  if [ "$PLATFORM" != "auto" ]; then
    echo "$PLATFORM"
    return
  fi

  if [ -n "${OPENCODE_INTERNAL:-}" ] || [ -f "$HOME/.config/opencode/opencode.json" ]; then
    echo "opencode"
    return
  fi

  if [ -n "${CLAUDE_CODE_INTERNAL:-}" ] || [ -f "$HOME/Library/Application Support/Claude/claude_desktop_config.json" ]; then
    echo "claude"
    return
  fi

  if [ -n "${VSCODE_INJECTED:-}" ] || [ -f ".vscode/launch.json" ] || [ -f ".vscode/tasks.json" ]; then
    echo "vscode"
    return
  fi

  echo ""
}

install_mcp_server() {
  local platform="$1"
  echo ""
  echo "==> Installing Playwright MCP Server (@playwright/mcp)..."

  case "$platform" in
    opencode)
      local config_file="$HOME/.config/opencode/opencode.json"
      if [ -f "$config_file" ]; then
        if ! grep -q '"@playwright/mcp"' "$config_file" 2>/dev/null; then
          echo "  Please manually add @playwright/mcp to your opencode.json mcpServers:"
          echo '    { "command": "npx", "args": ["@playwright/mcp@latest"] }'
        else
          echo "  OK @playwright/mcp already configured"
        fi
      else
        echo "  WARNING: opencode.json not found. Add manually."
      fi
      ;;
    claude)
      local config_file="$HOME/Library/Application Support/Claude/claude_desktop_config.json"
      if [ -f "$config_file" ]; then
        if ! grep -q '"@playwright/mcp"' "$config_file" 2>/dev/null; then
          echo "  Please manually add @playwright/mcp to your Claude config:"
          echo '    { "mcpServers": { "playwright": { "command": "npx", "args": ["@playwright/mcp@latest"] } } }'
        else
          echo "  OK @playwright/mcp already configured"
        fi
      else
        echo "  WARNING: Claude config not found."
      fi
      ;;
    vscode)
      local mcp_dir="$PROJECT_DIR/.vscode"
      local mcp_file="$mcp_dir/mcp.json"
      mkdir -p "$mcp_dir"
      if [ ! -f "$mcp_file" ] || ! grep -q '"@playwright/mcp"' "$mcp_file" 2>/dev/null; then
        cat > "$mcp_file" << 'EOF'
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": ["@playwright/mcp@latest"]
    }
  }
}
EOF
        echo "  OK Added @playwright/mcp to .vscode/mcp.json"
      else
        echo "  OK @playwright/mcp already configured"
      fi
      ;;
  esac
}

install_agent_definitions() {
  local platform="$1"
  echo ""
  echo "==> Installing Playwright Test Agents (planner, generator, healer)..."
  echo "  Running: npx playwright init-agents --loop=$platform"

  pushd "$PROJECT_DIR" > /dev/null 2>&1 || true
  if npx playwright init-agents --loop="$platform"; then
    echo "  OK Agent definitions generated in .github/"
  else
    echo "  WARNING: Agent init had issues. Ensure 'npm init' and 'npm install @playwright/test' are done first."
  fi
  popd > /dev/null 2>&1 || true
}

ensure_dotenv() {
  echo ""
  echo "==> Checking .env file..."

  if [ -f "$PROJECT_DIR/.env" ]; then
    echo "  OK .env found"
    return
  fi

  if [ -f "$PROJECT_DIR/.env.example" ]; then
    cp "$PROJECT_DIR/.env.example" "$PROJECT_DIR/.env"
    echo "  WARNING: Created .env from .env.example -- fill in your actual values before running the workflow"
  else
    echo "  WARNING: No .env or .env.example found. Create .env manually with APP_URL, TEST_USERNAME, TEST_PASSWORD"
  fi
}

show_summary() {
  local platform="$1"
  echo ""
  echo "==========================================="
  echo "  OK PLAYWRIGHT QA WORKFLOW INSTALLED"
  echo "==========================================="
  echo "  Platform:       $platform"
  echo "  Project:        $PROJECT_DIR"
  echo "  MCP Server:     @playwright/mcp"
  echo "  Agents:         planner | generator | healer"
  echo "  Agent defs:     .github/"
  echo ""
  echo "  Next steps:"
  echo "  1. Copy QA_CONFIG_TEMPLATE.json -> qa-config.json and fill in your values"
  echo "  2. Place your user story in user-stories/[STORY_ID].md"
  echo "  3. Ask your AI agent to execute the workflow per TEMPLATE_prompt_workflow.md"
  echo "==========================================="
  echo ""
}

# ---- Main ----
echo "==========================================="
echo "   Playwright Agentic QA Workflow Setup"
echo "==========================================="

DETECTED=$(detect_platform)
if [ -z "$DETECTED" ]; then
  echo "Could not auto-detect platform."
  echo "Select: opencode, claude, or vscode"
  read -rp "Platform: " DETECTED
fi

echo "Detected platform: $DETECTED"
install_mcp_server "$DETECTED"
install_agent_definitions "$DETECTED"
ensure_dotenv
show_summary "$DETECTED"

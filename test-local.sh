#!/bin/bash
# Test the profile GIF generation locally using the CI config
# Usage: ./test-local.sh
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
TEST_DIR="/tmp/profile-gif-test"

echo "🧹 Cleaning up previous test..."
rm -rf "$TEST_DIR"
mkdir -p "$TEST_DIR/config" "$TEST_DIR/data"

echo "📦 Setting up CI-like neovim config..."
cp -r "$REPO_DIR/config/nvim" "$TEST_DIR/config/nvim"

echo "⭐ Setting up starship config..."
mkdir -p "$TEST_DIR/config"
cp "$REPO_DIR/config/starship.toml" "$TEST_DIR/config/starship.toml"

echo "📊 Generating stats data..."
bash "$REPO_DIR/scripts/generate-stats.sh" YousefHadder
# Copy generated data into the repo dir (VHS runs from repo root)
cp -r "$REPO_DIR/data" "$REPO_DIR/data" 2>/dev/null || true

echo "🔌 Pre-installing neovim plugins..."
XDG_CONFIG_HOME="$TEST_DIR/config" \
XDG_DATA_HOME="$TEST_DIR/data" \
XDG_STATE_HOME="$TEST_DIR/state" \
  nvim --headless "+Lazy! sync" +qa 2>/dev/null || true

XDG_CONFIG_HOME="$TEST_DIR/config" \
XDG_DATA_HOME="$TEST_DIR/data" \
XDG_STATE_HOME="$TEST_DIR/state" \
  nvim --headless "+Lazy! sync" +qa 2>/dev/null || true

echo "🎬 Running VHS (this takes ~2 minutes)..."
# Export XDG vars so VHS inherits them for all spawned shells
export XDG_CONFIG_HOME="$TEST_DIR/config"
export XDG_DATA_HOME="$TEST_DIR/data"
export XDG_STATE_HOME="$TEST_DIR/state"
export STARSHIP_CONFIG="$TEST_DIR/config/starship.toml"

cd "$REPO_DIR"
vhs profile.tape

echo ""
echo "✅ Done! GIF saved to: $REPO_DIR/profile.gif"
echo "   Open it with: open $REPO_DIR/profile.gif"

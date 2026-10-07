#!/usr/bin/env bash
# Install the "learn" skill for Claude Code, Codex and OpenCode.
set -euo pipefail

NAME=learn
SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

CLAUDE_SKILL="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/skills/$NAME"
# Codex and OpenCode both read skills from ~/.agents/skills.
AGENTS_SKILL="$HOME/.agents/skills/$NAME"
OPENCODE_CMD="${XDG_CONFIG_HOME:-$HOME/.config}/opencode/commands/$NAME.md"

usage() {
  cat <<EOF
Usage: ./install.sh [--claude] [--codex] [--opencode] [--uninstall]

With no tool flags, installs for all three.

  --claude     Claude Code   -> $CLAUDE_SKILL   (use: /learn)
  --codex      Codex         -> $AGENTS_SKILL   (use: \$learn)
  --opencode   OpenCode      -> $AGENTS_SKILL
                              + $OPENCODE_CMD   (use: /learn)
  --uninstall  Remove instead of install
EOF
}

claude=false codex=false opencode=false uninstall=false
for arg in "$@"; do
  case "$arg" in
    --claude) claude=true ;;
    --codex) codex=true ;;
    --opencode) opencode=true ;;
    --uninstall) uninstall=true ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $arg" >&2; usage >&2; exit 1 ;;
  esac
done
if ! $claude && ! $codex && ! $opencode; then
  claude=true codex=true opencode=true
fi

# Refuse to touch a directory that holds some other skill.
check_ours() {
  local dest="$1"
  if [[ -e "$dest" ]] && ! grep -q "^name: $NAME$" "$dest/SKILL.md" 2>/dev/null; then
    echo "Error: $dest exists and is not this skill. Remove it first." >&2
    exit 1
  fi
}

install_skill() {
  local dest="$1"
  check_ours "$dest"
  rm -rf "$dest"
  mkdir -p "$dest"
  cp "$SRC/SKILL.md" "$dest/"
  cp -r "$SRC/references" "$dest/"
  echo "Installed skill    $dest"
}

remove_skill() {
  local dest="$1"
  [[ -e "$dest" ]] || return 0
  check_ours "$dest"
  rm -rf "$dest"
  echo "Removed skill      $dest"
}

if $uninstall; then
  $claude && remove_skill "$CLAUDE_SKILL"
  if $codex || $opencode; then remove_skill "$AGENTS_SKILL"; fi
  if $opencode && [[ -e "$OPENCODE_CMD" ]]; then
    rm -f "$OPENCODE_CMD"
    echo "Removed command    $OPENCODE_CMD"
  fi
  exit 0
fi

$claude && install_skill "$CLAUDE_SKILL"
if $codex || $opencode; then install_skill "$AGENTS_SKILL"; fi
if $opencode; then
  mkdir -p "$(dirname "$OPENCODE_CMD")"
  cp "$SRC/opencode/commands/$NAME.md" "$OPENCODE_CMD"
  echo "Installed command  $OPENCODE_CMD"
fi

echo
$claude && echo "Claude Code: type /learn"
$codex && echo "Codex:       type \$learn (Codex has no custom slash commands)"
$opencode && echo "OpenCode:    type /learn"
echo "Restart the tool if it was already running."

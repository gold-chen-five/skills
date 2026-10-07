#!/usr/bin/env bash
# Install skills from this repo for Claude Code, Codex and OpenCode, one at a time.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$REPO/skills"

CLAUDE_SKILLS="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/skills"
# Codex and OpenCode both read skills from ~/.agents/skills.
AGENTS_SKILLS="$HOME/.agents/skills"
OPENCODE_COMMANDS="${XDG_CONFIG_HOME:-$HOME/.config}/opencode/commands"

available() {
  local dir
  for dir in "$SKILLS_DIR"/*/; do
    [[ -f "$dir/SKILL.md" ]] && basename "$dir"
  done
}

usage() {
  cat <<EOF
Usage: ./install.sh <skill>... [--claude] [--codex] [--opencode] [--uninstall]
       ./install.sh --all [flags]
       ./install.sh --list

Installs only the skills you name. With no tool flags, installs for all three tools.

  --claude     Claude Code -> $CLAUDE_SKILLS/<skill>          (use: /<skill>)
  --codex      Codex       -> $AGENTS_SKILLS/<skill>          (use: \$<skill>)
  --opencode   OpenCode    -> $AGENTS_SKILLS/<skill>
                            + $OPENCODE_COMMANDS/<skill>.md   (use: /<skill>)
  --all        Every skill in this repo
  --list       Show the available skills
  --uninstall  Remove instead of install

Available skills:
$(available | sed 's/^/  /')
EOF
}

claude=false codex=false opencode=false uninstall=false all=false
names=()
for arg in "$@"; do
  case "$arg" in
    --claude) claude=true ;;
    --codex) codex=true ;;
    --opencode) opencode=true ;;
    --uninstall) uninstall=true ;;
    --all) all=true ;;
    --list) available; exit 0 ;;
    -h|--help) usage; exit 0 ;;
    -*) echo "Unknown option: $arg" >&2; usage >&2; exit 1 ;;
    *) names+=("$arg") ;;
  esac
done

if $all; then
  mapfile -t names < <(available)
fi
if [[ ${#names[@]} -eq 0 ]]; then
  usage
  exit 1
fi
if ! $claude && ! $codex && ! $opencode; then
  claude=true codex=true opencode=true
fi

# Skill names are used in paths, so only accept real skills with safe names.
for name in "${names[@]}"; do
  if [[ ! "$name" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]] || [[ ! -f "$SKILLS_DIR/$name/SKILL.md" ]]; then
    echo "Unknown skill: $name" >&2
    echo "Available: $(available | tr '\n' ' ')" >&2
    exit 1
  fi
done

# Refuse to touch a directory that holds some other skill.
check_ours() {
  local dest="$1" name="$2"
  if [[ -e "$dest" ]] && ! grep -q "^name: $name$" "$dest/SKILL.md" 2>/dev/null; then
    echo "Error: $dest exists and is not the '$name' skill from this repo. Remove it first." >&2
    exit 1
  fi
}

install_skill() {
  local dest="$1/$2" name="$2"
  check_ours "$dest" "$name"
  rm -rf "$dest"
  mkdir -p "$dest"
  cp -R "$SKILLS_DIR/$name/." "$dest/"
  rm -f "$dest/README.md"
  echo "Installed skill    $dest"
}

remove_skill() {
  local dest="$1/$2" name="$2"
  [[ -e "$dest" ]] || return 0
  check_ours "$dest" "$name"
  rm -rf "$dest"
  echo "Removed skill      $dest"
}

# OpenCode can't run a skill as a slash command, so give it a command that loads the skill.
install_opencode_command() {
  local name="$1" file="$OPENCODE_COMMANDS/$1.md"
  mkdir -p "$OPENCODE_COMMANDS"
  cat > "$file" <<EOF
---
description: Use the $name skill
---
Load the \`$name\` skill with the skill tool and follow it for the rest of this session.

\$ARGUMENTS
EOF
  echo "Installed command  $file"
}

for name in "${names[@]}"; do
  if $uninstall; then
    $claude && remove_skill "$CLAUDE_SKILLS" "$name"
    if $codex || $opencode; then remove_skill "$AGENTS_SKILLS" "$name"; fi
    if $opencode && [[ -e "$OPENCODE_COMMANDS/$name.md" ]]; then
      rm -f "$OPENCODE_COMMANDS/$name.md"
      echo "Removed command    $OPENCODE_COMMANDS/$name.md"
    fi
  else
    $claude && install_skill "$CLAUDE_SKILLS" "$name"
    if $codex || $opencode; then install_skill "$AGENTS_SKILLS" "$name"; fi
    $opencode && install_opencode_command "$name"
  fi
done

$uninstall && exit 0
echo
for name in "${names[@]}"; do
  $claude && echo "Claude Code: /$name"
  $codex && echo "Codex:       \$$name"
  $opencode && echo "OpenCode:    /$name"
done
echo "Restart the tool if it was already running."

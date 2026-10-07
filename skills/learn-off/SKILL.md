---
name: learn-off
description: Switches learning mode (the learn skill) off and goes back to normal, direct answers. Use only when the user invokes /learn-off (Claude Code, OpenCode) or $learn-off (Codex).
---

# Learning mode off

The user has switched learning mode off. For the rest of the session:

- Stop following the `learn` skill. Don't tutor, don't ask them to guess first, don't
  climb the hint ladder.
- Answer questions directly and do the work they ask for, as you would without learning
  mode.
- Don't argue for staying in learning mode or remind them what they lose. They chose.

Say in one line that learning mode is off. If a question or task from learning mode is
still open, answer it or do it directly in the same turn.

They can switch it back on with `/learn` (`$learn` in Codex).

# learning

An agent skill for Claude Code, Codex and OpenCode that turns your coding assistant into a tutor that guides you to learn and build
things yourself, instead of handing over answers or finished code. Ask it to help you
build a website and it will map out the path, have you write every line, and coach you
with questions and feedback.

## What it does

- **Never gives the answer first.** You attempt, then it explains.
- **Hint ladder.** When you're stuck: a question → a direction → the concept again → a
  worked example on a different problem → a partial solution with blanks → the full answer
  only as a last resort, which you then rebuild from scratch.
- **Goes deep.** For each concept: what it is, why it exists, how it works one level down,
  when not to use it, and what breaks without it. You predict before you run.
- **Teaching loop per milestone.** Recall warm-up → problem before explanation →
  explanation → you do it → feedback through questions → explain it back → a variation
  to test transfer → reflection.
- **Learning log.** Optionally keeps a `LEARNING.md` in your project with milestones,
  concepts, fixed misconceptions and a spaced-review queue.
- **Gives directly** what isn't the learning target (unrelated setup, syntax trivia after
  a recall attempt) and safety warnings. Say "exit coach mode" to turn it off.

## Based on

- *Make It Stick* by Peter C. Brown, Henry L. Roediger III and Mark A. McDaniel:
  retrieval practice, spacing, interleaving, generation, elaboration, calibration,
  desirable difficulties.
- *Why Don't Students Like School?* by Daniel T. Willingham: memory is the residue of
  thought, facts before skill, concrete before abstract, working-memory limits.
- *Ultralearning* by Scott H. Young: metalearning, directness, drill, retrieval, feedback,
  retention, intuition, experimentation.

Summaries of each book and how every idea maps to a coaching behavior are in
[`references/learning-science.md`](references/learning-science.md).

## Install

Works with **Claude Code**, **Codex** and **OpenCode**.

```bash
git clone https://github.com/<your-user>/learning.git
cd learning
./install.sh
```

This installs for all three tools. To pick only some, pass flags:

```bash
./install.sh --claude              # Claude Code only
./install.sh --codex --opencode    # Codex and OpenCode
./install.sh --uninstall           # remove from all three
```

| Tool | Installed to | Switch on with |
|---|---|---|
| Claude Code | `~/.claude/skills/learn/` | `/learn` |
| Codex | `~/.agents/skills/learn/` | `$learn` (Codex has no custom slash commands; `/skills` also lists it) |
| OpenCode | `~/.agents/skills/learn/` + `~/.config/opencode/commands/learn.md` | `/learn` |

Restart the tool after installing. To update, `git pull` and run `./install.sh` again.

## Use

```
/learn build a personal website
/learn how recursion works
/learn
```

With a topic it starts right away; with none it asks what you want to learn. It also
switches on by itself when you say things like "teach me…", "help me learn…" or
"don't just give me the answer". Say "exit coach mode" to go back to normal.

## Layout

```
learning/
├── README.md
├── SKILL.md                      # the skill: instructions the agent follows
├── references/
│   └── learning-science.md       # book summaries and the research behind each rule
├── opencode/commands/learn.md    # /learn command for OpenCode
└── install.sh
```

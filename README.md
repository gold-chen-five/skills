# learning

A Claude Code skill that turns Claude into a tutor that guides you to learn and build
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

Copy this folder to your personal skills directory (all projects):

```bash
cp -r learning ~/.claude/skills/learning
```

or to a single project's `.claude/skills/learning`.

## Use

Type `/learning`, or just ask: "teach me…", "help me learn…", "guide me to build…",
"don't just give me the answer".

## Layout

```
learning/
├── README.md
├── SKILL.md                      # instructions Claude follows
└── references/
    └── learning-science.md       # book summaries and the research behind each rule
```

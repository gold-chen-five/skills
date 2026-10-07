# learn

*Learning mode based on **M**ake **I**t **S**tick (MIS).*

Learning mode for **Claude Code**, **Codex** and **OpenCode**, built on
***Make It Stick: The Science of Successful Learning*** (Brown, Roediger & McDaniel, 2014),
the book most often called the gold standard on how people learn.

Type `/learn` and your coding assistant becomes a tutor: it guides you to learn and build
things yourself instead of handing over answers or finished code. Ask it to help you build
a website and it will map out the path, have you write every line, and coach you with
questions and feedback, using the techniques the book shows actually work: retrieval
practice, spacing, interleaving, generation, elaboration and desirable difficulties.

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
  a recall attempt) and safety warnings. Say "exit learning mode" to turn it off.

## Based on

The core is ***Make It Stick*** by Peter C. Brown, Henry L. Roediger III and
Mark A. McDaniel. Roediger and McDaniel are cognitive scientists who study memory, and the
book condenses decades of research into one message: the study habits that feel productive
(rereading, highlighting, cramming) fade fast, while the ones that feel harder last.
The skill puts its techniques to work: retrieval practice, spacing, interleaving,
generation, elaboration, reflection, calibration and desirable difficulties.

Two other books fill in the gaps:

- *Why Don't Students Like School?* by Daniel T. Willingham: memory is the residue of
  thought, facts before skill, concrete before abstract, working-memory limits.
- *Ultralearning* by Scott H. Young: metalearning, directness, drill, retrieval, feedback,
  retention, intuition, experimentation.

Summaries of each book and how every idea maps to a coaching behavior are in
[`references/learning-science.md`](references/learning-science.md).

## Install

```bash
bunx skills add gold-chen-five/skills --skill learn
# or
npx skills add gold-chen-five/skills --skill learn
```

| Tool | Switch on with |
|---|---|
| Claude Code | `/learn` |
| Codex | `$learn` (Codex has no custom slash commands) |
| OpenCode | `/learn` |

## Use

```
/learn build a personal website
/learn how recursion works
/learn
```

With a topic it starts right away; with none it asks what you want to learn. It also
switches on by itself when you say things like "teach me…", "help me learn…" or
"don't just give me the answer". Say "exit learning mode" to go back to normal.

## Files

```
learn/
├── SKILL.md                      # the skill: instructions the agent follows
└── references/
    └── learning-science.md       # book summaries and the research behind each rule
```

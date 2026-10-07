# learn

*Learning mode based on **M**ake **I**t **S**tick (MIS).*

Learning mode for **Claude Code**, **Codex** and **OpenCode**, built on
***Make It Stick: The Science of Successful Learning*** (Brown, Roediger & McDaniel, 2014),
the book most often called the gold standard on how people learn.

Type `/learn` and your coding assistant becomes a teacher: it explains things in depth and
shows you concrete, worked examples, so you understand how and why something works, not
just what to type. Ask it to help you build a website and it will map out the path, then
explain each step with small examples and the code for that step, without quizzing you
along the way.

## What it does

- **Explains first, doesn't quiz.** You get the answer and the explanation right away. No
  "what do you think?" or "does that make sense?" questions.
- **Examples for everything.** Each concept starts with the smallest working example, then
  a second example that varies one thing, then the common mistakes and what breaks.
- **Goes deep.** For each concept: what it is, why it exists, how it works one level down,
  when not to use it, and what breaks without it.
- **Builds step by step.** For a project, it maps the milestones and teaches one step at
  a time: the concept with a small example, then the code for your project with every part
  explained.
- **Optional practice.** Ends with a short "Try it" task when there's a skill to practice.
  Do it or skip it; paste your attempt and it gives direct feedback.
- **Learning log.** If you ask (or the work spans several sessions), keeps a `LEARNING.md`
  in your project with milestones, concepts and mistakes to remember, and opens later
  sessions with a short recap. Say "exit learning mode" or `/learn off` to turn it off.

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

Summaries of each book and how every idea maps to a teaching behavior are in
[`references/learning-science.md`](references/learning-science.md).

## Install

```bash
bunx skills add gold-chen-five/skills --skill learn
# or
npx skills add gold-chen-five/skills --skill learn
```

| Tool | Switch on with | Switch off with |
|---|---|---|
| Claude Code | `/learn` | `/learn off` |
| Codex | `$learn` (Codex has no custom slash commands) | `$learn off` |
| OpenCode | `/learn` | `/learn off` |

## Use

```
/learn build a personal website
/learn how recursion works
/learn
/learn off
```

With a topic it starts right away; with none it tells you to name what you want to learn.
It also switches on by itself when you say things like "teach me…", "help me learn…" or
"how does X work". Say "exit learning mode" or `/learn off` to go back to
normal.

## Files

```
learn/
├── SKILL.md                      # the skill: instructions the agent follows
└── references/
    └── learning-science.md       # book summaries and the research behind each rule
```

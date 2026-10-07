# skills

Agent skills for **Claude Code**, **Codex** and **OpenCode**. Install only the ones you
need.

| Skill | What it does | Use |
|---|---|---|
| [learn](skills/learn) | Learning mode based on *Make It Stick*: a tutor that guides you to learn and build things yourself instead of handing over answers or finished code. | `/learn` |

## Install

```bash
bunx skills add gold-chen-five/skills --skill learn
# or
npx skills add gold-chen-five/skills --skill learn
```

That's it. It asks which tools to install for; pick Claude Code, Codex and/or OpenCode.

| Tool | Switch on with |
|---|---|
| Claude Code | `/learn` |
| Codex | `$learn` (Codex has no custom slash commands) |
| OpenCode | `/learn` |

Update with `bunx skills update` (or `npx skills update`), remove with
`bunx skills remove learn` (or `npx skills remove learn`).

## Adding a skill

Create `skills/<name>/SKILL.md` with `name: <name>` in the frontmatter. The folder name and
`name` must match, in lowercase letters, digits and hyphens. Add a `README.md` next to it
for humans, then add a row to the table above.

## License

[MIT](LICENSE)

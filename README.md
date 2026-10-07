# skills

Agent skills for **Claude Code**, **Codex** and **OpenCode**. Install only the ones you
need.

| Skill | What it does | Use |
|---|---|---|
| [learn](skills/learn) | Learning mode based on *Make It Stick*: a tutor that guides you to learn and build things yourself instead of handing over answers or finished code. | `/learn` |

## Install one skill

```bash
git clone https://github.com/gold-chen-five/skills.git
cd skills
./install.sh learn
```

This installs only `learn`, for all three tools. More options:

```bash
./install.sh --list                # show available skills
./install.sh learn other-skill     # several at once
./install.sh learn --claude        # one tool only: --claude, --codex, --opencode
./install.sh --all                 # every skill
./install.sh learn --uninstall     # remove
```

To update, `git pull` and run the same install command again. Restart the tool after
installing.

### Without cloning

With [skills.sh](https://www.skills.sh):

```bash
npx skills add gold-chen-five/skills --skill learn
```

### Where things go

| Tool | Installed to | Switch on with |
|---|---|---|
| Claude Code | `~/.claude/skills/<skill>/` | `/<skill>` |
| Codex | `~/.agents/skills/<skill>/` | `$<skill>` (Codex has no custom slash commands; `/skills` also lists them) |
| OpenCode | `~/.agents/skills/<skill>/` + `~/.config/opencode/commands/<skill>.md` | `/<skill>` |

The installer only copies files into those folders. It doesn't download anything, run
anything from the skills or use `sudo`, and it won't overwrite a folder that holds a
different skill.

## Adding a skill

Create `skills/<name>/SKILL.md` with `name: <name>` in the frontmatter. The folder name and
`name` must match, in lowercase letters, digits and hyphens. Add a `README.md` next to it
for humans (the installer leaves it out), then add a row to the table above.

## License

[MIT](LICENSE)

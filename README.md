# local_claude_kit

Kurt's personal Claude Code setup (the "claude kit"): one set of instructions and skills,
installed the same way on every machine and every *work* cloud environment.

| | |
|---|---|
| `CLAUDE.md` | personal instructions — how to talk to Kurt, how he works, where new things go |
| `skills/new-project` | scaffold a new repo his way; runs the three placement questions |
| `skills/land` | commit → push → fast-forward `main` → report the SHA |
| `skills/templatize` | clean public template copy of a repo (for the "copy me" videos) |
| `skills/bot-report` | the standard daily report every bot sends to Kratos |
| `skills/film-check` | pre-recording checklist: clean room + privacy + footage review |
| `third-party/` | pinned, read-first copies of other people's skills (rules inside) |
| `cloud/setup.sh` | setup script for work cloud environments |

## Install / update

Clone once per machine, then re-run the installer after every `git pull`.

Windows (PowerShell), from the cloned folder:

```
powershell -ExecutionPolicy Bypass -File install.ps1
```

macOS / Linux / Git Bash:

```
bash install.sh
```

It copies `CLAUDE.md` and the skills into `~/.claude/` (Windows:
`%USERPROFILE%\.claude`). An existing personal `CLAUDE.md` that isn't the
kit's is backed up first. `-Uninstall` / `--uninstall` removes exactly what
the kit installed.

**Cloud sessions** can't see a computer's `~/.claude`. For each *work*
environment (Kratos, lychee), paste `cloud/setup.sh` into the environment's
setup script.

## The clean room (filming)

Filmed "from scratch" builds must get the same help a viewer with a fresh
account gets — none of this. So the kit is **never** installed in:

- the Windows profile used for recording,
- the "clean" cloud environment used for filmed cloud builds,
- the claude.ai account (account-level skills reach every session,
  including filmed ones) — which is why the kit installs per machine /
  per environment instead.

`/film-check` walks through it before every shoot.

## Changing the kit

Edit, commit, push (from any session). Machines pick it up on the next
`git pull` + install; cloud work environments on their next session.

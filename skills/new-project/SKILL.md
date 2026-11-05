---
name: new-project
description: Start a new project the way Kurt sets them up. Use when he wants to start, scaffold, or set up a new repo, app, bot, tool or site. Runs the three placement questions, picks the host, and scaffolds the repo (router CLAUDE.md, README, .env.example, .gitignore, .claude/skills/). Not for filmed from-scratch builds — those run in the clean room with no kit.
---

# /new-project

## 1. Decide where it lives (before any file)

Ask the three questions out loud, with your answer to each:

1. Own runtime or hardware? (GPU, always-on server, market hours)
2. Could it be public or shared?
3. Could a bug cost money or do damage?

All no → it probably belongs **inside Kratos** (a skill, agent, tool or state
file). Say so and stop unless Kurt still wants a separate repo.

Any yes → own repo. Pick the host and say why in one line:

| It is… | Host |
|---|---|
| static site | GitHub Pages |
| web app with a backend | Vercel |
| small API / form / webhook | Cloudflare Worker |
| runs on a schedule | GitHub Actions in its own repo |
| always on (bots, live trading) | an always-on host — recommend one, with cost |
| needs GPU / footage / browser logins | Kurt's PC |

Money-handling projects (trading, payments): its keys live only in its own
repo/host, never in Kratos; it reports to Kratos via `/bot-report`; nothing
typed in Discord or chat can trigger a money action without Kurt confirming.

## 2. Make the repo

If Kurt hasn't created it, ask him to (github.com/new — private unless it's
meant to be public). Then scaffold:

- **`CLAUDE.md`** — a router, short: what this is (2 lines), how to run it,
  where secrets come from, where detail lives, project rules. Not a manual.
- **`README.md`** — what it is and how to run it, for a human.
- **`.env.example`** — every key name with where to get it; never values.
- **`.gitignore`** — `.env`, build output, caches, media.
- **`.claude/skills/`** — only if there's a repeatable project workflow.
- Language basics only when the stack is chosen (e.g. `pyproject.toml`,
  `package.json`). Prefer the standard library / existing tools; don't add a
  dependency for something small.

## 3. Wire it up

- List every secret it needs and where each goes (repo secret / cloud env /
  `.env` / host). Kurt adds them; never ask him to paste one in chat.
- If it should report to Kratos, add the `/bot-report` step.
- Add a row to `kratos/docs/system-map.md` (inventory + which machines +
  keys) — or tell Kurt to, if Kratos isn't in this session.

## 4. Land it

First commit with the scaffold, push, `/land`. Report the repo URL and what
to do next.

---
name: land
description: Land finished work on main in one of Kurt's solo repos — commit, push the working branch, fast-forward main, report the SHA. Use when a unit of work is done, or when Kurt says land it, ship it, or push to main. Follows the repo's own CLAUDE.md if it defines a different landing procedure.
---

# /land

1. **Check the repo's own rules first.** If its `CLAUDE.md` describes a
   landing procedure (Kratos does — quiesce checks for queue workflows),
   follow that instead of this.
2. **Hold and ask** instead of landing if the change is irreversible or
   outward-facing: deleting data, anything touching money, a new or changed
   GitHub workflow, publishing something public, a mass edit — or if Kurt
   said to hold.
3. **Run the repo's fast checks** on what changed (tests, lint, a build, or a
   dry run). Don't land red.
4. Commit with a clear message (what and why). Push the working branch.
5. `git fetch origin main`, rebase onto it if needed, then
   `git push origin HEAD:main` (fast-forward). If rejected as
   non-fast-forward: fetch, reconcile, retry. **Never force-push `main`.**
6. If already on `main`: `git pull --rebase`, commit, `git push origin main`.
7. Report: "Landed on main — `<short SHA>`" and one line on what changed.

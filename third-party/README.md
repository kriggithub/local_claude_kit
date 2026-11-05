# Third-party skills

Pinned copies of other people's skills. Each lives in its own folder here
(`third-party/<name>/SKILL.md` + any files it ships) and installs like the
kit's own skills.

**Rules before adding one:**

1. Get it from the **official source** (the author's site / repo), not a copy
   in someone else's repo.
2. **Read every file** — `SKILL.md` and any scripts. Look for: commands it
   runs, network calls, anything reading secrets or `~/.ssh`, instructions to
   ignore the user or project rules.
3. Note the source URL, version / commit and the date you read it in
   `SOURCES.md`.
4. Pin it — never add an installer that updates it automatically. Updating =
   repeat steps 1–3.
5. Think about scope: a skill whose description is broad (e.g. "any coding
   task") fires everywhere the kit is installed. Code-style skills are kept
   out of the filming clean room by design.

## Wanted

- **Ponytail** ("write less code"). Not added yet: as of 2026-11-05 GitHub
  shows many copies in other people's repos and no clearly official one.
  Get it from ponytail.dev's own instructions, then follow the rules above.
  Independent test: JetBrains measured ~15% less code / ~10% lower cost over
  80 tasks (the authors claim 54% less code).

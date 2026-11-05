---
name: bot-report
description: Add the standard daily report to one of Kurt's bots or scheduled jobs so Kratos can read how it's doing. Use when building or wiring up any bot, scanner, crawler or automation that runs on a schedule, or when Kurt asks for status reporting or Discord updates from a project.
---

# /bot-report

Every bot, in any repo, reports the same way, so Kratos can summarize all of
them. One small JSON file per bot per day:

`kratos/state/reports/<bot>/<YYYY-MM-DD>.json`

```json
{"bot": "<bot-name>", "date": "YYYY-MM-DD", "status": "ok",
 "headline": "one line a human reads first",
 "details": ["…"], "links": ["…"],
 "generated_at": "<ISO 8601 with offset>"}
```

- `status`: `ok` / `warn` / `fail`. A run that crashed still writes `fail`
  with the error in `details` — silence must never look like success.
- **Heartbeat:** write a report every scheduled run, even with nothing to
  say (`"headline": "nothing new"`).
- Numbers in `headline` (e.g. "3 new leads · 0 errors"); no secrets, no
  personal data beyond what Kratos already holds.

## Getting it into Kratos

- **Bot lives in Kratos:** write the file directly; the job's commit step
  includes `state/reports/`.
- **Bot in its own repo:** it needs write access to Kratos — a fine-grained
  GitHub token scoped to `kriggithub/kratos` contents only, stored as a repo
  secret in the bot's repo. Commit the report file via the GitHub contents
  API (no clone needed). Never give a money-handling bot a broader token.

## Discord (once webhooks exist)

Post the `headline` (+ link) to the bot's channel with the webhook URL from
a repo secret; `fail` / missed heartbeats go to `#alerts`. Push-only: nothing
typed in Discord triggers anything.

# Sources of third-party skills

| Skill | Source | Version / commit | Read on |
|---|---|---|---|
| `ponytail`, `ponytail-audit`, `ponytail-debt`, `ponytail-gain`, `ponytail-help`, `ponytail-review` | https://github.com/DietrichGebert/ponytail (`skills/`; named by ponytail.dev) | v5.3.3, `7801d061243d7b753bad0e0b3c057cd250b11755` | 2026-11-05 |

## Ponytail notes

- **Skills only, copied unmodified.** MIT; license in `LICENSE-ponytail`.
- **Deliberately not installed: the plugin.** It adds hooks and a band UI that
  log each turn to a local CSV by default, offer an optional webhook and can
  auto-update, which rule 4 forbids. Those files were skimmed and searched for
  this decision, not reviewed line by line. Review them first if that changes.
- **What that costs:** no hook injects it, so the kit's `CLAUDE.md` tells
  Claude to load `/ponytail` (full) at every session start (always on since
  2026-11-13). It relies on Claude following that line, and it doesn't reach
  subagents. A level change lasts only for the session.
- **`/ponytail-help` describes the plugin:** its band, auto-activation, config
  and auto-update sections don't apply here. Don't enable auto-update.
- **Savings claims:** `/ponytail-gain` shows the authors' own benchmark (53%
  less code, 26% lower cost). Independent test, as noted when this was on the
  wanted list: JetBrains measured ~15% less code / ~10% lower cost over 80 tasks.

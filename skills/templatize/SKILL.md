---
name: templatize
description: Make a clean public template copy of one of Kurt's repos — usually the "frozen at the end of the video" repo that goes with a YouTube build. Use when he wants to publish, share, or template a project, or make a repo viewers can copy. Strips personal data and history; never edits the original.
---

# /templatize

The original repo stays private and untouched. The template is a **new
public repo with one fresh commit** — no history, nothing personal.

1. **Ask Kurt to create the empty public repo** (github.com/new), named for
   the video (e.g. `YT_<Project>_Template`).
2. **Copy files, not git history.** Export the current tree (e.g.
   `git archive HEAD`) into the new repo. Never push the original's history.
3. **Scrub, then show Kurt the list of what was removed or replaced:**
   - secrets: `.env*` (keep `.env.example` with names only), tokens, keys,
     webhook URLs — also search the code for strings that look like keys
   - personal data: real names other than Kurt's public name, emails,
     addresses, finances, calendars, family, client details, Kratos state
   - personal tuning that only fits Kurt (e.g. learned style profiles,
     his footage assets) → replace with a blank starter
   - machine paths, `CLAUDE.local.md`, `.claude/settings.local.json`
4. **README for viewers:** what it is, the video link (placeholder until
   posted), "frozen at the end of the video so it matches what you saw",
   requirements, a "Make it your own" setup section first, and "not
   maintained — fork it".
5. **License** (MIT unless Kurt says otherwise); check third-party
   dependencies' licenses before bundling any of their files.
6. Commit once ("Template from <video title>"), push, and report the URL.
   Turn on GitHub's "Template repository" setting if Kurt wants the "Use this
   template" button.

---
name: film-check
description: Pre-recording checklist for Kurt's YouTube build videos. Use before he films a build, a speedrun, or any screen recording, and to review raw footage for leaks afterwards. Covers the clean room (so results match what a viewer with a fresh account gets) and privacy (no past chats, keys, emails or card details on screen).
---

# /film-check

Run it the day before filming (setup takes time) and again right before.
Go item by item; Kurt confirms each.

## 1. Clean room — results must match a fresh viewer's

A filmed "from scratch" build must not get help a viewer wouldn't have.

- [ ] **Fresh Windows user profile** for the recording — no `~/.claude`
      (so no claude-kit, no personal skills, no auto memory), no browser
      history, no saved logins.
- [ ] **Cloud sessions: the "clean" environment** — no setup script, no
      secrets, default network. Never the Kratos or lychee environment.
- [ ] **Account level is clean:** on claude.ai, disable account-enabled
      skills, plugins and connectors (Gmail, Drive, …) for the shoot, and
      turn off any memory / past-chat features in settings. Note what you
      turned off so you can turn it back on.
- [ ] Built in a **new, empty repo** — no `CLAUDE.md`, no `.claude/`.
- [ ] Same plan a viewer would use (say which plan on camera).

## 2. Privacy

- [ ] Past chats / sessions not visible: new session, sidebar collapsed, or
      record a cropped window only (OBS window capture + crop).
- [ ] Windows Do Not Disturb on; taskbar hidden or cropped; desktop clear.
- [ ] Browser: no autofill dropdowns, no password-manager popups, no other
      tabs, no bookmarks bar.
- [ ] No `.env`, keys or tokens on screen — open nothing with secrets.
- [ ] **Never show card details** when paying; plan the blur.
- [ ] GitHub repo pickers show private repo names — choose "All
      repositories" on camera or blur that screen.

## 3. During

- Real timer on screen if it's a timed build; fast-forward slow parts, never
  cut the clock.
- Disconnected integrations reconnected on camera are genuine — note what
  must be reconnected afterwards.

## 4. After

- [ ] Review the raw recording for leaks: on the PC, `/watch` the file (in
      Kratos) and ask for every frame showing an email, key, token, chat
      title, private repo name or card number.
- [ ] Reconnect / re-enable everything turned off in step 1; re-grant repo
      access to the Claude GitHub App.
- [ ] Delete the filming Windows profile once the footage is safe.

# Contributing to TasteBud

This document explains how the team works on TasteBud. Read it before pushing anything.

> **Current team:** `@IAmKhirvie` (owner / sole approver for now)
> More team members will be added as the project grows.

---

## Branch Protection (active on `main`)

The `main` branch is protected on GitHub. The following rules are enforced:

| Rule | Setting |
|---|---|
| Direct push to `main` | **Blocked** |
| Pull request required to merge into `main` | **Yes** |
| Approving reviews required | **1** |
| Stale reviews dismissed when new commits are pushed | **Yes** |
| Conversations must be resolved before merge | **Yes** |
| Force push to `main` | **Blocked** |
| Branch deletion of `main` | **Blocked** |
| Admin (`@IAmKhirvie`) can bypass if needed | **Yes** |

**In plain English:** nobody can push directly to `main`. All changes must go through a Pull Request that gets at least one approval from `@IAmKhirvie` before it can be merged.

---

## The Workflow

```bash
# 1. Clone (one time)
git clone https://github.com/IAmKhirvie/tastebud.git
cd tastebud

# 2. Always start from updated main
git checkout main
git pull

# 3. Create a feature branch — NEVER work directly on main
git checkout -b feature/<module>-<short-description>
# examples:
#   feature/library-scan-device
#   feature/player-background-playback
#   feature/lyrics-lrc-import

# 4. Code, commit, push the branch
git add .
git commit -m "Add device audio scan to Library module"
git push -u origin feature/library-scan-device

# 5. Open a Pull Request on GitHub
#    base: main   ←   compare: feature/library-scan-device

# 6. Wait for review and approval from @IAmKhirvie

# 7. Merge via the GitHub UI (Squash and merge recommended)

# 8. Delete the feature branch (GitHub will offer this after merge)
```

If anyone tries `git push origin main` directly, GitHub will reject it.

---

## Branch Naming

| Prefix | Use for | Example |
|---|---|---|
| `feature/` | New functionality | `feature/mood-color-picker` |
| `fix/` | Bug fix | `fix/playlist-duplicate-songs` |
| `refactor/` | Code cleanup without behavior change | `refactor/player-state-management` |
| `docs/` | Docs only | `docs/update-readme` |
| `chore/` | Tooling, deps, config | `chore/update-flutter-version` |

Keep branch names short, lowercase, and hyphen-separated. Tie to the module it touches.

---

## Commit Messages

- Imperative mood: "Add device audio scan", not "Added" or "Adding".
- Keep the subject under 70 characters.
- If a commit needs more explanation, add a blank line and write a body.

Good:
```
Add device audio scan to Library module

Uses on_audio_query to enumerate audio files on first launch.
Caches results in Hive so the next launch is instant.
```

Bad:
```
update stuff
```

---

## Pull Request Checklist

Before requesting review:

- [ ] `flutter analyze` shows no issues
- [ ] `flutter test` passes
- [ ] The branch is up to date with `main` (rebase or merge if needed)
- [ ] The PR title summarizes the change in one sentence
- [ ] The PR description explains *why* (not just *what*) — link the user story or sprint task
- [ ] Screenshots or screen recordings attached for UI changes

---

## Reviewer Responsibilities (for `@IAmKhirvie`)

When reviewing a PR:

1. Pull the branch locally and run it (`flutter run`) for UI-affecting changes.
2. Check that the change matches the user story / sprint scope — no scope creep.
3. Check for:
   - Hard-coded secrets or tokens
   - Code that references the wrong module
   - Unused imports / dead code
   - Missing error handling at the file-system or network boundary
4. Comment inline if changes are needed; approve only when ready to merge.
5. Prefer **Squash and merge** to keep `main` history clean.

---

## Adding a New Team Member

1. Go to https://github.com/IAmKhirvie/tastebud/settings/access
2. Click **Add people**, enter their GitHub username.
3. Choose role:
   - **Write** — can push to feature branches and open PRs. Recommended for developers.
   - **Triage** — can manage issues/PRs but not push code.
   - **Admin** — full control. Avoid unless co-owner.
4. Add them to this file under the team list at the top.

---

## Emergency Hotfix

If `main` is broken and needs an immediate fix:

```bash
git checkout main
git pull
git checkout -b fix/<short-description>
# fix the issue
git commit -am "Hotfix: <description>"
git push -u origin fix/<short-description>
```

Open a PR, self-approve as admin if no other reviewer is available, merge. Do **not** push directly to `main` even in emergencies — the protection rules exist for a reason and the audit trail matters.

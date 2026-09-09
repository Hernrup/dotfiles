@RTK.md

# Ponytail x Superpowers

Ponytail's ladder applies inside every superpowers skill. During brainstorming
and writing-plans, run rung 1 (does this need to exist) and rung 2 (already in
this codebase) on each proposed component before it enters the plan.

# Comments

Default to none. A comment earns its place only by carrying context the code
cannot: why this instead of the obvious alternative, a non-obvious constraint
(API quirk, race, perf ceiling), a link to a spec or issue, or a warning about
what breaks if changed.

Never write:

- Restatements of the code (`# increment i`, `// set the flag`).
- Section banners, `Step 1/2/3`, or headers over blocks that already read fine.
- Docstrings/JSDoc on self-evident functions. Add them only for public API with
  non-obvious contracts.
- Any reference to a plan, a task list, a previous conversation, a review, or
  the change itself (`# added per request`, `# was buggy before`, `# new`,
  `# refactored`). Code describes what is, not how it got here — that belongs
  in the commit message.
- `TODO` unless the user asked for one.

One line beats three. If a comment is needed to explain what the code does,
rename things instead. When editing existing code, match the file's density —
don't add commentary the surrounding code doesn't have, and delete stale
comments you invalidate.

Exception: `ponytail:` markers on deliberate shortcuts stay.

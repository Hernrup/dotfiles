#!/usr/bin/env bash
# Guards the agent-coexistence config in lua/config/options.lua: nvim must
# reload buffers that agents edited on disk instead of showing stale content.
#
# Asserts the wiring and the mechanism separately, on purpose. Composing them
# headlessly does not work: `:checktime` called from inside an autocommand is
# postponed by vim to the next "safe" moment, which a one-shot headless nvim
# exits before reaching. Interactively that moment always arrives.
set -e
f=$(mktemp)
trap 'rm -f "$f"' EXIT
printf 'original\n' > "$f"

nvim --headless "$f" -c 'lua
  -- 1. wiring: autoread on, and something calls checktime on focus/enter
  assert(vim.o.autoread, "autoread is off")
  local hooked = vim.iter(vim.api.nvim_get_autocmds({ event = { "FocusGained", "BufEnter" } }))
    :any(function(a) return (a.command or ""):match("checktime") end)
  assert(hooked, "no checktime autocmd on FocusGained/BufEnter")

  -- 2. mechanism: checktime actually reloads an out-of-band edit.
  -- Sleep past filesystem mtime granularity; a real agent edit is never this fast.
  vim.uv.sleep(1100)
  vim.fn.writefile({ "edited by an agent" }, vim.fn.expand("%"))
  vim.cmd("checktime")
  local got = vim.api.nvim_buf_get_lines(0, 0, -1, false)[1]
  assert(got == "edited by an agent", "checktime did not reload, got: " .. got)

  io.write("PASS: autoread wired and checktime reloads out-of-band edits\n")' +qa

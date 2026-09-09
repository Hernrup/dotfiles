-- Loaded by LazyVim before plugins. LazyVim's own defaults live in
-- lazyvim.config.options; only overrides belong here.

vim.g.lazyvim_python_lsp = "basedpyright"

-- Agents edit files behind nvim's back. `autoread` only grants permission to
-- re-read a file changed on disk; nvim still needs an event to act on it,
-- which is what the autocmd supplies.
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, { command = "checktime" })

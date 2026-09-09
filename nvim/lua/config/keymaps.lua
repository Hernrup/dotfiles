vim.keymap.set("n", "<leader>mp", function()
  local file = vim.fn.expand("%:p")
  if file == "" or vim.bo.buftype ~= "" then
    vim.notify("mdpane: buffer has no file on disk", vim.log.levels.WARN)
    return
  end
  vim.cmd("silent! write")
  vim.system({ "mdpane", file }, { text = true }, function(res)
    if res.code ~= 0 then
      local msg = (res.stderr or ""):gsub("%s+$", "")
      vim.schedule(function()
        vim.notify("mdpane failed: " .. (msg ~= "" and msg or "exit " .. res.code), vim.log.levels.ERROR)
      end)
    end
  end)
end, { desc = "Render buffer in glow pane" })

vim.keymap.set("i", "jk", "<Esc>", { desc = "Escape insert mode" })

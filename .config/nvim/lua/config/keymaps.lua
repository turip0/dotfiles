-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Magic buffer-picking mode
local term = require("floatty").setup({
  window = {
    row = function()
      return vim.o.lines - 11
    end,
    width = 1.0,
    height = 8,
  },
})

vim.keymap.set("n", "<C-t>", function()
  term.toggle()
end)
vim.keymap.set("t", "<C-t>", function()
  term.toggle()
end)

vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })

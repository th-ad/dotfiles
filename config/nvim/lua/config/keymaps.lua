-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local map = vim.keymap.set

-- Leader
vim.g.mapleader = " "

-- Normal
map("n", "<C-s>", ":w<CR>", { silent = true })
map("n", "<C-e>", function()
  Snacks.explorer.open()
end, { silent = true })
map("n", "<C-p>", function()
  Snacks.picker.files()
end, { silent = true })
map("n", "<C-f>", function()
  Snacks.picker.grep()
end, { silent = true })

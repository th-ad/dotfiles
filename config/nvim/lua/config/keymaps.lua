-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local map = vim.keymap.set

-- Leader
vim.g.mapleader = " "

-- Normal
map("n", "<C-s>", ":w<CR>", { silent = true })
map("n", "<C-e>", ":Neotree toggle<CR>", { silent = true })
map("n", "<C-p>", ":Telescope git_files<CR>", { silent = true })
map("n", "<C-f>", ":Telescope live_grep<CR>", { silent = true })
map("n", "<C-m>", "<Plug>(comment_toggle_linewise_current)", { silent = true })

-- Visual BLock
map("x", "<C-m>", "<Plug>(comment_toggle_linewise_visual)", { silent = true })

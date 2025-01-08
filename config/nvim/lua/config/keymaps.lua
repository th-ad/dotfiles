-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local map = vim.keymap.set

-- Leader
vim.g.mapleader = " "

-- Normal
map("n", "<C-s>", ":w<CR>", { silent = true })
map("n", "<C-e>", ":Neotree toggle<CR>", { silent = true })
map("n", "<C-p>", ":FzfLua git_files<CR>", { silent = true })
map("n", "<C-f>", ":FzfLua live_grep_native<CR>", { silent = true })

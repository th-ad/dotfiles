-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.opt.relativenumber = true
vim.opt.formatexpr = ""
vim.filetype.add({
  extension = {
    mdx = "markdown.mdx",
  },
})

vim.g.lazyvim_ruby_lsp = "disabled"
vim.g.lazyvim_ruby_formatter = "standardrb"

vim.g.lazyvim_prettier_needs_config = false

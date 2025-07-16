-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.opt.relativenumber = true
vim.opt.formatexpr = ""
vim.filetype.add({
  extension = {
    mdx = "markdown.mdx",
  },
})

vim.g.lazyvim_picker = "snacks"

vim.g.lazyvim_ruby_lsp = "disabled"

vim.g.lazyvim_prettier_needs_config = false

-- vim.g.lazyvim_python_lsp = "pyright"
-- vim.g.lazyvim_python_ruff = "ruff"

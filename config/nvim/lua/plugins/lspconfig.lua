return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rubocop = {
          cmd = {
            vim.fn.expand("$HOME/.rbenv/shims/bundle"),
            "exec",
            "--gemfile=.danger/rubocop.Gemfile",
            "rubocop",
            "--lsp",
          },
        },
      },
    },
  },
}

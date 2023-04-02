-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "lunar"
vim.opt.relativenumber = true

-- keymappings
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode["jj"] = "<esc>"

-- vscode-like keymappings
lvim.keys.normal_mode["<C-e>"] = "<cmd>NvimTreeToggle<cr>"
lvim.keys.normal_mode["<C-p>"] = "<cmd>Telescope git_files<cr>"
lvim.keys.normal_mode["<C-f>"] = "<cmd>Telescope live_grep<cr>"

-- comments
lvim.keys.normal_mode["<C-m>"] = "<Plug>(comment_toggle_linewise_current)"
lvim.keys.visual_block_mode["<C-m>"] = "<Plug>(comment_toggle_linewise_visual)"

-- testing
vim.api.nvim_create_user_command("TestN", 'lua require("neotest").run.run()', {})
vim.api.nvim_create_user_command("TestF", 'lua require("neotest").run.run(vim.fn.expand("%"))', {})
vim.api.nvim_create_user_command("TestS", 'lua require("neotest").summary.toggle()', {})

-- copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
local cmp = require "cmp"

lvim.builtin.cmp.mapping["<Tab>"] = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  else
    local copilot_keys = vim.fn["copilot#Accept"]()
    if copilot_keys ~= "" then
      vim.api.nvim_feedkeys(copilot_keys, "i", true)
    else
      fallback()
    end
  end
end

-- vim-gh-line
vim.g.gh_open_command = 'fn() { echo "$@" | pbcopy; }; fn '
vim.g.gh_line_map = "<C-o>"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
-- lvim.builtin.comment.on_config_done = function()
--   lvim.keys.normal_mode["<C-m>"] = "gcc"
--   lvim.keys.visual_block_mode["<C-m>"] = "gc"
-- end

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "ruby",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

lvim.builtin.telescope.defaults.preview = false

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "rubocop", filetypes = { "ruby" } },
}

-- set additional formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  sources = {
    "lvim.lsp.null-ls.builtins.formatting.prettier",
  },
}

-- additional plugins
lvim.plugins = {
  { "tpope/vim-fugitive" },
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "github/copilot.vim" },
  { "ruanyl/vim-gh-line" },
  {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "olimorris/neotest-rspec",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rspec")({
            rspec_cmd = "/usr/local/bin/neotest-rspec.sh",
          }),
        },
        icons = {
          failed = "",
          passed = "",
          running = "",
          skipped = "",
          unknown = "",
        },
        output = {
          open_on_run = false
        },
      })
    end
  },
}

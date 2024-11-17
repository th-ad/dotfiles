-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "lunar"
vim.opt.relativenumber = true

-- filetypes
vim.filetype.add({
	extension = {
		mdx = "markdown.mdx",
	},
})

-- testing
vim.g["test#strategy"] = "neovim"
vim.g["test#neovim#start_normal"] = 1
vim.g["test#ruby#use_binstubs"] = 1
vim.g["test#ruby#rspec#executable"] = "dip rspec"

-- copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
vim.g.copilot_filetypes = {
	["markdown"] = false,
}
local cmp = require("cmp")

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
	"c_sharp",
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

lvim.builtin.treesitter.highlight.enable = true

lvim.builtin.telescope.defaults.preview = false

-- require'lspconfig'.csharp_ls.setup{}

-- -- set additional linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	-- { name = "cppcheck", filetypes = { "arduino", "c", "cpp" }, args = { "--language=c++", "--enable=warning,style,performance,portability", "--template=gcc", "$FILENAME" } },
	-- { name = "cpplint", filetypes = { "arduino", "c", "cpp" } },
	-- { command = "rubocop", filetypes = { "ruby" } },
	{ command = "standardrb", filetypes = { "ruby" } },
})

-- set additional formatters
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	-- { name = "astyle" },
	{ name = "prettierd" },
})

-- additional plugins
lvim.plugins = {
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-surround" },
	{ "github/copilot.vim" },
	{ "ruanyl/vim-gh-line" },
	{ "janko-m/vim-test" },
}

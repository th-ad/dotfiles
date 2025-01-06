return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({})
  end,
  -- config = function()
  --   vim.g.copilot_no_tab_map = true
  --   vim.g.copilot_assume_mapped = true
  --   vim.g.copilot_tab_fallback = ""
  --   vim.g.copilot_filetypes = {
  --     ["markdown"] = false,
  --   }
  -- end,
}

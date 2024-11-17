return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.mapping["<Tab>"] = function(fallback)
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
    return opts
  end,
}

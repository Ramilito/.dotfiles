local M = {
  "zbirenbaum/copilot.lua",
  enabled = true,
  -- lazy = true,
  event = "VeryLazy",
}

function M.config()
  require("copilot").setup({
    filetypes = {
      ["*"] = true,
    }
  })
end

return M

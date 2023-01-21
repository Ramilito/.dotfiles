local M = {
  "zbirenbaum/copilot-cmp",
  event = "VeryLazy",
  -- lazy = true,
  dependencies = {
    "copilot.lua"
  }
}

function M.config()
  require("copilot_cmp").setup()
end

return M

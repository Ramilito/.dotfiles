return { "folke/which-key.nvim",
  -- keys = { "<leader>", "g" },
  event = "VeryLazy",

  config = function()
    local wk = require("which-key")
    wk.setup({
      plugins = { spelling = true },
      key_labels = { ["<leader>"] = "SPC" },
      window = { border = "single", position = "bottom", padding = {1,2,1,2} },
    })
    wk.register({
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>s"] = { name = "+search" },
      ["<leader>u"] = { name = "+utils" },
      ["<leader>w"] = { name = "+windows" },
    })
    -- require("which-key").setup({
    --   plugins = {
    --     marks = true,
    --     registers = true,
    --     spelling = {
    --       enabled = true,
    --       suggestions = 20,
    --     },
    --   },
    --
    --   window = {
    --     border = "single", -- none, single, double, shadow
    --     position = "bottom", -- bottom, top
    --     margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    --     padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    --     winblend = 0,
    --   },
    --   layout = {
    --     height = { min = 4, max = 25 }, -- min and max height of the columns
    --     width = { min = 20, max = 50 }, -- min and max width of the columns
    --     spacing = 3, -- spacing between columns
    --     align = "left", -- align columns left, center or right
    --   },
    -- })
  end,
}

return {
  "folke/which-key.nvim",
  keys = { "<leader>", "g" },
  lazy = true,

  config = function()
    local wk = require("which-key")
    wk.setup({
      presets = {
        operators = false, -- adds help for operators like d, y, ...
        motions = false, -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
        windows = false, -- default bindings on <c-w>
        nav = false, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
      plugins = { spelling = true },
      key_labels = { ["<leader>"] = "SPC" },
      window = { border = "single", position = "bottom", padding = { 1, 2, 1, 2 } },
    })
    wk.register({
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>n"] = { name = "+neorg" },
      ["<leader>s"] = { name = "+search" },
      ["<leader>u"] = { name = "+utils" },
      ["<leader>w"] = { name = "+windows" },
      ["<leader>x"] = { name = "+trouble" },
    })
  end,
}

return { "folke/which-key.nvim",
  keys = { "<leader>", "g" },
  lazy = true,

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
      ["<leader>n"] = { name = "+neorg" },
      ["<leader>s"] = { name = "+search" },
      ["<leader>u"] = { name = "+utils" },
      ["<leader>w"] = { name = "+windows" },
      ["<leader>x"] = { name = "+trouble" },
    })
  end,
}

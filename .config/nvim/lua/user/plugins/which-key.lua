return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    delay = 0,
    spec = {
      { "<leader>g", group = "+git" },
      { "<leader>n", group = "+neorg" },
      { "<leader>s", group = "+search" },
      { "<leader>u", group = "+utils" },
      { "<leader>x", group = "+trouble" },
      { "g", group = "goto" },
    },
    plugins = {
      operator = false,
      motions = false,
      text_objects = false,
      nav = false,
    },
    win = { border = "single", padding = { 1, 2, 1, 2 } },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

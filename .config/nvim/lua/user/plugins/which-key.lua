return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    delay = 1000,
    spec = {
      { "<leader>g", group = "+Git" },
      { "<leader>n", group = "+Neorg" },
      { "<leader>s", group = "+Search" },
      { "<leader>u", group = "+Utils" },
      { "<leader>x", group = "+Trouble" },
      { "g", group = "Goto" },
    },
    icons = { mappings = false },
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
      desc = "Buffer Local Keymaps",
    },
  },
}

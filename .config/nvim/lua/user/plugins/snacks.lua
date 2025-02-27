return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = false },
      dashboard = { enabled = false },
      explorer = { enabled = false },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = false },
      notifier = { enabled = true },
      quickfile = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = true },
      statuscolumn = { enabled = false },
      words = { enabled = true },
      zen = { enabled = true },
      profiler = { enabled = true },
    },
    keys = {
      {
        "<leader>gt",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>n",
        function()
          Snacks.notifier.show_history()
        end,
        desc = "Notification History",
      },
      {
        "<leader>z",
        function()
          Snacks.zen()
        end,
        desc = "Toggle Zen Mode",
      },
      {
        "<leader>ps",
        function()
          Snacks.profiler.scratch()
        end,
        desc = "Profiler Scratch Bufer",
      },
    },
  },
}

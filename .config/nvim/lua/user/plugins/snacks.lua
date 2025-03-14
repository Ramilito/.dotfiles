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
      indent = { enabled = false },
      input = { enabled = true },
      notifier = { enabled = true },
      picker = { enabled = false },
      profiler = { enabled = true },
      quickfile = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      win = { enabled = false },
      words = { enabled = true },
      zen = { enabled = true },
      animate = { enabled = false },
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
    config = function()
      -- Snacks.profiler.pick({
      --   filter = {
      --     def_plugin = "snacks.nvim",
      --   },
      -- })
    end,
  },
}

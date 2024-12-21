return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
      {
        "<leader>z",
        function()
          Snacks.zen()
        end,
        desc = "Toggle Zen Mode",
      },
      {
        "<leader>n",
        function()
          Snacks.notifier.show_history()
        end,
        desc = "Notification History",
      },
      -- { "<leader>gt", function() Snacks.lazygit() end, desc = "Lazygit" },
    },
    opts = {
      lazygit = { enabled = true },
      notifier = { enabled = true },
      zen = {
        enabled = true,
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = function()
      -- Toggle the profiler
      Snacks.toggle.profiler():map("<leader>pp")
      -- Toggle the profiler highlights
      Snacks.toggle.profiler_highlights():map("<leader>ph")
    end,
    keys = {
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

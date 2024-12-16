return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification History" },
    -- { "<leader>gt", function() Snacks.lazygit() end, desc = "Lazygit" },
  },
  opts = {
    lazygit = { enabled = true },
    notifier = { enabled = true },
    zen = {
      enabled = true,
    },
  },
}

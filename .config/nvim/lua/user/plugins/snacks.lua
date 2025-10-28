vim.pack.add({ "https://github.com/folke/snacks.nvim" })

local snacks = require("snacks")
snacks.setup({
  bigfile = { enabled = false },
  dashboard = { enabled = false },
  explorer = { enabled = false },
  indent = { enabled = false },
  input = { enabled = false },
  notifier = {
    enabled = false,
    timeout = 3000,
  },
  picker = { enabled = false },
  quickfile = { enabled = false },
  scope = { enabled = false },
  scroll = { enabled = true },
  statuscolumn = { enabled = false },
  terminal = { enabled = false },
  words = { enabled = false },
  styles = {
    notification = {
      -- wo = { wrap = true } -- Wrap notifications
    },
  },
})

snacks.toggle.profiler():map("<leader>dpp")
snacks.toggle.profiler_highlights():map("<leader>dph")

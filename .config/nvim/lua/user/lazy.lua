require("lazy").setup({
  spec = {
    -- { "folke/LazyVim", import = "lazyvim.plugins" },
    { import = "user.plugins" },
  },
  defaults = { lazy = false },
  install = { colorscheme = { "tokyonight", "habamax", "catppuccin" } },
  checker = { enabled = false },
  diff = {
    cmd = "terminal_git",
  },
  performance = {
    cache = {
      enabled = true,
      -- disable_events = {},
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        -- "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  -- ui = {
  --   custom_keys = {
  --     ["<localleader>d"] = function(plugin)
  --       dd(plugin)
  --     end,
  --   },
  -- },
})

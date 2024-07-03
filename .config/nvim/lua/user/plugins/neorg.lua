local M = {
  {
    "nvim-neorg/neorg",
    lazy = true,
    -- event = "VeryLazy",
    -- build = ":Neorg sync-parsers",
    cmd = "Neorg",
    ft = "norg",
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.export"] = {}, -- Adds pretty icons to your documents
        ["core.presenter"] = {
          config = {
            zen_mode = "zen-mode",
          },
        },
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/.config/notes",
            },
          },
        },
        ["core.integrations.treesitter"] = {}, -- Adds pretty icons to your documents
      },
    },
    dependencies = { "nvim-web-devicons", "nvim-lua/plenary.nvim" },
  },
}

-- require("nvim-web-devicons").set_icon({
--   norg = {
--     icon = "",
--     color = "#56949f",
--     cterm_color = "65",
--     name = "Norg",
--   },
-- })

return M

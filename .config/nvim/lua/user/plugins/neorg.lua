local M = {
  {
    "nvim-neorg/neorg",
    -- lazy = true,
    event = "VeryLazy",
    -- ft = "norg",
    -- cmd = "Neorg mode norg",
    -- keys = {
    --   {
    --     "<leader>nn",
    --     "<cmd>Neorg keybind norg core.norg.dirman.new.note<cr>",
    --     desc = "Neorg mode",
    --   },
    -- },
    build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {},  -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = {      -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/.config/notes",
            },
          },
        },
      },
    },
    dependencies = { "nvim-web-devicons", "nvim-lua/plenary.nvim" },
  }
}

-- require("nvim-web-devicons").set_icon({
--   norg = {
--     icon = "",
--     color = "#56949f",
--     cterm_color = "65",
--     name = "Norg",
--   },
-- })
--
return M

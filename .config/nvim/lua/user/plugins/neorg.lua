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
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.norg.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/.config/notes",
            },
          },
        },
      },
    },
    dependencies = { { "nvim-lua/plenary.nvim" } },
  }
}


return M

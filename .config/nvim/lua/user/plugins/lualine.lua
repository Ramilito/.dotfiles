return {
  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "arkav/lualine-lsp-progress",
    },
    opts = function(plugin)
      if plugin.override then
        require("lazyvim.util").deprecate("lualine.override", "lualine.opts")
      end

      local icons = require("user.icons").icons

      local function fg(name)
        return function()
          ---@type {foreground?:number}?
          local hl = vim.api.nvim_get_hl_by_name(name, true)
          return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
        end
      end

      return {
        options = {
          theme = "auto",
          globalstatus = true,
          section_separators = { "", "" },
          component_separators = { "", "" },
          disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { "lsp_progress" },
          -- lualine_x = {
          --   { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
          --   {
          --     "diff",
          --     symbols = {
          --       added = icons.git.added,
          --       modified = icons.git.modified,
          --       removed = icons.git.removed,
          --     },
          --   },
          -- },

          lualine_x = { "searchcount", "encoding", "filetype" },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { "nvim-tree" },
      }
    end,
  },

}

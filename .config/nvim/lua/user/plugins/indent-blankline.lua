return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "BufReadPre",
  opts = {},

  config = function()
    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)

    require("ibl").setup({
      indent = {
        char = "▏",
      },
      scope = {
        highlight = "WinBar",
        enabled = false,
        priority = 2000,
        char = { "▎" },

        -- FIX: the show_start line is not 1 color
        -- show_start = false
      },
      exclude = {
        filetypes = {
          "help",
          "startify",
          "dashboard",
          "packer",
          "neogitstatus",
          "NvimTree",
          "neo-tree",
          "Trouble",
        },
      },
    })
  end,
}

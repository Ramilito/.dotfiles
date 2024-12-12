return {
  {
    "saghen/blink.cmp",
    lazy = true,
    dependencies = "rafamadriz/friendly-snippets",
    version = "v0.*",
    event = "InsertEnter",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {

      keymap = {
        preset = "enter",
      },

      highlight = {
        use_nvim_cmp_as_default = true,
      },
      nerd_font_variant = "mono",

      sources = {
        completion = {
          enabled_providers = { "lsp", "path", "snippets", "buffer" },
        },
      },

      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
        menu = {
          draw = {
            treesitter = true,
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = {
          enabled = vim.g.ai_cmp,
        },
      },
    },
  },
}

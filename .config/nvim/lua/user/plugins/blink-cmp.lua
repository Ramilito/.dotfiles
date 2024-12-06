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
      keymap = { preset = "enter" },

      highlight = {
        use_nvim_cmp_as_default = true,
      },
      nerd_font_variant = "mono",

      sources = {
        completion = {
          enabled_providers = { "lsp", "path", "snippets", "buffer" },
        },
      },

      -- experimental auto-brackets support
      -- accept = { auto_brackets = { enabled = true } }

      trigger = { signature_help = { enabled = true } },
			windows = {
        autocomplete = {
          draw = "reversed",
        },
        documentation = {
          auto_show = true,
        },
        ghost_text = {
          enabled = true,
        },
      },
      -- windows = {
      --   autocomplete = {
      --     draw = "minimal",
      --   },
      -- },
    },
    opts_extend = { "sources.completion.enabled_providers" },
  },
}

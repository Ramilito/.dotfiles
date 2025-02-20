return {
  {
    "saghen/blink.cmp",
    lazy = true,
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    version = "*",
    event = "InsertEnter",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "default",

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
      },
      signature = {
        enabled = true,
      },
      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },

        menu = {
          draw = {
            columns = {
              { "kind_icon", "label", "label_description", gap = 1 },
              { "kind" },
            },
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

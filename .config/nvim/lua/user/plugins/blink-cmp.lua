vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp", version = "main", {
    load = function() end,
    confirm = true,
  } },
})

require("lz.n").load({
  {
    "blink",
    event = "InsertEnter",
    after = function()
      require("blink.cmp").setup({
        fuzzy = { prebuilt_binaries = {
          force_version = "v1.6.0",
        } },
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
      })
    end,
  },
})

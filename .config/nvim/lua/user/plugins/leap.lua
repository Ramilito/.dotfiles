return {
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = { { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } } },
    config = function()
      require("leap").add_default_mappings(false)
    end,
  },
}

return {
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    config = function()
      require("smart-splits").setup({ at_edge = "stop" })
    end,
  },
}

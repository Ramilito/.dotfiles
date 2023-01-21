return {
  "ellisonleao/glow.nvim",
  event = "VeryLazy",
  config = function()
    require('glow').setup({
      style = "dark",
      width = 120,
    })
  end
}

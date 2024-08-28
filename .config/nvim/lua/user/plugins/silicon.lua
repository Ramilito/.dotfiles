return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  config = function()
    require("nvim-silicon").setup({
      -- Configuration here, or leave empty to use defaults
    })
  end,
}

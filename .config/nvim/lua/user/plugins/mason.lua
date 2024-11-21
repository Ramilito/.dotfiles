return {
  "williamboman/mason.nvim",
  cmd = { "Mason" },
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    require("mason").setup()
  end,
}

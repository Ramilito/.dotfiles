vim.pack.add({ "https://github.com/mosheavni/yaml-companion.nvim" }, {
  load = function() end,
  confirm = true,
})

require("lz.n").load({
  {
    "yaml-companion.nvim",
    ft = "yaml",
    after = function()
      local cfg = require("yaml-companion").setup()
      vim.lsp.config("yamlls", cfg)
      vim.lsp.enable("yamlls")
    end,
  },
})

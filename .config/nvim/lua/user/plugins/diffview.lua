return {
  "sindrets/diffview.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true },
  },
  keys = {
    {
      "gd",
      function()
        if next(require("diffview.lib").views) == nil then
          vim.cmd("DiffviewOpen")
        else
          vim.cmd("DiffviewClose")
        end
      end,
      desc = "Toggle Diffview window",
    },
  },
  config = function()
    require("diffview").setup({})
  end,
}

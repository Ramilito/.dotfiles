return {
  {
    "ramilito/winbar.nvim",
    event = "VimEnter",
    dir = "~/workspace/mine/winbar.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("winbar").setup({
        icons = true,
        diagnostics = true,
        buf_modified = true,
        buf_modified_symbol = "●",
        dim_inactive = {
          enabled = true,
          highlight = "WinbarNC",
          icons = true, -- whether to dim the icons
          name = true, -- whether to dim the name
        },
      })
    end,
  },
}

vim.pack.add({ "https://github.com/ramilito/winbar.nvim" }, {
  load = function() end,
  confirm = true,
})

require("lz.n").load({
  {
    "winbar.nvim",
    event = "VimEnter",
    after = function()
      require("winbar").setup({
        icons = true,
        diagnostics = true,
        buf_modified = true,
        buf_modified_symbol = "●",
        dim_inactive = {
          enabled = true,
          highlight = "WinBarNC",
          icons = true, -- whether to dim the icons
          name = true, -- whether to dim the name
        },
      })
    end,
  },
})

vim.pack.add({ "https://github.com/folke/lazydev.nvim" }, {
  load = function() end,
  confirm = true,
})

require("lz.n").load({
  {
    "lazydev.nvim",
    ft = "lua",
    after = function()
      require("lazydev").setup({
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      })
    end,
  },
})
-- {
--    "folke/lazydev.nvim",
--    ft = "lua", -- only load on lua files
--    opts = {
--      library = {
--        -- See the configuration section for more details
--        -- Load luvit types when the `vim.uv` word is found
--        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
--      },
--    },
--  },

vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim" })
vim.pack.add({ "https://github.com/NeogitOrg/neogit" }, {
  load = function() end,
  confirm = true,
})

require("lz.n").load({
  {
    "neogit",
    keys = {
      { "<leader>gg", "<CMD>Neogit<CR>", desc = "Open Neogit" },
    },
    after = function()
      require("neogit").setup({})
    end,
  },
})

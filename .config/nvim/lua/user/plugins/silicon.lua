vim.pack.add({ "https://github.com/michaelrommel/nvim-silicon" }, {
  load = function() end,
  confirm = true,
})

require("lz.n").load({
  {
    "nvim-silicon",
    cmd = "Silicon",
    after = function()
      require("nvim-silicon").setup({
        to_clipboard = true,
      })
    end,
  },
})

vim.pack.add({ "https://github.com/MeanderingProgrammer/render-markdown.nvim" }, {
  load = function() end,
  confirm = true,
})

require("lz.n").load({
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    after = function()
      require("render-markdown").setup({
        {
          preset = "obsidian",
          latex = { enabled = false },
        },
      })
    end,
  },
})

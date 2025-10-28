vim.pack.add({ "https://github.com/MeanderingProgrammer/render-markdown.nvim" })

require("render-markdown").setup({
  {
    preset = "obsidian",
    latex = { enabled = false },
  },
})

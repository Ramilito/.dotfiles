vim.pack.add({
  "https://github.com/Mofiqul/vscode.nvim",
})

local vscode = require("vscode")

vscode.setup({
  color_overrides = {
    vscFront = "#cccccc",
    vscBack = "#1f1f1f",
    vscPopupBack = "#1f1f1f",
  },
})

vim.cmd([[colorscheme vscode]])
vim.o.background = "dark"

local M = {
  "Mofiqul/vscode.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("vscode").setup({
      color_overrides = {
        vscFront = "#cccccc",
        vscBack = "#1f1f1f",
        vscPopupBack = "#1f1f1f",
      },
    })

    vim.cmd([[colorscheme vscode]])
    vim.o.background = "dark"
  end,
}

return M

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    exe = "bash-language-server",
    filetypes = { "sh" },
  },
}

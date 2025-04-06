-- enable lsp completion
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
  callback = function(ev)
    vim.lsp.completion.enable(true, ev.data.client_id, ev.buf)
  end,
})

-- vim.lsp.enable("gopls")
vim.lsp.enable("lua_ls")
-- vim.lsp.enable("ts_ls")

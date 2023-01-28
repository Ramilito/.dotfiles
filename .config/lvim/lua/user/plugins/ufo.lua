local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}
local language_servers = { 'omnisharp' } -- like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
  require('lspconfig')[ls].setup({
    capabilities = capabilities,
    -- other_fields = ...
  })
end

ufo.setup {
  -- provider_selector = function(bufnr, filetype)
  --   return {'treesitter', 'indent'}
  -- end
}

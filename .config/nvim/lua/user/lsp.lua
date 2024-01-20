local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  lsp_zero.default_keymaps({
    buffer = bufnr,
    preserve_mappings = false
  })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'tsserver', 'rust_analyzer' },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

local cmp = require('cmp')

require("luasnip.loaders.from_vscode").lazy_load()
local cmp_opts = {
  snippet = {
    expand = function(args)
      require 'luasnip'.lsp_expand(args.body)
    end
  },
  sources = {
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'buffer' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    -- ['<PageDown>'] = cmp.mapping.scroll_docs(-4),
    -- ['<PageUp>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    })
  })
}

if not vim.fn.has("win64") then
  cmp_opts.formatting = lsp_zero.cmp_format()
end

cmp.setup(cmp_opts)

local M = {
  'VonHeikemen/lsp-zero.nvim',
  event = "VeryLazy",
  dependencies = {
    -- LSP Support
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',

    -- Snippets
    'L3MON4D3/LuaSnip',
    -- Snippet Collection (Optional)
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local lsp = require('lsp-zero')
    local cmp = require('cmp')

    lsp.preset('recommended')

    local cmp_mappings = lsp.defaults.cmp_mappings({
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
    })

    local cmp_sources = lsp.defaults.cmp_sources({ name = "copilot" })
    table.insert(cmp_sources, { name = "copilot" })

    lsp.setup_nvim_cmp({
      mapping = cmp_mappings
    })

    lsp.on_attach(function(client, bufnr)
      require('nvim-navic').attach(client, bufnr)
    end)


    lsp.setup()

    local cmp_config = lsp.defaults.cmp_config({
      sources = cmp_sources,
    })

    cmp.setup(cmp_config)
  end
}
return M

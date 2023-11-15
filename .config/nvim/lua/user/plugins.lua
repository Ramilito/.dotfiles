local M = {
  { "nvim-lua/plenary.nvim" },
  { "jose-elias-alvarez/typescript.nvim", lazy = true },
  { "akinsho/toggleterm.nvim",            lazy = true },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    config = function()
      require('ts_context_commentstring').setup {}
    end
  },
  { "mbbill/undotree",                             event = "BufReadPre" },
  { "JoosepAlviste/nvim-ts-context-commentstring", event = "VeryLazy" },
  { "MunifTanjim/nui.nvim",                        event = "VeryLazy" },
  { "famiu/bufdelete.nvim",                        cmd = "Bdelete" },
  { "norcalli/nvim-terminal.lua",                  ft = "terminal",     config = true },
  { "dstein64/vim-startuptime",                    cmd = "StartupTime" },


  -- LSP ------------------------------
  { 'VonHeikemen/lsp-zero.nvim',                   branch = 'v3.x' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
  { 'L3MON4D3/LuaSnip' },
  -------------------------------------
  {
    'ramilito/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        keymaps = {
          ["s"] = "actions.select_vsplit",
          ["S"] = "actions.select_split",
          ["<leader>e"] = "actions.close",
          ["<C-s>"] = false,
          ["<BS>"] = "actions.parent",
        },
        use_default_keymaps = true,
      })
    end
  },
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.cursorword').setup({ delay = 300 })
    end,
    version = '*'
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
      -- options
    },
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme vscode]])
      vim.o.background = "dark"
    end,
  },
  -- Automatically add closing tags for HTML and JSX
  {
    "windwp/nvim-ts-autotag",
    ft = {
      'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx',
      'rescript',
      'xml',
      'php',
      'markdown',
      'astro', 'glimmer', 'handlebars', 'hbs'
    },
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
      })
    end,
  },
}

return M

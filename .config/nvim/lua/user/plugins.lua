local M = {
  { "nvim-lua/plenary.nvim" },
  { "jose-elias-alvarez/typescript.nvim", lazy = true },
  { "akinsho/toggleterm.nvim",            lazy = true },
  {
    "folke/zen-mode.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
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
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'L3MON4D3/LuaSnip' },
  -------------------------------------

  -- LuaSnip ------------------------------
  { "rafamadriz/friendly-snippets", lazy = true },
  {
    'L3MON4D3/LuaSnip',
    event = "InsertEnter",
    lazy = true,
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  {
    'stevearc/oil.nvim',
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
    lazy = true,
    keys = {
      { "gcc", mode = "n",          desc = "Comment toggle current line" },
      { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n",          desc = "Comment toggle current block" },
      { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
    },
    config = function()
      require("Comment").setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
      })
    end,

  },
}

return M

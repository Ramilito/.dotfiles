local M = {
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme tokyonight]])
  --   end,
  -- },
  {
    "catppuccin/nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme catppuccin]])
    end,
  },

  -- { "williamboman/mason-lspconfig.nvim", lazy = false },
  "nvim-lua/plenary.nvim",
  -- "arkav/lualine-lsp-progress",
  { "jose-elias-alvarez/typescript.nvim",          lazy = true },
  { "jose-elias-alvarez/null-ls.nvim",             lazy = true },
  { "windwp/nvim-spectre",                         lazy = true },
  { "mbbill/undotree",                             event = "BufReadPre" },
  -- "folke/twilight.nvim",
  { "akinsho/toggleterm.nvim",                     lazy = true },
  { "famiu/bufdelete.nvim",                        cmd = "Bdelete" },
  { "JoosepAlviste/nvim-ts-context-commentstring", event = "VeryLazy" },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require('Comment').setup()
    end
  },
  { "MunifTanjim/nui.nvim",     event = "VeryLazy", },
  { "dstein64/vim-startuptime", cmd = "StartupTime" },
  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   event = "BufReadPre",
  --   config = function()
  --     require("treesitter-context.config").setup({
  --       context_commentstring = {
  --         enable = true
  --       },
  --       enable = true,
  --       throttle = true,
  --     })
  --   end,
  -- },
  { 'kevinhwang91/nvim-bqf' },
  {
    "SmiteshP/nvim-navic",
    event = "VeryLazy",
    config = function()
      vim.g.navic_silence = true
      require("nvim-navic").setup({ separator = " ", highlight = true, depth_limit = 5 })
    end,
  },
  { "norcalli/nvim-terminal.lua", ft = "terminal", config = true, },
}

return M

local M = {
  -- {"folke/tokyonight.nvim", lazy = false, priority = 100 },
  -- { "williamboman/mason-lspconfig.nvim", lazy = false },
  "nvim-lua/plenary.nvim",
  -- "arkav/lualine-lsp-progress",
  { "jose-elias-alvarez/typescript.nvim", lazy = true },
  { "windwp/nvim-spectre", lazy = true },
  { "mbbill/undotree", event = "BufReadPre" },
  -- "folke/twilight.nvim",
  { "akinsho/toggleterm.nvim", lazy = true },
  { "famiu/bufdelete.nvim", cmd = "Bdelete" },
  { "numToStr/Comment.nvim", event = "VeryLazy",
    config = function()
      require('Comment').setup()
    end
  },
  { "MunifTanjim/nui.nvim", event = "VeryLazy", },
  { "dstein64/vim-startuptime", cmd = "StartupTime" },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    config = true,
  },
  { 'kevinhwang91/nvim-bqf' },
  { "SmiteshP/nvim-navic", event = "VeryLazy",
    config = function()
      vim.g.navic_silence = true
      require("nvim-navic").setup({ separator = " ", highlight = true, depth_limit = 5 })
    end,
  },
  { "norcalli/nvim-terminal.lua", ft = "terminal", config = true, },
}

return M

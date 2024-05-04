lvim.plugins = {
  { "Hoffs/omnisharp-extended-lsp.nvim" },
  { "folke/zen-mode.nvim" },
  { "j-hui/fidget.nvim" },
  { "windwp/nvim-spectre" },
  { 'stevearc/overseer.nvim' },
  { "simrat39/rust-tools.nvim" },
  { "kylechui/nvim-surround" },
  { "karb94/neoscroll.nvim" },
  -- { 'rmagatti/auto-session' },
  { "ziontee113/icon-picker.nvim" },
  { "ggandor/leap.nvim" },
  { "github/copilot.vim" },
  { "folke/trouble.nvim", cmd = "TroubleToggle" },
  -- { 's1n7ax/nvim-window-picker', tag = 'v1.*' },
  { "dstein64/vim-startuptime", cmd = "StartupTime" },
  { "folke/todo-comments.nvim", dependencies = "nvim-lua/plenary.nvim" },
  { 'krivahtoo/silicon.nvim', build = './install.sh' },
  { "kevinhwang91/nvim-bqf", event = { "BufRead", "BufNew" } },
  { "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup {
          plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
          filetypes = {
            -- yaml = true,
            -- markdown = true,
            ["*"] = true,
          },
        }
      end, 100)
    end,
  },
  { "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
    config = function()
      require("copilot_cmp").setup()
    end
  },
  { 'sudormrfbin/cheatsheet.nvim',
    dependencies = {
      { 'nvim-telescope/telescope.nvim' },
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
    } },
  -- { 'rmagatti/session-lens',
  --   requires = {
  --     'rmagatti/auto-session',
  --     'nvim-telescope/telescope.nvim'
  --   },
  -- },
  -- { "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v2.x",
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim",
  --     "s1n7ax/nvim-window-picker"
  --   }
  -- },
  -- {
  --   "folke/noice.nvim",
  --   event = "VimEnter",
  --   config = function()
  --     require("noice").setup()
  --   end,
  --   requires = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --     "hrsh7th/nvim-cmp",
  --   }
  -- }
  -- {
  --   'anuvyklack/hydra.nvim',
  --   config = function()
  --     require("user.hydra").config()
  --   end,
  -- },

  -- not working
  -- { "nvim-treesitter/nvim-treesitter-context",
  --   config = function()
  --     require("treesitter-context").setup()
  --   end,
  -- },
  -- { "sunjon/shade.nvim",
  --   config = function()
  --     require("shade").setup()
  --   end,
  -- }
  -- {
  --   'kevinhwang91/nvim-ufo',
  --   requires = 'kevinhwang91/promise-async',
  --   config = function()
  --     require("user.ufo").config()
  --   end,
  -- },

}

vim.pack.add({
  "https://github.com/nvim-neorocks/lz.n",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mrcjkb/rustaceanvim",
  "https://github.com/dstein64/vim-startuptime",
  "https://github.com/kevinhwang91/nvim-bqf",
  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/stevearc/profile.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
})

vim.pack.add({ "https://github.com/mbbill/undotree", "https://github.com/j-hui/fidget.nvim", "https://github.com/seblyng/roslyn.nvim" }, {
  load = function() end,
  confirm = true,
})

require("lz.n").load({
  {
    "undotree",
    keys = { { "<leader>su", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" } },
    after = function() end,
  },
  {
    "roslyn",
    ft = { "cs", "csx", "csharp" },
  },
  {
    "fidget.nvim",
    event = "LspAttach",
    after = function()
      require("fidget").setup({})
    end,
  },
})

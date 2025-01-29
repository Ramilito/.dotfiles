local M = {
  { "jose-elias-alvarez/typescript.nvim", lazy = true },
  { "Hoffs/omnisharp-extended-lsp.nvim", lazy = true },
  { "mbbill/undotree", lazy = true, keys = { { "<leader>su", "<cmd>UndotreeToggle<cr>", desc = "Undotree" } } },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    enabled = not vim.g.neovide,
  },
  { "MunifTanjim/nui.nvim", event = "VeryLazy" },
  { "famiu/bufdelete.nvim", cmd = "Bdelete" },
  { "norcalli/nvim-terminal.lua", ft = "terminal", config = true },
  { "dstein64/vim-startuptime", cmd = "StartupTime" },
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    lazy = true,
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.cursorword").setup({ delay = 300 })
    end,
    version = "*",
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {},
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
  },
  -- Automatically add closing tags for HTML and JSX
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "rescript",
      "xml",
      "php",
      "markdown",
      "astro",
      "glimmer",
      "handlebars",
      "hbs",
    },
    opts = {},
  },
  {
    "jinh0/eyeliner.nvim",
    keys = { "f", "F" },
    config = function()
      require("eyeliner").setup({
        highlight_on_key = true, -- show highlights only after keypress
        dim = false, -- dim all other characters if set to true (recommended!)
      })
    end,
  },
}

return M

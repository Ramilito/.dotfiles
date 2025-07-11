local M = {
  { "jose-elias-alvarez/typescript.nvim", lazy = true },
  { "neovim/nvim-lspconfig" },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true },
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    -- opts = {
    --   config = {
    --     cmd = {
    --       "dotnet",
    --       os.getenv("HOME") .. "/.roslyn-lsp/content/LanguageServer/osx-arm64/Microsoft.CodeAnalysis.LanguageServer.dll",
    --       "--logLevel=Information",
    --       "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
    --       "--stdio",
    --     },
    --   },
    -- },
  },
  { "mbbill/undotree", lazy = true, keys = { { "<leader>su", "<cmd>UndotreeToggle<cr>", desc = "Undotree" } } },
  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    enabled = not vim.g.neovide,
  },
  { "MunifTanjim/nui.nvim", event = "VeryLazy" },
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

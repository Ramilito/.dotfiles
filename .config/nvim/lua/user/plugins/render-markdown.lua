return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    lazy = true,
    ft = "markdown",
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      preset = "obsidian",
      latex = { enabled = false },
    },
  },
}

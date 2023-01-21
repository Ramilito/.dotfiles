local M = {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd [[ colorscheme catppuccin ]]
  end,
}

-- function M.config()
--   require("catppuccin").setup({
--     flavour = "mocha", -- latte, frappe, macchiato, mocha
--     term_colors = true,
--     transparent_background = false,
--     no_italic = false,
--     no_bold = false,
--     -- styles = {
--     --   comments = {},
--     --   conditionals = {},
--     --   loops = {},
--     --   functions = {},
--     --   keywords = {},
--     --   strings = {},
--     --   variables = {},
--     --   numbers = {},
--     --   booleans = {},
--     --   properties = {},
--     --   types = {},
--     -- },
--     integrations = {
--       nvimtree = true,
--       telescope = true,
--       gitsigns = true,
--     },
--     -- color_overrides = {
--     --   mocha = {
--     --     base = "#000000",
--     --   },
--     -- },
--     -- highlight_overrides = {
--     --   mocha = function(C)
--     --     return {
--     --       TabLineSel = { bg = C.pink },
--     --       NvimTreeNormal = { bg = C.none },
--     --       CmpBorder = { fg = C.surface2 },
--     --       Pmenu = { bg = C.none },
--     --       NormalFloat = { bg = C.none },
--     --       TelescopeBorder = { link = "FloatBorder" },
--     --     }
--     --   end,
--     -- },
--   })
-- end

return M

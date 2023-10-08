return {
  "RRethy/vim-illuminate",
  event = "BufReadPost",
  config = function()
    require("illuminate").configure({
      providers = {
        'regex',
        'lsp',
        'treesitter',
      },
      delay = 300
    })
    -- change the highlight style
    -- vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
    -- vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
    -- vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
  end,
  keys = {
    {
      "]]",
      function()
        require("illuminate").goto_next_reference(false)
      end,
      desc = "Next Reference",
    },
    {
      "[[",
      function()
        require("illuminate").goto_prev_reference(false)
      end,
      desc = "Prev Reference",
    },
  },
}

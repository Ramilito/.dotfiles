local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
  config = function()
    require("indent_blankline").setup({
      char = "▏",
      show_first_indent_level = false,
      buftype_exclude = { "terminal", "nofile" },
      filetype_exclude = {
        "help",
        "startify",
        "dashboard",
        "packer",
        "neogitstatus",
        "NvimTree",
        "neo-tree",
        "Trouble",
      }
    })
  end,
}

return M

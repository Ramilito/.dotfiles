local M = {
  "cshuaimin/ssr.nvim",
  keys = {
    {
      "<leader>sR",
      function()
        require("ssr").open()
      end,
      mode = { "n", "x" },
      desc = "Structural Replace",
    },
  },
}

return M

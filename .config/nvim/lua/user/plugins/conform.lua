local M = {
  'stevearc/conform.nvim',
  event = "VeryLazy",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
        json = {"jq"},
        rs = {"rustfmt"},
        sh = {"shellcheck"},
        tf = {"terraform_fmt"},
        yaml = {"yq"}
      },
    })
  end,
}
return M

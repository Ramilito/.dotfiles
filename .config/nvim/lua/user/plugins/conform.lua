local M = {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettierd", "prettier", "eslint_d" },
        typescript = { "prettierd", "prettier", "eslint_d" },
        typescriptreact = { "prettierd", "prettier", "eslint_d" },
        css = { "prettierd", "prettier", "eslint_d" },
        json = { "jq" },
        rust = { "rustfmt" },
        sh = { "shellcheck" },
        yaml = { "yq" },
        cs = { "csharpier" },
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },
      },
      formatters = {
        csharpier = {
          command = "dotnet-csharpier",
          args = { "--write-stdout" },
        },
      },
    })
  end,
}
return M

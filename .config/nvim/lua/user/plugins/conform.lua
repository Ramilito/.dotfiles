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
        go = { "gofmt", "goimports" },
        rust = { "rustfmt" },
        sh = { "shellcheck", "shfmt" },
        yaml = { "yq" },
        cs = { "csharpier" },
        hcl = { "packer_fmt" },
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

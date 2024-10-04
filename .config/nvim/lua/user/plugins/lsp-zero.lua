local M = {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v4.x",
  lazy = false,
  -- event = "VeryLazy",
  dependencies = {
    -- LSP Support
    {
      "neovim/nvim-lspconfig",
    }, -- Required
    -- { "williamboman/mason.nvim" }, -- Optional
    -- { "williamboman/mason-lspconfig.nvim" }, -- Optional

    -- Autocompletion
    { "hrsh7th/cmp-buffer" }, -- Optional
    { "hrsh7th/cmp-nvim-lsp" }, -- Required
    { "hrsh7th/cmp-nvim-lua" }, -- Optional
    { "hrsh7th/cmp-path" }, -- Optional
    { "hrsh7th/nvim-cmp" }, -- Required
    { "saadparwaiz1/cmp_luasnip" }, -- Optional
    -- Snippets
    { "L3MON4D3/LuaSnip" }, -- Required
    { "rafamadriz/friendly-snippets" }, -- Optional
  },
  config = function()
    local cmp = require("cmp")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      sources = {
        { name = "nvim_lsp", keyword_length = 0 },
        { name = "nvim_lua" },
        { name = "luasnip" }, -- For luasnip users.
        { name = "path" },
        { name = "buffer" },
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
      }),
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      formatting = require("lsp-zero").cmp_format({ details = true }),
    })

    local lsp_zero = require("lsp-zero")
    local lsp_attach = function(client, bufnr)
      lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    lsp_zero.extend_lspconfig({
      capabilities = capabilities,
      lsp_attach = lsp_attach,
      float_border = "rounded",
      sign_text = true,
    })

    require("lspconfig").lua_ls.setup({})
    require("lspconfig").yamlls.setup({
      settings = {
        yaml = {
          schemas = {
            kubernetes = "/*.yaml",
            ["http://json.schemastore.org/kustomization"] = "kustomization.yaml",
            ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
            ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
            ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
            ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
            ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
            ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
            ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
            ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
            ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
            ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
          },
        },
        redhat = {
          telemetry = {
            enabled = false,
          },
        },
      },
    })
    require("lspconfig").ts_ls.setup({})
    require("lspconfig").rust_analyzer.setup({})
  end,
}
return M

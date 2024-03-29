local M = {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	event = "VeryLazy",
	dependencies = {
		-- LSP Support
		{
			"neovim/nvim-lspconfig",
		}, -- Required
		{ "williamboman/mason.nvim" }, -- Optional
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" }, -- Required
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "hrsh7th/cmp-buffer" }, -- Optional
		{ "hrsh7th/cmp-path" }, -- Optional
		{ "saadparwaiz1/cmp_luasnip" }, -- Optional
		{ "hrsh7th/cmp-nvim-lua" }, -- Optional

		-- Snippets
		{ "L3MON4D3/LuaSnip" }, -- Required
		{ "rafamadriz/friendly-snippets" }, -- Optional
	},
	config = function()
		local lsp = require("lsp-zero")
		local cmp = require("cmp")

		lsp.preset("recommended")

		local cmp_mappings = lsp.defaults.cmp_mappings({
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		})

		-- local cmp_sources = lsp.defaults.cmp_sources({ name = "copilot" })
		-- table.insert(cmp_sources, { name = "copilot" })

		lsp.setup_nvim_cmp({
			mapping = cmp_mappings,
		})

		lsp.on_attach(function(client, bufnr)
			require("nvim-navic").attach(client, bufnr)
		end)

		lsp.setup()

		local cmp_config = lsp.defaults.cmp_config({
			sources = cmp_sources,
		})

		cmp.setup(cmp_config)

		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Replace these with the tools you have installed
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.formatting.stylua,
			},
		})
	end,
}
return M

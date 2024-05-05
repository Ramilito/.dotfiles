local M = {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
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
		local lsp_zero = require("lsp-zero")
		lsp_zero.on_attach(function(client, bufnr)
			-- client.server_capabilities.semanticTokensProvider = nil
			lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })
		end)

		lsp_zero.setup_servers({ "lua_ls", "tsserver", "rust_analyzer" })
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

			formatting = lsp_zero.cmp_format({ details = true }),
		})
	end,
}
return M

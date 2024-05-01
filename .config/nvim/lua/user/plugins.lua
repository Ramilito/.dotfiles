local M = {
	{ "nvim-lua/plenary.nvim" },
	{ "jose-elias-alvarez/typescript.nvim", lazy = true },
	{ "akinsho/toggleterm.nvim", lazy = true },
	{
		"folke/zen-mode.nvim",
		opts = {},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "VeryLazy",
		enabled = not vim.g.neovide,
	},
	{ "MunifTanjim/nui.nvim", event = "VeryLazy" },
	{ "famiu/bufdelete.nvim", cmd = "Bdelete" },
	{ "norcalli/nvim-terminal.lua", ft = "terminal", config = true },
	{ "dstein64/vim-startuptime", cmd = "StartupTime" },

	-- LSP ------------------------------
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	-- LuaSnip ------------------------------
	{ "rafamadriz/friendly-snippets", lazy = true },
	{
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		lazy = true,
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.cursorword").setup({ delay = 300 })
		end,
		version = "*",
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		opts = {
			-- options
		},
	},
	-- Automatically add closing tags for HTML and JSX
	{
		"windwp/nvim-ts-autotag",
		ft = {
			"html",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"vue",
			"tsx",
			"jsx",
			"rescript",
			"xml",
			"php",
			"markdown",
			"astro",
			"glimmer",
			"handlebars",
			"hbs",
		},
		opts = {},
	},
	{
		"jinh0/eyeliner.nvim",
		keys = { "f", "F" },
		config = function()
			require("eyeliner").setup({
				highlight_on_key = true, -- show highlights only after keypress
				dim = false, -- dim all other characters if set to true (recommended!)
			})
		end,
	},
}

return M

local M = {
	{ "nvim-lua/plenary.nvim" },
	{ "jose-elias-alvarez/typescript.nvim",          lazy = true },
	{ "mbbill/undotree",                             event = "BufReadPre" },
	{ "akinsho/toggleterm.nvim",                     lazy = true },
	{ "famiu/bufdelete.nvim",                        cmd = "Bdelete" },
	{ "JoosepAlviste/nvim-ts-context-commentstring", event = "VeryLazy" },
	{ "norcalli/nvim-terminal.lua",                  ft = "terminal",     config = true },
	{ "MunifTanjim/nui.nvim",                        event = "VeryLazy" },
	{ "dstein64/vim-startuptime",                    cmd = "StartupTime" },
	-- LSP
	{ 'VonHeikemen/lsp-zero.nvim',                   branch = 'v3.x' },
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'neovim/nvim-lspconfig' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'L3MON4D3/LuaSnip' },
	--
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme vscode]])
			vim.o.background = "dark"
		end,
	},

	-- Detect tabstop and shiftwidth automatically
	'tpope/vim-sleuth',
	{
		"echasnovski/mini.pairs",
		version = false,
		event = "VeryLazy",
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("Comment").setup()
		end,
	},
}

return M

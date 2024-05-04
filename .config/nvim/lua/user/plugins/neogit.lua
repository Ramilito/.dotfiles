return {
	"NeogitOrg/neogit",
	lazy = true,
	-- event = "VeryLazy",
	keys = {
		{
			"<leader>gg",
       "<cmd>Neogit<cr>",
			desc = "Open Neogit",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed, not both.
		"nvim-telescope/telescope.nvim", -- optional
	},
	config = function()
		require("neogit").setup({})
	end,
}

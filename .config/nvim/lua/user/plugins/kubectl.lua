return {
	{
		"ramilito/kubectl.nvim",
		dir = "~/workspace/mine/kubectl.nvim/",
		-- event = "VimEnter",
		-- dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<leader>k",
				function()
					require("kubectl").open()
				end,
				desc = "Kubectl",
			},
		},
		config = function()
			require("kubectl").setup({
				hints = true,
				context = true,
			})
		end,
	},
}

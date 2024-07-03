return {
	{
		"ramilito/kubectl.nvim",
		dir = "~/workspace/mine/kubectl.nvim/",
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
				namespace = "All",
				notifications = {
					enabled = true,
					verbose = false,
				},
				auto_refresh = {
					enabled = true,
					interval = 2000, -- milliseconds
				},
				hints = true,
				context = true,
				float_size = {
					width = 0.9,
					height = 0.8,
				},
			})
		end,
	},
}

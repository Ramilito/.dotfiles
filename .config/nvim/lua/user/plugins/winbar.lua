return {
	{
		"ramilito/winbar.nvim",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local wb = require("winbar")
			wb.setup()
		end,
	},
}

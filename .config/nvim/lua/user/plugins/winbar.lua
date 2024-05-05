return {
	{
		"ramilito/winbar.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"lewis6991/gitsigns.nvim",
		},
		config = function()
			local wb = require("winbar")
			wb.setup()
		end,
	},
}

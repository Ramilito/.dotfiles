return {
	{
		"ramilito/winbar.nvim",
		event = "VimEnter",
		config = function()
			local wb = require("winbar")
			wb.setup({
				icons = true,
				diagnostics = false,
				buf_modified = true,
			})
		end,
	},
}

return {
	{
		"ramilito/winbar.nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("winbar").setup({
				icons = true,
				diagnostics = true,
				buf_modified = true,
			})
		end,
	},
}

local M = {
	"zbirenbaum/copilot-cmp",
	event = "VeryLazy",
	-- lazy = true,
	dependencies = {
		"copilot.lua",
	},
}

function M.config()
	require("copilot_cmp").setup({
		suggestion = { enabled = false },
		panel = { enabled = false },
		formatters = {
			insert_text = require("copilot_cmp.format").remove_existing,
		},
	})
end

return M

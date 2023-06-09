-- return {
-- 	"folke/edgy.nvim",
-- 	event = "VeryLazy",
-- 	opts = {},
-- 	dependencies = { "echasnovski/mini.animate" },
-- }

return {
	-- edgy
	{
		"folke/edgy.nvim",
		event = "VeryLazy",
		opts = {
			animate = {
				enabled = false,
			},
			wo = {
				winbar = true,
			},
			bottom = {
				{
					ft = "toggleterm",
					size = { height = 0.4 },
					-- exclude floating windows
					filter = function(buf, win)
						return vim.api.nvim_win_get_config(win).relative == ""
					end,
				},
				{
					ft = "lazyterm",
					title = "LazyTerm",
					size = { height = 0.4 },
					filter = function(buf)
						return not vim.b[buf].lazyterm_cmd
					end,
				},
				"Trouble",
				{ ft = "qf", title = "QuickFix" },
				{
					ft = "help",
					size = { height = 20 },
					-- only show help buffers
					filter = function(buf)
						return vim.bo[buf].buftype == "help"
					end,
				},
				{ ft = "spectre_panel", size = { height = 0.4 } },
			},
			left = {
				{
					title = "Git",
					ft = "neo-tree",
					filter = function(buf)
						return vim.b[buf].neo_tree_source == "git_status"
					end,
					pinned = true,
					open = "Neotree position=right git_status",
				},
				{
					title = "Buffers",
					ft = "neo-tree",
					filter = function(buf)
						return vim.b[buf].neo_tree_source == "buffers"
					end,
					pinned = true,
					open = "Neotree position=top buffers",
				},

				{
					title = "Neo-Tree",
					ft = "neo-tree",
					filter = function(buf)
						return vim.b[buf].neo_tree_source == "filesystem"
					end,
					size = { height = 0.5 },
				},
				-- {
				--   ft = "Outline",
				--   pinned = true,
				--   open = "SymbolsOutline",
				-- },
				"neo-tree",
			},
		},
	},

	-- Fix bufferline offsets when edgy is loaded
	-- {
	--   "akinsho/bufferline.nvim",
	--   optional = true,
	--   opts = function()
	--     local Offset = require("bufferline.offset")
	--     if not Offset.edgy then
	--       local get = Offset.get
	--       Offset.get = function()
	--         if package.loaded.edgy then
	--           local layout = require("edgy.config").layout
	--           local ret = { left = "", left_size = 0, right = "", right_size = 0 }
	--           for _, pos in ipairs({ "left", "right" }) do
	--             local sb = layout[pos]
	--             if sb and #sb.wins > 0 then
	--               local title = " Sidebar" .. string.rep(" ", sb.bounds.width - 8)
	--               ret[pos] = "%#EdgyTitle#" .. title .. "%*" .. "%#WinSeparator#│%*"
	--               ret[pos .. "_size"] = sb.bounds.width
	--             end
	--           end
	--           ret.total_size = ret.left_size + ret.right_size
	--           if ret.total_size > 0 then
	--             return ret
	--           end
	--         end
	--         return get()
	--       end
	--       Offset.edgy = true
	--     end
	--   end,
	-- },
}

local M = {
	"nvim-tree/nvim-tree.lua",
	lazy = true,
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
}

local options = {
	filters = {
		dotfiles = false,
		exclude = { vim.fn.stdpath("config") .. "/lua/custom" },
	},
	disable_netrw = true,
	hijack_netrw = true,
	hijack_cursor = true,
	hijack_unnamed_buffer_when_opening = false,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = false,
	},
	view = {
		adaptive_size = true,
		side = "left",
		width = 25,
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>", "o" }, action = "edit" },
				{ key = "C", action = "close_node" },
				{ key = "<2-LeftMouse>", action = "edit" },
				{ key = "<2-RightMouse>", action = "cd" },
				{ key = ".", action = "cd" },
				{ key = "s", action = "vsplit" },
				{ key = "<S-s>", action = "split" },
				{ key = "<C-t>", action = "tabnew" },
				-- { key = "<", action = "<cmd>lua require'nvim-tree'.on_keypress('prev_sibling')<CR>" },
				-- { key = ">", action = "<cmd>lua require'nvim-tree'.on_keypress('next_sibling')<CR>" },
				{ key = "P", action = "parent_node" },
				{ key = "<BS>", action = "dir_up" },
				{ key = "<Tab>", action = "preview" },
				{ key = "K", action = "" },
				{ key = "J", action = "" },
			},
		},
	},
	-- remove_keymaps = {
	--   "s",
	-- },
	git = {
		enable = false,
		ignore = true,
	},
	filesystem_watchers = {
		enable = true,
	},
	actions = {
		open_file = {
			resize_window = true,
		},
	},
	renderer = {
		highlight_git = false,
		highlight_opened_files = "none",
		root_folder_label = false,
		indent_markers = {
			enable = false,
		},
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = false,
			},

			glyphs = {
				default = "",
				symlink = "",
				folder = {
					default = "",
					empty = "",
					empty_open = "",
					open = "",
					symlink = "",
					symlink_open = "",
					arrow_open = "",
					arrow_closed = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
}

function M.config()
	require("nvim-tree").setup(options)
end

return M

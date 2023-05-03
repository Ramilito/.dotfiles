return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
    version = false,
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				init = function()
					-- PERF: no need to load the plugin, if we only need its queries for mini.ai
					local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
					local opts = require("lazy.core.plugin").values(plugin, "opts", false)
					local enabled = false
					if opts.textobjects then
						for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
							if opts.textobjects[mod] and opts.textobjects[mod].enable then
								enabled = true
								break
							end
						end
					end
					if not enabled then
						require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
					end
				end,
			},
		},
		keys = {
			{ "<C-Enter>", desc = "Increment selection" },
			{ "<C-S-Enter>", desc = "Decrement selection", mode = "x" },
		},
		config = function()
			require("nvim-treesitter.install").compilers = { "gcc-12" }

			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"c",
					"cmake",
					"cpp",
					"css",
					"diff",
					"fish",
					"gitignore",
					"go",
					"graphql",
					"hcl",
					"hcl",
					"html",
					"http",
					"java",
					"javascript",
					"jsdoc",
					"json",
					"jsonc",
					"latex",
					"lua",
					"markdown",
					"markdown_inline",
					"meson",
					"ninja",
					"nix",
					"norg",
					"org",
					"php",
					"python",
					"query",
					"regex",
					"rust",
					"scss",
					"sql",
					"svelte",
					"teal",
					"terraform",
					"toml",
					"tsx",
					"typescript",
					"vhs",
					"vim",
					"vue",
					"yaml",
					-- "comment", -- comments are slowing down TS bigtime, so disable for now
					-- "markdown",
					-- "wgsl",
				},
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-Enter>", -- set to `false` to disable one of the mappings
						node_incremental = "<C-Enter>",
						scope_incremental = "grc",
						node_decremental = "<C-S-Enter>",
					},
				},
			})
		end,
	},
}

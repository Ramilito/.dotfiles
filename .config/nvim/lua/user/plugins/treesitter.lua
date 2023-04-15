return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-context",
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

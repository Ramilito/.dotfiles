return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      'nvim-treesitter/nvim-treesitter-context'
    },
    config = function()
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
          "help",
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
          "toml",
          "tsx",
          "typescript",
          "vhs",
          "vim",
          "vue",
          -- "wgsl",
          "yaml",
          -- "comment", -- comments are slowing down TS bigtime, so disable for now
          -- "markdown",
          -- "wgsl",
        },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "<C-s>",
            node_decremental = "<C-bs>",
          },
        },
      })
    end
  }
}


vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

require("nvim-treesitter.install").compilers = { "gcc" }
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "css",
    "diff",
    "gitignore",
    "go",
    "gomod",
    "gowork",
    "gosum",
    "graphql",
    "hcl",
    "html",
    "http",
    "javascript",
    "jsdoc",
    "json",
    "jsonc",
    "lua",
    "markdown",
    "markdown_inline",
    "nix",
    -- "norg",
    -- "org",
    "python",
    "regex",
    "rust",
    "scss",
    "sql",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
    "query",
    -- "comment", -- comments are slowing down TS bigtime, so disable for now
    -- "wgsl",
  },
  -- context_commentstring = {
  --   enable = true,
  --   enable_autocmd = false,
  -- },
  highlight = {
    additional_vim_regex_highlighting = false,
    enable = true,
  },
  -- Ensure that Tree-sitter is enabled for the custom filetype
  filetype = {
    k8s_pods = "json",
  },
  indent = {
    enable = false,
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


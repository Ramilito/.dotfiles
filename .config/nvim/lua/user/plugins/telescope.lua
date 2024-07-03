local function project_files()
  local opts = {}
  if vim.loop.fs_stat(".git") then
    opts.show_untracked = true
    require("telescope.builtin").git_files(opts)
  else
    local client = vim.lsp.get_active_clients()[1]
    if client then
      opts.cwd = client.config.root_dir
    end
    require("telescope.builtin").find_files(opts)
  end
end

local M = {
  "nvim-telescope/telescope.nvim",
  -- cmd = { "Telescope" },
  lazy = false,
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "debugloop/telescope-undo.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons" },
  },
  keys = {
    {
      "<leader>sf",
      "<cmd> Telescope find_files <CR>",
      desc = "Search Files",
    },
    { "<leader>sa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", desc = "Search All" },
    { "<leader>st", "<cmd> Telescope live_grep<CR>", desc = "Live Grep" },
    {
      "<leader>sb",
      "<cmd> Telescope buffers <CR>",
      desc = "Find Buffers",
    },
    { "<leader>sh", "<cmd> Telescope help_tags <CR>", desc = "Help Page" },
    {
      "<leader>sr",
      "<cmd> Telescope oldfiles <CR>",
      desc = "Search Recent",
    },
    { "<leader>sk", "<cmd> Telescope keymaps <CR>", desc = "Show Keys" },
    { "<leader>sw", "<cmd> Telescope grep_string <CR>", desc = "Find word" },
  },
}

function M.config()
  local actions = require("telescope.actions")
  local telescope = require("telescope")
  local borderless = true
  telescope.setup({
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        prompt_position = "top",
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
      },
      sorting_strategy = "ascending",
      mappings = {
        i = {
          ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
          ["<c-d>"] = require("telescope.actions").delete_buffer,
          ["<c-t>"] = function(...)
            return require("trouble.providers.telescope").open_with_trouble(...)
          end,
          ["<C-Down>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<C-Up>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
        },
      },
      prompt_prefix = " ",
      selection_caret = " ",
      winblend = borderless and 0 or 10,
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({
          -- even more opts
        }),
      },
    },
  })

  telescope.load_extension("fzf")
  telescope.load_extension("ui-select")
  telescope.load_extension("undo")
end

return M

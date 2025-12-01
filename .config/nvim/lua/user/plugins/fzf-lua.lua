vim.pack.add({ "https://github.com/nvim-tree/nvim-web-devicons" })
vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

require("lz.n").load({
  {
    "fzf-lua",
    keys = {
      -- search
      { "<leader>sk", "<cmd> FzfLua keymaps <CR>", desc = "Show Keys" },
      { "<leader>sh", "<cmd> FzfLua help_tags <CR>", desc = "Help Page" },
      { "<leader>sc", "<cmd> FzfLua highlights <CR>", desc = "Highlights" },
      { "<leader>sf", "<cmd> FzfLua files<CR>", desc = "Search files" },
      { "<leader>st", "<cmd> FzfLua live_grep<CR>", desc = "Live Grep" },
      { "<leader>sw", "<cmd> FzfLua grep_cword<CR>", mode = "n", desc = "Find current word" },
      { "<leader>sw", "<cmd> FzfLua grep_cword<CR>", mode = "v", desc = "Find current selection" },
      { "<leader>s/", "<cmd> FzfLua search_history<CR>", desc = "Search history" },
      { "<leader>sr", "<cmd> FzfLua oldfiles sort_mru=true sort_lastused=true include_current_session=true <CR>", desc = "Search recent" },
      { "<leader>sn", "<cmd> ObsidianQuickSwitch <CR>", desc = "Find Note" },
      -- git
      { "<leader>gc", "<cmd>FzfLua git_commits<CR>", desc = "Commits" },
      { "<leader>gs", "<cmd>FzfLua git_status<CR>", desc = "Status" },
      { "<C-p>", "<cmd> FzfLua buffers sort_mru=true sort_lastused=true <CR>", desc = "[ ] Find existing buffers" },
    },
    after = function()
      local fzf = require("fzf-lua")
      fzf.setup({ "default" }, {
        fzf_opts = {
          ["--no-scrollbar"] = true,
          ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-history",
        },
        winopts = {
          fzf_colors = true,
          preview = {
            scrollbar = false,
          },
        },
      })

      local actions = require("fzf-lua.actions")
      local config = require("fzf-lua.config")
      require("fzf-lua").register_ui_select()

      -- Quickfix
      config.defaults.keymap.fzf["ctrl-q"] = "select-all+accept"
    end,
  },
})

return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {

    { "<leader>sk", "<cmd> FzfLua keymaps <CR>", desc = "Show Keys" },
    { "<leader>sh", "<cmd> FzfLua help_tags <CR>", desc = "Help Page" },
    { "<leader>sc", "<cmd> FzfLua highlights <CR>", desc = "Highlights" },
    { "<leader>sf", "<cmd> FzfLua files<CR>", desc = "Search files" },
    { "<leader>st", "<cmd> FzfLua live_grep<CR>", desc = "Live Grep" },
    { "<leader>sw", "<cmd> FzfLua grep_cWORD<CR>", desc = "Find current word" },
    { "<leader>sw", "<cmd> FzfLua grep_cWORD<CR>", mode = "v", desc = "Find selection" },
    { "<leader>sr", "<cmd> FzfLua oldfiles sort_mru=true sort_lastused=true <CR>", desc = "Search recent" },
    { "<leader>sn", "<cmd> ObsidianQuickSwitch <CR>", desc = "Find Note" },
    { "<C-p>", "<cmd> FzfLua buffers sort_mru=true sort_lastused=true <CR>", desc = "[ ] Find existing buffers" },
  },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({})
  end,
}

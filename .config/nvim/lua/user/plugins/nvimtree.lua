local M = {
  "nvim-tree/nvim-tree.lua",
  lazy = true,
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
}

local options = {
  filters = {
    dotfiles = false,
    exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
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
    hide_root_folder = true,
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = "<cmd>lua require'nvim-tree'.on_keypress('edit')<CR>" },
        { key = "C", cb = "<cmd>lua require'nvim-tree'.on_keypress('close_node')<CR>" },
        { key = "<2-LeftMouse>", cb = "<cmd>lua require'nvim-tree'.on_keypress('edit')<CR>" },
        { key = "<2-RightMouse>", cb = "<cmd>lua require'nvim-tree'.on_keypress('cd')<CR>" },
        { key = ".", cb = "<cmd>lua require'nvim-tree'.on_keypress('cd')<CR>" },
        { key = "s", cb = "<cmd>lua require'nvim-tree'.on_keypress('vsplit')<CR>" },
        { key = "<S-s>", cb = "<cmd>lua require'nvim-tree'.on_keypress('split')<CR>" },
        { key = "<C-t>", cb = "<cmd>lua require'nvim-tree'.on_keypress('tabnew')<CR>" },
        -- { key = "<", cb = "<cmd>lua require'nvim-tree'.on_keypress('prev_sibling')<CR>" },
        -- { key = ">", cb = "<cmd>lua require'nvim-tree'.on_keypress('next_sibling')<CR>" },
        { key = "P", cb = "<cmd>lua require'nvim-tree'.on_keypress('parent_node')<CR>" },
        { key = "<BS>", cb = "<cmd>lua require'nvim-tree'.on_keypress('dir_up')<CR>" },
        { key = "<Tab>", cb = "<cmd>lua require'nvim-tree'.on_keypress('preview')<CR>" },
        { key = "K", action = "" },
        { key = "J", action = "" },
      },
    },
  },
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

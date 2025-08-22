vim.pack.add({
  "https://github.com/echasnovski/mini.files",
})

local files = require("mini.files")

files.setup({
  mappings = {
    close = "<esc>",
    go_in = "",
    go_in_plus = "<cr>",
    go_out = "<BS>",
    go_out_plus = "",
    reset = "",
    reveal_cwd = "@",
    show_help = "g?",
    synchronize = "=",
    trim_left = "<",
    trim_right = ">",
  },
  windows = {
    preview = true,
    width_preview = 30,
  },
  options = {
    use_as_default_explorer = true,
  },
})

local show_dotfiles = true

local filter_hide = function(fs_entry)
  return not (vim.startswith(fs_entry.name, ".") or fs_entry.name == "bin" or fs_entry.name == "obj")
end

local filter_show = function(fs_entry)
  return true
end

local toggle_dotfiles = function()
  show_dotfiles = not show_dotfiles
  local new_filter = show_dotfiles and filter_show or filter_hide
  files.refresh({ content = { filter = new_filter } })
end

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesBufferCreate",
  callback = function(args)
    local buf_id = args.data.buf_id
    -- Tweak left-hand side of mapping to your liking
    vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id })
  end,
})

local filter_hide = function(fs_entry)
  return not (vim.startswith(fs_entry.name, ".") or fs_entry.name == "bin" or fs_entry.name == "obj")
end

return {
  "echasnovski/mini.files",
  opts = {
    content = {
      filter = function(fs_entry)
        return filter_hide(fs_entry)
      end,
    },
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
      -- width_focus = 30,
      width_preview = 30,
    },
    options = {
      use_as_default_explorer = true,
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = "Open mini.files",
    },
  },
  config = function(_, opts)
    require("mini.files").setup(opts)

    local show_dotfiles = false

    local filter_show = function(fs_entry)
      return true
    end

    local toggle_dotfiles = function()
      show_dotfiles = not show_dotfiles
      local new_filter = show_dotfiles and filter_show or filter_hide
      require("mini.files").refresh({ content = { filter = new_filter } })
    end

    local open_split = function(buf_id)
      vim.cmd("vsplit")
      local win = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_buf(win, buf_id)
    end
    toggle_dotfiles()
    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(args)
        local buf_id = args.data.buf_id
        -- Tweak left-hand side of mapping to your liking
        vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id })
        -- vim.keymap.set("n", "S", function() open_split(buf_id) end, { buffer = buf_id })
      end,
    })
  end,
}

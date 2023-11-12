local vim = vim
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "VimEnter" }, {
  group = augroup("status_line"),
  callback = function()
    local winbar_filetype_exclude = {
      "help",
      "startify",
      "dashboard",
      "packer",
      "neo-tree",
      "neogitstatus",
      "NvimTree",
      "Trouble",
      "alpha",
      "lir",
      "Outline",
      "spectre_panel",
      "toggleterm",
      "TelescopePrompt",
      "prompt",
    }

    if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
      vim.opt_local.winbar = nil
      return
    end

    local win_number = vim.api.nvim_get_current_win()
    local config = vim.api.nvim_win_get_config(win_number)

    if config.relative == "" then
      vim.opt_local.winbar = " " .. require("user.winbar").get_winbar()
      vim.opt_local.statuscolumn = require("user.statuscolumn")
    else
      vim.opt_local.winbar = nil
    end
    -- vim.wo.winhighlight = 'Normal:NvimSeparator'
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown", "norg" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "InsertLeave" }, {
  pattern = "*.norg",
  group = augroup("auto-save"),
  callback = function()
    vim.cmd("silent! update")
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "OilEnter",
  callback = vim.schedule_wrap(function(args)
    local oil = require("oil")
    if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
      oil.select({ preview = true })
    end
  end),
})

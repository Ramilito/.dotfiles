local vim = vim
local function augroup(name)
  return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown", "norg" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "VimEnter" }, {
  group = augroup("statuscolumn"),
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
      return
    end

    local win_number = vim.api.nvim_get_current_win()
    local config = vim.api.nvim_win_get_config(win_number)

    if config.relative == "" then
      vim.opt_local.statuscolumn = require("user.statuscolumn")
    end
  end,
})

-- vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "InsertLeave" }, {
-- 	pattern = "*.norg",
-- 	group = augroup("auto-save"),
-- 	callback = function()
-- 		vim.cmd("silent! update")
-- 	end,
-- })

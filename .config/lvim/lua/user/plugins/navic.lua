local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
  return
end

navic.setup {
  highlight = true,
  separator = " " .. ">" .. " ",
  depth_limit = 0,
  depth_limit_indicator = "..",
}

vim.api.nvim_set_hl(0, "WinWarning", { fg = "#e0af68" })
vim.api.nvim_set_hl(0, "WinError", { bg = "NONE", fg = "#db4b4b" })
vim.api.nvim_set_hl(0, "WinInactive", { bg = "NONE", fg = "#545c7e" })

local status_ok, picker = pcall(require, "window-picker")
if not status_ok then
  return
end

picker.setup({
  selection_chars = 'TNSERIAO',
  -- fg_color = "#c0caf5", -- text
  -- current_win_hl_color = "#c0caf5", -- current window colour
  other_win_hl_color = "#c0caf5", -- all other windows colour
})

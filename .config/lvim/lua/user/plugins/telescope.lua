-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local M = {}

local _, builtin = pcall(require, "telescope.builtin")
local _, themes = pcall(require, "telescope.themes")

M.find_open_buffers = function()
  local opts = {}
  local theme_opts = themes.get_dropdown{
    sorting_strategy = "ascending",
    layout_strategy = "center",
    prompt_prefix = ">> ",
    prompt_title = "~ Open buffers ~",
    previewer = false
    -- cwd = get_runtime_dir(),
  }

  opts = vim.tbl_deep_extend("force", theme_opts, opts)
  builtin.buffers(opts)
end

return M

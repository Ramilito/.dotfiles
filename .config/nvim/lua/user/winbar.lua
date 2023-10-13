local M = {}

local utils = require "user.utils"

local is_empty = function(s)
  return s == nil or s == ""
end

local get_buf_option = function(opt)
  local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
  if not status_ok then
    return nil
  else
    return buf_option
  end
end

local function get_file()
  local diagnostics = utils.get_diagnostics()
  local icon, hl = utils.get_icon()
  local filename = "%#" .. hl .. "#" .. "   " .. " " .. "%t" .. "%*"
  if icon then
    filename = "%#" .. hl .. "#" .. icon .. " " .. "%t" .. "%*"
  end

  if diagnostics.level == "error" then
    return "%#WinError#" .. " " .. filename
  elseif diagnostics.level == "warning" then
    return "%#WinWarning#" .. " " .. filename
  elseif get_buf_option "mod" then
    return "%#WinWarning#" .. " " .. filename
  else
    return "  " .. filename
  end
end

local function get_file_inactive()
  local diagnostics = utils.get_diagnostics()
  local icon, hl = utils.get_icon()
  hl = "WinInactive"
-- BufferInactive
  local filename = "%#" .. hl .. "#" .. "   " .. " " .. "%t" .. "%*"
  if icon then
    filename = "%#" .. hl .. "#" .. icon .. " " .. "%t" .. "%*"
  end

  if diagnostics.level == "error" then
    return "%#WinError#" .. " " .. filename
  elseif diagnostics.level == "warning" then
    return "%#WinWarning#" .. " " .. filename
  elseif get_buf_option "mod" then
    return "%#WinWarning#" .. " " .. filename
  else
    return "%#WinInactive#" .. "  " .. filename
  end
end

function M.get_winbar_inactive()
  -- Use lualine disable file types
  -- if excludes() then
  --   return ""
  -- end
  --
  return "%#WinInactive#" .. "%*" .. get_file_inactive() .. "%#WinInactive#" .. "%*"
end

function M.get_winbar()
  return "%*" .. get_file() .. "%*"
end

return M

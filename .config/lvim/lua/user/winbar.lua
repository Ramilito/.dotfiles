local M = {}

local utils = require("user.utils")

M.winbar_filetype_exclude = {
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
}

local excludes = function()
	if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
		vim.opt_local.winbar = nil
		return true
	end
	return false
end

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
	elseif get_buf_option("mod") then
		return "%#WinWarning#" .. " " .. filename
	else
		return "% " .. filename
	end
end

local function get_file_inactive()
	local diagnostics = utils.get_diagnostics()
	local icon, hl = utils.get_icon()
	hl = "WinInactive"
	local filename = "%#" .. hl .. "#" .. "   " .. " " .. "%t" .. "%*"
	if icon then
		filename = "%#" .. hl .. "#" .. icon .. " " .. "%t" .. "%*"
	end

	if diagnostics.level == "error" then
		return "%#WinError#" .. " " .. filename
	elseif diagnostics.level == "warning" then
		return "%#WinWarning#" .. " " .. filename
	elseif get_buf_option("mod") then
		return "%#WinWarning#" .. " " .. filename
	else
		return "%#WinInactive#" .. "  " .. filename
	end
end

function M.get_winbar_inactive()
	-- Use lualine disable file types
	if excludes() then
		return ""
	end

	return "%#WinInactive#" .. "%*" .. get_file_inactive() .. "%#WinInactive#" .. "%*"
end

function M.set_hl()
	vim.api.nvim_set_hl(0, "WinWarning", { fg = "#e0af68" })
	vim.api.nvim_set_hl(0, "WinError", { bg = "NONE", fg = "#f7768e" })
	vim.api.nvim_set_hl(0, "WinInactive", { bg = "NONE", fg = "#545c7e" })
end

function M.get_winbar()
	-- Use lualine disable file types
	if excludes() then
		return ""
	end

	M.set_hl()
	return "%*" .. get_file() .. "%*"
end

return M

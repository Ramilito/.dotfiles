local wezterm = require("wezterm")
local helpers = require("helpers")
local theme = require("theme")

wezterm.on("format-tab-title", function(tab)
	return wezterm.format({
		{ Attribute = { Intensity = "Half" } },
		{ Text = string.format(" %s  ", tab.tab_index + 1) },
		"ResetAttributes",
		{ Text = helpers.get_process(tab) },
		{ Text = " " },
		{ Text = helpers.get_current_working_dir(tab) },
		{ Foreground = { Color = theme.base } },
		{ Text = "  ▕" },
	})
end)

wezterm.on("update-right-status", function(window)
	-- window:set_right_status(wezterm.format({
	--   { Attribute = { Intensity = "Bold" } },
	--   { Text = wezterm.strftime(" %A, %d %B %Y %I:%M %p ") },
	-- }))
end)

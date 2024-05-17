local wezterm = require("wezterm")
local act = wezterm.action

return function(config)
	config.keys = {
		{ key = "Space", mods = "ALT", action = wezterm.action.ShowLauncher },
		{
			mods = "ALT|SHIFT",
			key = [[RightArrow]],
			action = wezterm.action.SplitPane({
				top_level = false,
				direction = "Right",
				size = { Percent = 50 },
			}),
		},
		{
			mods = "ALT|SHIFT",
			key = [[LeftArrow]],
			action = wezterm.action.SplitPane({
				top_level = false,
				direction = "Left",
				size = { Percent = 50 },
			}),
		},
		{
			mods = "ALT|SHIFT",
			key = [[DownArrow]],
			action = wezterm.action.SplitPane({
				top_level = false,
				direction = "Down",
				size = { Percent = 50 },
			}),
		},
		{
			mods = "ALT|SHIFT",
			key = [[UpArrow]],
			action = wezterm.action.SplitPane({
				top_level = false,
				direction = "Up",
				size = { Percent = 50 },
			}),
		},
		{
			key = "r",
			mods = "LEADER",
			action = wezterm.action.ActivateKeyTable({
				name = "resize_pane",
				timeout_milliseconds = 1000,
				one_shot = false,
			}),
		},
		{
			key = "p",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "activate_pane",
				timeout_milliseconds = 1000,
				one_shot = false,
			}),
		},
		{
			mods = "ALT",
			key = "n",
			action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
		},
		-- {
		-- 	key = "Q",
		-- 	mods = "CTRL|ALT",
		-- 	action = wezterm.action({ CloseCurrentTab = { confirm = false } }),
		-- },
		{ key = "q", mods = "CTRL|ALT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
		{ key = "z", mods = "ALT", action = wezterm.action.TogglePaneZoomState },
		{ key = "F11", mods = "", action = wezterm.action.ToggleFullScreen },
		{ key = "DownArrow", mods = "CTRL|ALT", action = wezterm.action({ ActivateTabRelative = -1 }) },
		{ key = "UpArrow", mods = "CTRL|ALT", action = wezterm.action({ ActivateTabRelative = 1 }) },
		{ key = "{", mods = "SHIFT|ALT", action = wezterm.action.MoveTabRelative(-1) },
		{ key = "}", mods = "SHIFT|ALT", action = wezterm.action.MoveTabRelative(1) },
		{ key = "v", mods = "ALT|CTRL", action = wezterm.action.ActivateCopyMode },
		{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action({ CopyTo = "Clipboard" }) },
		{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" }) },
		{ key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
		{ key = "1", mods = "ALT", action = wezterm.action({ ActivateTab = 0 }) },
		{ key = "2", mods = "ALT", action = wezterm.action({ ActivateTab = 1 }) },
		{ key = "3", mods = "ALT", action = wezterm.action({ ActivateTab = 2 }) },
		{ key = "4", mods = "ALT", action = wezterm.action({ ActivateTab = 3 }) },
		{ key = "5", mods = "ALT", action = wezterm.action({ ActivateTab = 4 }) },
		{ key = "6", mods = "ALT", action = wezterm.action({ ActivateTab = 5 }) },
		{ key = "7", mods = "ALT", action = wezterm.action({ ActivateTab = 6 }) },
		{ key = "8", mods = "ALT", action = wezterm.action({ ActivateTab = 7 }) },
		{ key = "9", mods = "ALT", action = wezterm.action({ ActivateTab = 8 }) },
		{
			key = "LeftArrow",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action.DisableDefaultAssignment,
		},
		{
			key = "RightArrow",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action.DisableDefaultAssignment,
		},
		{
			key = "UpArrow",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action.DisableDefaultAssignment,
		},
		{
			key = "DownArrow",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action.DisableDefaultAssignment,
		},
	}
end

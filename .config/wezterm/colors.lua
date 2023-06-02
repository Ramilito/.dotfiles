local theme = require("theme")

-- local is_dark = wezterm.gui.get_appearance():find("Dark")
local is_dark = true
local module = {
	split = theme.surface0,
	foreground = theme.text,
	background = theme.base,
	cursor_bg = theme.rosewater,
	cursor_border = theme.rosewater,
	cursor_fg = is_dark and theme.base or theme.crust,
	selection_bg = theme.surface2,
	selection_fg = theme.text,
	visual_bell = theme.surface0,
	indexed = {
		[16] = theme.peach,
		[17] = theme.rosewater,
	},
	scrollbar_thumb = theme.surface2,
	compose_cursor = theme.flamingo,
	ansi = {
		is_dark and theme.surface1 or theme.surface1,
		theme.red,
		theme.green,
		theme.yellow,
		theme.blue,
		theme.pink,
		theme.teal,
		is_dark and theme.surface2 or theme.subtext1,
	},
	brights = {
		is_dark and theme.subtext0 or theme.surface2,
		theme.red,
		theme.green,
		theme.yellow,
		theme.blue,
		theme.pink,
		theme.teal,
		is_dark and theme.surface1 or theme.subtext0,
	},
	tab_bar = {
		background = theme.crust,
		active_tab = {
			bg_color = "none",
			fg_color = theme.subtext1,
			intensity = "Bold",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = theme.crust,
			fg_color = theme.surface2,
		},
		inactive_tab_hover = {
			bg_color = theme.mantle,
			fg_color = theme.subtext0,
		},
		new_tab = {
			bg_color = theme.crust,
			fg_color = theme.subtext0,
		},
		new_tab_hover = {
			bg_color = theme.crust,
			fg_color = theme.subtext0,
		},
	},
}

-- local catppuccin = {
-- 	dark = {
-- 		rosewater = "#F5E0DC",
-- 		flamingo = "#F2CDCD",
-- 		pink = "#F5C2E7",
-- 		mauve = "#CBA6F7",
-- 		red = "#F38BA8",
-- 		maroon = "#EBA0AC",
-- 		peach = "#FAB387",
-- 		yellow = "#F9E2AF",
-- 		green = "#A6E3A1",
-- 		teal = "#94E2D5",
-- 		sky = "#89DCEB",
-- 		sapphire = "#74C7EC",
-- 		blue = "#89B4FA",
-- 		lavender = "#B4BEFE",
-- 		text = "#CDD6F4",
-- 		subtext1 = "#BAC2DE",
-- 		subtext0 = "#A6ADC8",
-- 		overlay2 = "#9399B2",
-- 		overlay1 = "#7F849C",
-- 		overlay0 = "#6C7086",
-- 		surface2 = "#585B70",
-- 		surface1 = "#45475A",
-- 		surface0 = "#313244",
-- 		base = "#1E1E2E",
-- 		mantle = "#181825",
-- 		crust = "#11111B",
-- 	},
-- }
-- local theme.= is_dark and catppuccin.dark or catppuccin.light
--
return module

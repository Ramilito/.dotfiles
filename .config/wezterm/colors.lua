local is_dark = true

local theme = {
	inactive_bg = "#181818",
	inactive_fg = "#9d9d9d",
	bg = "#1f1f1f",
	bg2 = "#181818",
	fg = "#cccccc",
	blue = "#569CD6",
	green = "#608B4E",
	red = "#F44747",
	orange = "#CE9178",
	gray = "#808080",
	violet = "#646695",
	yellow = "#DCDCAA",
	pink = "#C586C0",
	teal = "#4EC9B0",

	rosewater = "#F5E0DC",
	flamingo = "#F2CDCD",
	mauve = "#CBA6F7",
	maroon = "#EBA0AC",
	peach = "#FAB387",
	sky = "#89DCEB",
	sapphire = "#74C7EC",
	lavender = "#B4BEFE",
	text = "#CDD6F4",
	subtext1 = "#BAC2DE",
	subtext0 = "#A6ADC8",
	overlay2 = "#9399B2",
	overlay1 = "#7F849C",
	overlay0 = "#6C7086",
	surface2 = "#585B70",
	surface1 = "#45475A",
	surface0 = "#313244",
	mantle = "#181825",
	crust = "#11111B",
}

local colors = {
	split = theme.surface0,
	foreground = theme.text,
	background = theme.bg,
	cursor_bg = theme.rosewater,
	cursor_border = theme.rosewater,
	cursor_fg = is_dark and theme.bg or theme.crust,
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
		background = theme.inactive_bg,
		active_tab = {
			bg_color = theme.bg2,
			fg_color = theme.fg,
			intensity = "Bold",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = theme.inactive_bg,
			fg_color = theme.inactive_fg,
			intensity = "Half",
			underline = "None",
		},
		inactive_tab_hover = {
			bg_color = theme.bg2,
			fg_color = theme.fg,
		},
		new_tab = {
			bg_color = theme.bg,
			fg_color = theme.fg,
		},
		new_tab_hover = {
			bg_color = theme.bg,
			fg_color = theme.fg,
		},
	},
}

return function(config)
	config.colors = colors
end

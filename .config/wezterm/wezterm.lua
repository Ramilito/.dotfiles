local wezterm = require("wezterm")
local keys = require("keys")
local colors = require("colors")
local hyperlink = require("hyperlink")

---@diagnostic disable-next-line: unused-local
local events = require("events")

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	default_prog = { "wsl", "--cd", "~" }
end

-- if wezterm.target_triple == 'x86_64-apple-darwin' then
--   -- Configs for OSX only
--   -- font_dirs    = { '$HOME/.dotfiles/.fonts' }
-- end
--
-- if wezterm.target_triple == 'x86_65-unknown-linux-gnu' then
--   -- Configs for Linux only
--   -- font_dirs    = { '$HOME/.dotfiles/.fonts' }
-- end

return {
	leader = { key = "a", mods = "CTRL|SHIFT", timeout_milliseconds = 1000 },
	wsl_domains = {
		{
			name = "WSL:Ubuntu-22.04",
			distribution = "Ubuntu-22.04",
			default_cwd = "~",
		},
	},
	default_prog = default_prog,
	font = wezterm.font_with_fallback({
		"JetBrains Mono Medium",
		"Apple Color Emoji",
	}),
	font_size = 11,
	max_fps = 120,
	enable_wayland = false,
	pane_focus_follows_mouse = false,
	warn_about_missing_glyphs = false,
	show_update_window = false,
	check_for_updates = false,
	line_height = 1.0,
	send_composed_key_when_left_alt_is_pressed = false,
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	audible_bell = "Disabled",
	window_padding = {
		left = 2,
		right = 2,
		top = 2,
		bottom = 2,
	},
	initial_cols = 150,
	initial_rows = 50,
	inactive_pane_hsb = {
		saturation = 0.8,
		brightness = 0.7,
	},
	enable_scroll_bar = false,
	-- tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,
	window_background_opacity = 1.0,
	tab_max_width = 50,
	hide_tab_bar_if_only_one_tab = true,
	disable_default_key_bindings = false,
	adjust_window_size_when_changing_font_size = false,
	front_end = "WebGpu",
  colors = colors,
  keys = keys,
  hyperlink_rules = hyperlink,
}

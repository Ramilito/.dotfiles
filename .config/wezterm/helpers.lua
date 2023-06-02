local wezterm = require 'wezterm'
local theme = require("theme")

local module = {}

function module.get_process(tab)
	local process_icons = {
		["docker"] = {
			{ Foreground = { Color = theme.blue } },
			{ Text = wezterm.nerdfonts.linux_docker },
		},
		["docker-compose"] = {
			{ Foreground = { Color = theme.blue } },
			{ Text = wezterm.nerdfonts.linux_docker },
		},
		["nvim"] = {
			{ Foreground = { Color = theme.green } },
			{ Text = wezterm.nerdfonts.custom_vim },
		},
		["vim"] = {
			{ Foreground = { Color = theme.green } },
			{ Text = wezterm.nerdfonts.dev_vim },
		},
		["node"] = {
			{ Foreground = { Color = theme.green } },
			{ Text = wezterm.nerdfonts.mdi_hexagon },
		},
		["zsh"] = {
			{ Foreground = { Color = theme.peach } },
			{ Text = wezterm.nerdfonts.dev_terminal },
		},
		["bash"] = {
			{ Foreground = { Color = theme.subtext0 } },
			{ Text = wezterm.nerdfonts.cod_terminal_bash },
		},
		["paru"] = {
			{ Foreground = { Color = theme.lavender } },
			{ Text = wezterm.nerdfonts.linux_archlinux },
		},
		["htop"] = {
			{ Foreground = { Color = theme.yellow } },
			{ Text = wezterm.nerdfonts.mdi_chart_donut_variant },
		},
		["cargo"] = {
			{ Foreground = { Color = theme.peach } },
			{ Text = wezterm.nerdfonts.dev_rust },
		},
		["go"] = {
			{ Foreground = { Color = theme.sapphire } },
			{ Text = wezterm.nerdfonts.mdi_language_go },
		},
		["lazydocker"] = {
			{ Foreground = { Color = theme.blue } },
			{ Text = wezterm.nerdfonts.linux_docker },
		},
		["git"] = {
			{ Foreground = { Color = theme.peach } },
			{ Text = wezterm.nerdfonts.dev_git },
		},
		["lazygit"] = {
			{ Foreground = { Color = theme.peach } },
			{ Text = wezterm.nerdfonts.dev_git },
		},
		["lua"] = {
			{ Foreground = { Color = theme.blue } },
			{ Text = wezterm.nerdfonts.seti_lua },
		},
		["wget"] = {
			{ Foreground = { Color = theme.yellow } },
			{ Text = wezterm.nerdfonts.mdi_arrow_down_box },
		},
		["curl"] = {
			{ Foreground = { Color = theme.yellow } },
			{ Text = wezterm.nerdfonts.mdi_flattr },
		},
		["gh"] = {
			{ Foreground = { Color = theme.mauve } },
			{ Text = wezterm.nerdfonts.dev_github_badge },
		},
	}

	local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")
	if wezterm.target_triple == "x86_64-pc-windows-msvc" then
		process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%3")
	end

	return wezterm.format(
		process_icons[process_name]
			or { { Foreground = { Color = theme.sky } }, { Text = string.format("[%s]", process_name) } }
	)
end


function module.get_current_working_dir(tab)
	local current_dir = tab.active_pane.current_working_dir
	local HOME_DIR = string.format("file://%s", os.getenv("HOME"))

	return current_dir == HOME_DIR and "  ~"
		or string.format("  %s", string.gsub(current_dir, "(.*[/\\])(.*)", "%2"))
end

-- return our module table
return module

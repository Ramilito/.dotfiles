local wezterm = require("wezterm")
-- local helpers = require("helpers")
-- local theme = require("theme")
local mux = wezterm.mux

-- wezterm.on("format-tab-title", function(tab)
-- 	return wezterm.format({
-- 		{ Attribute = { Intensity = "Half" } },
-- 		{ Text = string.format(" %s  ", tab.tab_index + 1) },
-- 		"ResetAttributes",
-- 		{ Text = helpers.get_process(tab) },
-- 		{ Text = " " },
-- 		{ Text = helpers.get_current_working_dir(tab) },
-- 		{ Foreground = { Color = theme.base } },
-- 		{ Text = "  ▕" },
-- 	})
-- end)
--
-- wezterm.on("update-right-status", function(window, pane)
-- 	local name = window:active_key_table()
-- 	if name then
-- 		name = "TABLE: " .. name
-- 	end
-- 	window:set_right_status(name or "")
-- end)
--
-- wezterm.on("update-right-status", function(window)
-- 	-- window:set_right_status(wezterm.format({
-- 	--   { Attribute = { Intensity = "Bold" } },
-- 	--   { Text = wezterm.strftime(" %A, %d %B %Y %I:%M %p ") },
-- 	-- }))
-- end)
--

local function start_server(project_dir, window)
  local tab, pane, window = window:spawn_tab { 
    cwd = project_dir .. '/services/vger-server',
    workspace = "server",
  }

  local server_pane = pane:split({
    direction = "Bottom",
    size = 0.3,
    cwd = project_dir .. '/services/vger-server',
  })

  server_pane:send_text("make dev\n")

  local elastic_pane = server_pane:split({
    direction = "Right",
    size = 0.3,
    cwd = project_dir .. '/services/vger-server',
  })

  elastic_pane:send_text("k port-forward svc/elasticsearch-es-http 9200:9200 -n elastic\n")

  tab:set_title("server")
end

local function start_client(project_dir, window)
  local tab, pane, window = window:spawn_tab({
    workspace = "client",
    cwd = project_dir .. '/services/vger-client',
  })

  local pane = pane:split({
    direction = "Bottom",
    size = 0.6,
    cwd = project_dir .. '/services/vger-client',
  })
  pane:send_text("make dev\n")
end


wezterm.on("gui-startup", function(cmd)
  local project_dir = "/home/ramilito/workspace/mine/rentarami"

  local tab, pane, window = mux.spawn_window({
    workspace = "config",
    cwd = "/home/ramilito/.config"
  })
  tab:set_title("config")

  start_client(project_dir, window)
  start_server(project_dir, window)

  mux.set_active_workspace("client")
end)

local wezterm = require("wezterm")
local mux = wezterm.mux

local function start_server(root_dir, root_window)
	local project_dir = root_dir .. "/services/vger-server"
	local tab, pane, window = root_window:spawn_tab({
		cwd = project_dir,
	})
	pane:send_text("nvim\n")

	local build_pane = pane:split({
		direction = "Bottom",
		size = 0.3,
		cwd = project_dir,
	})

	build_pane:send_text("make dev\n")

	local elastic_pane = build_pane:split({
		direction = "Right",
		size = 0.3,
		cwd = project_dir,
	})

	elastic_pane:send_text("k port-forward svc/elasticsearch-es-http 9200:9200 -n elastic\n")

	local kgp_pane = elastic_pane:split({
		direction = "Bottom",
		size = 0.5,
		cwd = project_dir,
	})

	kgp_pane:send_text("watch 'kubectl get pods -n services'\n")

	tab:set_title("server")
end

local function start_client(root_dir, root_window)
	local project_dir = root_dir .. "/services/vger-client"
	local tab, pane, window = root_window:spawn_tab({
		cwd = project_dir,
	})

	pane:send_text("nvim\n")

	local build_pane = pane:split({
		direction = "Bottom",
		size = 0.3,
		cwd = project_dir,
	})

	build_pane:send_text("make dev\n")

	tab:set_title("client")
end

wezterm.on("gui-startup", function(cmd)
	local project_dir = "/home/ramilito/workspace/mine/rentarami"

	local tab, pane, window = mux.spawn_window({
		workspace = "config",
		cwd = "/home/ramilito/.config",
	})
	tab:set_title("config")

	pane:send_text("nvim\n")
	start_client(project_dir, window)
	start_server(project_dir, window)

	mux.set_active_workspace("client")
end)

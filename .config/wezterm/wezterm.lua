local wezterm = require("wezterm")
local keys = require("keys")
local ui = require("ui")
local colors = require("colors")
local hyperlink = require("hyperlink")
-- local events = require("events")
local plugins = require("plugins")

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

keys(config)
ui(config)
colors(config)
hyperlink(config)
plugins(config)

config.check_for_updates = false
config.disable_default_key_bindings = false

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.default_domain = 'WSL:Ubuntu-22.04'
end

return config

-- -- if wezterm.target_triple == 'x86_64-apple-darwin' then
-- --   -- Configs for OSX only
-- --   -- font_dirs    = { '$HOME/.dotfiles/.fonts' }
-- -- end
-- --
-- -- if wezterm.target_triple == 'x86_65-unknown-linux-gnu' then
-- --   -- Configs for Linux only
-- --   -- font_dirs    = { '$HOME/.dotfiles/.fonts' }
-- -- end

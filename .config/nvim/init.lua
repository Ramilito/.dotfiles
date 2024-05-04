local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("user.options")
require("user.highlights")
require("user.autocmd")
-- require("user.indentline")
local plugins = require("user.plugins")
local otherPlugins = {
	require("user.plugins.theme"),
	require("user.plugins.gitsigns"),
	require("user.plugins.telescope"),
	require("user.plugins.treesitter"),
	require("user.plugins.trouble"),
	require("user.plugins.which-key"),
	require("user.plugins.nvim-bqf"),
	require("user.plugins.neorg"),
	require("user.plugins.silicon"),
	require("user.plugins.navigator"),
	require("user.plugins.mini-files"),
	require("user.plugins.conform"),
	require("user.plugins.neogit"),
	require("user.plugins.profile"),
	-- require("user.plugins.ai"),
}

for k in pairs(otherPlugins) do
	table.insert(plugins, otherPlugins[k])
end

require("lazy").setup(plugins)

require("user.keymappings")

-- local should_profile = os.getenv("NVIM_PROFILE")
-- if should_profile then
-- 	require("profile").instrument_autocmds()
-- 	if should_profile:lower():match("^start") then
-- 		require("profile").start("*")
-- 	else
-- 		require("profile").instrument("*")
-- 	end
-- end
--
-- local function toggle_profile()
-- 	local prof = require("profile")
-- 	if prof.is_recording() then
-- 		prof.stop()
-- 		vim.ui.input({ prompt = "Save profile to:", completion = "file", default = "profile.json" }, function(filename)
-- 			if filename then
-- 				prof.export(filename)
-- 				vim.notify(string.format("Wrote %s", filename))
-- 			end
-- 		end)
-- 	else
-- 		prof.start("*")
-- 	end
-- end
--
-- vim.keymap.set("", "<f1>", toggle_profile)

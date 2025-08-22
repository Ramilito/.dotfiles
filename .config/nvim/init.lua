-- require("user.highlights")
require("user.autocmd")
require("user.options")
require("user.plugins")
require("user.plugins.theme")
require("user.plugins.treesitter")
require("user.plugins.conform")
require("user.plugins.gitsigns")
require("user.plugins.mini-files")
require("user.plugins.mini-ai")
-- require("user.plugins.mini-surround")
require("user.plugins.fzf-lua")
require("user.plugins.neogit")
require("user.plugins.blink-cmp")
require("user.plugins.obsidian")
require("user.plugins.render-markdown")
require("user.plugins.silicon")
require("user.plugins.trouble")
require("user.plugins.smart-splits")
-- require("user.plugins.which-key")
-- require("user.plugins.flash")
-- require("user.plugins.snacks")
require("user.plugins.kubectl")

if vim.fn.has("win64") == 0 then
  require("user.plugins.winbar")
end

require("user.keymappings")
require("user.lsp")

-- if vim.env.PROF then
--   -- example for lazy.nvim
--   -- change this to the correct path for your plugin manager
--   local snacks = vim.fn.stdpath("data") .. "/lazy/snacks.nvim"
--   vim.opt.rtp:append(snacks)
--   require("snacks.profiler").startup({
--     startup = {
--       event = "VimEnter", -- stop profiler on this event. Defaults to `VimEnter`
--       -- event = "UIEnter",
--       -- event = "VeryLazy",
--     },
--   })
-- end

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

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("user.options")
require("user.highlights")
require("user.autocmd")
-- require("user.indentline")
local plugins = require("user.plugins")
local otherPlugins = {
  require("user.plugins.gitsigns"),
  require("user.plugins.conform"),
  require("user.plugins.markdown"),
  require("user.plugins.devicons"),
  require("user.plugins.mini-files"),
  require("user.plugins.smart-splits"),
  require("user.plugins.neogit"),
  require("user.plugins.nvim-bqf"),
  require("user.plugins.profile"),
  require("user.plugins.silicon"),
  require("user.plugins.telescope"),
  require("user.plugins.theme"),
  require("user.plugins.treesitter"),
  require("user.plugins.trouble"),
  require("user.plugins.which-key"),
  require("user.plugins.winbar"),
  require("user.plugins.kubectl"),
  -- require("user.plugins.ai"),
  require("user.plugins.cmp"),
  require("user.plugins.mason"),
  require("user.plugins.lsp"),
  require("user.plugins.obsidian"),
  require("user.plugins.zen-mode"),
  require("user.plugins.image"),
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

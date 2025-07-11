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
-- require("user.highlights")
require("user.autocmd")
local plugins = require("user.plugins")
local otherPlugins = {
  require("user.plugins.gitsigns"),
  require("user.plugins.conform"),
  require("user.plugins.render-markdown"),
  require("user.plugins.mini-files"),
  require("user.plugins.mini-ai"),
  require("user.plugins.mini-surround"),
  require("user.plugins.smart-splits"),
  require("user.plugins.neogit"),
  require("user.plugins.nvim-bqf"),
  require("user.plugins.profile"),
  require("user.plugins.silicon"),
  require("user.plugins.fzf-lua"),
  require("user.plugins.theme"),
  require("user.plugins.treesitter"),
  require("user.plugins.trouble"),
  -- require("user.plugins.which-key"),
  require("user.plugins.blink-cmp"),
  require("user.plugins.obsidian"),
  require("user.plugins.snacks"),
  -- require("user.plugins.image"),
  require("user.plugins.blink-download"),
  require("user.plugins.kubectl"),
}

if vim.fn.has("win64") == 0 then
  vim.list_extend(otherPlugins, {
    require("user.plugins.winbar"),
  })
end

for k in pairs(otherPlugins) do
  table.insert(plugins, otherPlugins[k])
end

require("lazy").setup(plugins)
require("user.keymappings")
require("user.plugins.lsp")


if vim.env.PROF then
  -- example for lazy.nvim
  -- change this to the correct path for your plugin manager
  local snacks = vim.fn.stdpath("data") .. "/lazy/snacks.nvim"
  vim.opt.rtp:append(snacks)
  require("snacks.profiler").startup({
    startup = {
      event = "VimEnter", -- stop profiler on this event. Defaults to `VimEnter`
      -- event = "UIEnter",
      -- event = "VeryLazy",
    },
  })
end

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

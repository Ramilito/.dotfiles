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
require("user.keymappings")
require("user.highlights")
require("user.autocmd")

local plugins = require("user.plugins")
local otherPlugins = {
  require("user.plugins.gitsigns"),
  require("user.plugins.telescope"),
  require("user.plugins.treesitter"),
  require("user.plugins.trouble"),
  require("user.plugins.which-key"),
  require("user.plugins.silicon"),
  require("user.plugins.nvimtree"),
  require("user.plugins.nvim-bqf"),
  require("user.plugins.nvim-navic"),
  require("user.plugins.neorg"),
}
for k in pairs(otherPlugins) do
  table.insert(plugins, otherPlugins[k])
end

require("lazy").setup(plugins)
-- require("user.lazy")
require("user.lsp")

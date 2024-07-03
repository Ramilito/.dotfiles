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

local plugins = {}

local otherPlugins = {
  require("user.keymappings-vscode"),
}

for k in pairs(otherPlugins) do
  table.insert(plugins, otherPlugins[k])
end

require("lazy").setup(plugins)

local vim = vim
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
-- require("user.plugins.nvim-cmp")
require("user.plugins.obsidian")
require("user.plugins.render-markdown")
require("user.plugins.silicon")
require("user.plugins.trouble")
require("user.plugins.smart-splits")
-- require("user.plugins.which-key")
-- require("user.plugins.flash")
-- require("user.plugins.snacks")
require("user.plugins.lazydev")
require("user.plugins.kubectl")
require("user.plugins.firenvim")

if vim.fn.has("win64") == 0 then
  require("user.plugins.winbar")
end

vim.cmd("packadd nvim.difftool")

require("user.keymappings")
require("user.lsp")

-- require("user.profiling")

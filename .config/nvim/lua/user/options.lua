local opt = vim.opt
local o = vim.o
local g = vim.g

vim.o.number = true
vim.o.relativenumber = true
o.wrap = false

o.ignorecase = true
o.smartcase = true
o.shortmess = "filnxtToOFWIcC"

g.mapleader = " "
g.maplocalleader = " "

-- Set colorscheme
-- vim.o.termguicolors = true
-- vim.cmd [[ colorscheme tokyonight-night ]]
-- vim.cmd [[ colorscheme catppuccin ]]

-- vim.o.clipboard = 'unnamedplus'
--
-- Undotree
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
opt.undofile = true

-- opt.foldcolumn     = "1"
opt.foldenable     = true
-- opt.foldexpr       = "nvim_treesitter#foldexpr()"
opt.foldlevel      = 99 -- was 1
opt.foldlevelstart = 99
-- opt.foldmethod     = "expr"
opt.foldmethod     = "indent"
opt.foldnestmax    = 10

opt.cmdheight = 1
opt.completeopt = "menu,menuone,noselect"
-- opt.conceallevel = 2 -- Hide * markup for bold and italic
-- opt.concealcursor = "nc"
-- opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 0
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.scrolloff = 8
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftwidth = 2
opt.showmode = false -- dont show mode since we have a statusline
opt.showtabline = 0
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes"
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitkeep = "screen"
opt.tabstop = 2
opt.timeoutlen = 1000
opt.updatetime = 50

if vim.fn.has "wsl" == 1 then
  g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end


local opt = vim.opt
local g = vim.g

g.loaded_matchparen = 0
g.mapleader = " "
g.maplocalleader = " "

-- Statuscolumn
opt.number = true
opt.relativenumber = true
-- opt.foldcolumn     = "1"
opt.signcolumn = "number"

-- Undotree
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
opt.undofile = true

opt.foldenable     = true
-- opt.foldexpr       = "nvim_treesitter#foldexpr()"
opt.foldlevel      = 99 -- was 1
opt.foldlevelstart = 99
-- opt.foldmethod     = "expr"
opt.foldmethod     = "indent"
opt.foldnestmax    = 10

-- opt.concealcursor = "nc"
-- opt.conceallevel = 2 -- Hide * markup for bold and italic
opt.cmdheight = 1
opt.completeopt = "menu,menuone,noselect"
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.scrolloff = 8
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftwidth = 2
opt.showmode = false -- dont show mode since we have a statusline
opt.showtabline = 0
opt.sidescrolloff = 8 -- Columns of context
opt.smartindent = true -- Insert indents automatically
opt.smoothscroll = true
opt.spelllang = { "en" }
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2
opt.timeoutlen = 1000
opt.updatetime = 50
opt.wrap = false
opt.showmatch = false
opt.ignorecase = true
opt.smartcase = true
opt.shortmess = "filnxtToOFWIcC"


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



vim.opt.autoread = true
vim.opt.showtabline = 0
-- vim.opt.laststatus = 3
-- vim.opt.cmdheight = 0
-- vim.opt.winbar = "%f"

vim.o.number = true
vim.o.relativenumber = true
vim.o.splitkeep = "screen"
vim.opt.timeoutlen = 1000
vim.opt.confirm = true
-- vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- Bottom line
vim.opt.shortmess:append "c"

-- Folding
-- vim.wo.foldcolumn = '1'
-- vim.wo.foldlevel = 99 -- feel free to decrease the value
-- vim.wo.foldenable = true
-- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- vim.o.foldlevelstart = -1

--rust
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

vim.opt.clipboard = "unnamedplus"

-- Undotree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/lvim/undodir"
vim.opt.undofile = true

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
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

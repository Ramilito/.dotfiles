local opt = vim.opt

vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.shortmess = "filnxtToOFWIcCS"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.cursorline = true -- Enable highlighting of the current line
opt.completeopt = "menu,menuone,noselect"
opt.tabstop = 2
opt.expandtab = true
opt.shiftwidth = 2
opt.showtabline = 0
opt.laststatus = 0
opt.cmdheight = 1
opt.signcolumn = "yes"
opt.smartindent = true -- Insert indents automatically
opt.splitkeep = "screen"
opt.spelllang = { "en" }
opt.showmode = false -- dont show mode since we have a statusline
opt.scrolloff = 8
opt.sidescrolloff = 8 -- Columns of context
opt.updatetime = 50
opt.timeoutlen = 1000
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup


if vim.fn.has "wsl" == 1 then
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

vim.api.nvim_create_autocmd({ "CursorMoved", "VimEnter" }, {
  callback = function()
    local winbar_filetype_exclude = {
      "help",
      "startify",
      "dashboard",
      "packer",
      "neo-tree",
      "neogitstatus",
      "NvimTree",
      "Trouble",
      "alpha",
      "lir",
      "Outline",
      "spectre_panel",
      "toggleterm",
      "TelescopePrompt",
      "prompt",
    }

    if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
      vim.opt_local.winbar = nil
      return
    end

    local win_number = vim.api.nvim_get_current_win()
    local config = vim.api.nvim_win_get_config(win_number)

    if config.relative == "" then
      -- opt_local.winbar = "%{%v:lua.require'user.winbar'.get_winbar()%}"
      -- opt_local.statuscolumn = "%=%s%=%@SignCb@%=%{v:relnum?v:relnum:v:lnum}%C|"
      vim.opt_local.winbar = "%v " .. require("user.winbar").get_winbar()
      vim.opt_local.statuscolumn = require("user.statuscolumn")
    else
      vim.opt_local.winbar = nil
    end
  end,
})

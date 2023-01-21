vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false

vim.o.ignorecase = true
vim.o.smartcase = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set colorscheme
-- vim.o.termguicolors = true
-- vim.cmd [[ colorscheme tokyonight-night ]]
-- vim.cmd [[ colorscheme catppuccin ]]

-- vim.o.clipboard = 'unnamedplus'
--
-- Undotree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true

-- vim.opt.foldcolumn     = "1"
vim.opt.foldenable     = true
-- vim.opt.foldexpr       = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel      = 99 -- was 1
vim.opt.foldlevelstart = 99
-- vim.opt.foldmethod     = "expr"
vim.opt.foldmethod     = "indent"
vim.opt.foldnestmax    = 10

vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vim.opt.conceallevel = 3 -- Hide * markup for bold and italic
vim.opt.ignorecase = true -- Ignore case
vim.opt.inccommand = "nosplit" -- preview incremental substitute
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.showtabline = 0
vim.opt.laststatus = 0
vim.opt.cmdheight = 1
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.splitkeep = "screen"
vim.opt.spelllang = { "en" }
vim.opt.showmode = false -- dont show mode since we have a statusline
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8 -- Columns of context
vim.opt.updatetime = 50
vim.opt.timeoutlen = 1000
vim.o.shortmess = "filnxtToOFWIcCS"
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup


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
      -- vim.opt_local.winbar = "%{%v:lua.require'user.winbar'.get_winbar()%}"
      -- vim.opt_local.statuscolumn = "%=%s%=%@SignCb@%=%{v:relnum?v:relnum:v:lnum}%C|"
      vim.opt_local.winbar = "%v " .. require("user.winbar").get_winbar()
      vim.opt_local.statuscolumn = require("user.statuscolumn")
    else
      vim.opt_local.winbar = nil
    end
  end,
})

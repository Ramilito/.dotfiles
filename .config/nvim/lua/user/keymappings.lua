local map = vim.api.nvim_set_keymap

-- unmaps
map('n', 'q', '<nop>', { noremap = true, silent = true })
map('n', 'Q', '<nop>', { noremap = true, silent = true })
map('n', 'h', '<nop>', { noremap = true, silent = true })
map('n', 'j', '<nop>', { noremap = true, silent = true })
map('n', 'k', '<nop>', { noremap = true, silent = true })
map('n', 'l', '<nop>', { noremap = true, silent = true })

-- Quit
map('n', '<leader>q', '<cmd>lua require("user.functions").smart_quit()<CR>',
  { desc = "Quit", noremap = true, silent = true })

-- Save buffer
map("n", "<C-s>", ":w<cr>", { desc = "Buffer save", noremap = true, silent = true })
map("n", "<TAB>", ":bnext<CR>", { desc = "Buffer next", noremap = true, silent = true })
map("n", "<S-TAB>", ":bprevious<CR>", { desc = "Buffer prev", noremap = true, silent = true })

-- Better window navigation
map("n", "<C-Left>", "<c-w><left>", { desc = "Window left", noremap = true, silent = true })
map("n", "<C-Right>", "<c-w><right>", { desc = "Window right", noremap = true, silent = true })
map("n", "<C-Up>", "<c-w><up>", { desc = "Window up", noremap = true, silent = true })
map("n", "<C-Down>", "<c-w><down>", { desc = "Window down", noremap = true, silent = true })

-- -- Resize windows
map("n", "<C-S-Left>", ":vertical resize -2<CR>",
  { desc = "Resize left", noremap = true, silent = true })
map("n", "<C-S-Right>", ":vertical resize +2<CR>",
  { desc = "Resize rigth", noremap = true, silent = true })
map("n", "<C-S-Up>", ":resize -2<CR>", { desc = "Resize up", noremap = true, silent = true })
map("n", "<C-S-Down>", ":resize +2<CR>", { desc = "Resize down", noremap = true, silent = true })

-- Move text up and down
map("i", "<S-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Move up", noremap = true, silent = true })
map("i", "<S-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Move up", noremap = true, silent = true })
map("n", "<S-Down>", ":m .+1<CR>==", { desc = "Move down", noremap = true, silent = true })
map("n", "<S-Up>", ":m .-2<CR>==", { desc = "Move up", noremap = true, silent = true })
map("v", "<S-Up>", ":m '<-2<CR>gv=gv", { desc = "Move up", noremap = true, silent = true })
map("v", "<S-Down>", ":m '>+1<CR>gv=gv", { desc = "Move down", noremap = true, silent = true })

-- map("n", "<C-p>", ":lua require'telescope'.find_open_buffers()<CR>", { desc = "Find open buffers", noremap = true, silent = true })
vim.keymap.set('n', '<C-p>', "<cmd> Telescope buffers <CR>",
  { desc = '[ ] Find existing buffers', noremap = true, silent = true })

-- Don't overrite yanked text
map("v", "<leader>p", "\"_dp", { desc = "Paste", noremap = true, silent = true })
map("n", "<leader>y", "\"+y", { desc = "Yank", noremap = true, silent = true })
map("v", "<leader>y", "\"+y", { desc = "Yank", noremap = true, silent = true })
map("v", "<leader>d", "\"_d", { desc = "Delete", noremap = true, silent = true })
map("n", "<leader>d", "\"_d", { desc = "Delete", noremap = true, silent = true })

map("n", "Y", "yg$", { desc = "Join lines", noremap = true, silent = true })

-- delete word ctrl bs seems to be sent as C-H
map('i', '<C-H>', '<C-w>', { desc = "Delete word", noremap = true, silent = true })

-- Corne issue with shift del
map('i', '<S-Del>', '<Del>', { desc = "Delete char", noremap = true, silent = true })
map('n', '<S-Del>', '<Del>', { desc = "Delete char", noremap = true, silent = true })

-- no highlight
map('n', '<ESC>', '<cmd>noh<CR>', { desc = "nohl", noremap = true, silent = true })
-- map('n', '<leader>h', '<cmd>nohlsearch<CR>', { desc = "nohl", noremap = true, silent = true })

-- close buffer
map('n', '<leader>c', '<cmd>Bdelete<CR>', { desc = "Close buffer", noremap = true, silent = true })

-- close all but current buffer
map('n', '<leader>C', '<cmd>lua require("user.functions").close_all_but_current()<CR>',
  { desc = "Close all but current", noremap = true, silent = true })
map('n', '<leader>ul', '<cmd>Lazy<cr>', { desc = "Lazy", noremap = true, silent = true })
map('n', '<leader>e', '<cmd>Vexplore<CR>', { desc = "Explorer", noremap = true, silent = true })
map('n', '<leader>/', ':normal gcc<CR>', { desc = "Comment", noremap = true, silent = true })
map('v', '<leader>/', '<Plug>(comment_toggle_linewise_visual)',
  { desc = "Comment", noremap = true, silent = true })

map('v', '<leader>f', 'vim.lsp.buf.format(opts)', { desc = "Format", noremap = true, silent = true })
map('n', '<leader>f', '<cmd>LspZeroFormat<cr>', { desc = "Format", noremap = true, silent = true })

map('n', '<leader>e', '<cmd> NvimTreeToggle <CR>',
  { desc = "Explorer", noremap = true, silent = true })

map('n', '<leader>gu', '<cmd> UndotreeToggle <CR>',
  { desc = "Explorer", noremap = true, silent = true })

-- Git
map('n', '<leader>gg', '<cmd>lua require("user.functions").lazygit_toggle()<cr>',
  { desc = "Lazygit", noremap = true, silent = true })

--norg
map('n', '<leader>nn', '<cmd>Neorg workspace notes <cr> <bar> <cmd> Neorg keybind norg core.norg.dirman.new.note<cr>',
  { desc = "Norg", noremap = true, silent = true })

map('n', '<leader>nj', '<cmd>Neorg workspace notes <cr> <bar> <cmd> Neorg journal today<cr>',
  { desc = "Norg", noremap = true, silent = true })


-- trouble
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", {silent = true, noremap = true})
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", {silent = true, noremap = true})
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", {silent = true, noremap = true})
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", {silent = true, noremap = true})
map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", {silent = true, noremap = true})

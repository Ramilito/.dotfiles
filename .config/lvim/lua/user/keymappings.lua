-- unmaps
vim.api.nvim_set_keymap('n', 'q', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Q', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'h', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'l', '<nop>', { noremap = true, silent = true })

-- Quit
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua require("user.functions").smart_quit()<CR>',
  { desc = "Quit", noremap = true, silent = true })

-- Save buffer
vim.api.nvim_set_keymap("n", "<C-s>", ":w<cr>", { desc = "Buffer save", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<TAB>", ":bnext<CR>", { desc = "Buffer next", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-TAB>", ":bprevious<CR>", { desc = "Buffer prev", noremap = true, silent = true })

-- Better window navigation
vim.api.nvim_set_keymap("n", "<C-Left>", "<c-w><left>", { desc = "Window left", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Right>", "<c-w><right>", {desc = "Window right", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Up>", "<c-w><up>", {desc = "Window up", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Down>", "<c-w><down>", { desc = "Window down", noremap = true, silent = true })

-- -- Resize windows
vim.api.nvim_set_keymap("n", "<C-S-Left>", ":vertical resize -2<CR>", { desc = "Resize left", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-Right>", ":vertical resize +2<CR>", { desc = "Resize rigth", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-Up>", ":resize -2<CR>", { desc = "Resize up", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-Down>", ":resize +2<CR>", { desc = "Resize down", noremap = true, silent = true })

-- Move text up and down
vim.api.nvim_set_keymap("i", "<S-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Move up", noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Move up", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Down>", ":m .+1<CR>==", { desc = "Move down", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Up>", ":m .-2<CR>==", { desc = "Move up", noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<S-Up>", ":m '<-2<CR>gv=gv", { desc = "Move up", noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<S-Down>", ":m '>+1<CR>gv=gv", { desc = "Move down", noremap = true, silent = true })

-- vim.api.nvim_set_keymap("n", "<C-p>", ":lua require'telescope'.find_open_buffers()<CR>", { desc = "Find open buffers", noremap = true, silent = true })
vim.keymap.set('n', '<C-p>', "<cmd> Telescope buffers <CR>", { desc = '[ ] Find existing buffers', noremap = true, silent = true  })

-- Don't overrite yanked text
vim.api.nvim_set_keymap("v", "<leader>p", "\"_dP", { desc = "Paste", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>y", "\"+y", { desc = "Yank", noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>y", "\"+y", { desc = "Yank", noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>d", "\"_d", { desc = "Delete", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>d", "\"_d", { desc = "Delete", noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "Y", "yg$", { desc = "Join lines", noremap = true, silent = true })

-- delete word ctrl bs seems to be sent as C-H
vim.api.nvim_set_keymap('i', '<C-H>', '<C-w>', { desc = "Delete word", noremap = true, silent = true })

-- Corne issue with shift del
vim.api.nvim_set_keymap('i', '<S-Del>', '<Del>', { desc = "Delete char", noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Del>', '<Del>', { desc = "Delete char", noremap = true, silent = true })

-- no highlight
vim.api.nvim_set_keymap('n', '<ESC>', '<cmd>noh<CR>', { desc = "nohl", noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>nohlsearch<CR>', { desc = "nohl", noremap = true, silent = true })

-- close buffer
vim.api.nvim_set_keymap('n', '<leader>c', '<cmd>Bdelete<CR>', { desc = "Close buffer", noremap = true, silent = true })

-- close all but current buffer
vim.api.nvim_set_keymap('n', '<leader>C', '<cmd>lua require("user.functions").close_all_but_current()<CR>', { desc = "Close all but current", noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ul', '<cmd>Lazy<cr>', { desc = "Lazy", noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>Vexplore<CR>', { desc = "Explorer", noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>/', '<Plug>(comment_toggle_linewise)', { desc = "Comment", noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<leader>lf', 'vim.lsp.buf.format(opts)', { desc = "Format", noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>e', '<cmd> NvimTreeToggle <CR>', { desc = "Explorer", noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>gu', '<cmd> UndotreeToggle <CR>', { desc = "Explorer", noremap = true, silent = true })
-- Git
vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>lua require("user.functions").lazygit_toggle()<cr>', { desc = "Lazygit", noremap = true, silent = true })

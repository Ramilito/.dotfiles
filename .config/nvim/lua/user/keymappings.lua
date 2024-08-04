-- local Map = vim.api.nvim_set_keymap

function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Map("n", "<leader>m", 'q', { desc = "Macro" })

-- unMaps
-- Map("n", "q", "<nop>")
Map("n", "Q", "<nop>")
Map("n", "h", "<nop>")
Map("n", "j", "<nop>")
Map("n", "k", "<nop>")
Map("n", "l", "<nop>")

-- Quit
Map("n", "<leader>q", '<cmd> lua require("user.functions").smart_quit()<CR>', { desc = "Quit" })

-- Save buffer
Map("n", "<C-s>", ":w<cr>", { desc = "Buffer save" })
Map("n", "<TAB>", ":bnext<CR>", { desc = "Buffer next" })
Map("n", "<S-TAB>", ":bprevious<CR>", { desc = "Buffer prev" })

-- Better window navigation
-- Map("n", "<C-Left>", "<c-w><left>", { desc = "Window left" })
-- Map("n", "<C-Right>", "<c-w><right>", { desc = "Window right" })
-- Map("n", "<C-Up>", "<c-w><up>", { desc = "Window up" })
-- Map("n", "<C-Down>", "<c-w><down>", { desc = "Window down" })

-- Resize windows
-- Map("n", "<C-S-Left>", ":vertical resize -2<CR>", { desc = "Resize left" })
-- Map("n", "<C-S-Right>", ":vertical resize +2<CR>", { desc = "Resize rigth" })
-- Map("n", "<C-S-Up>", ":resize -2<CR>", { desc = "Resize up" })
-- Map("n", "<C-S-Down>", ":resize +2<CR>", { desc = "Resize down" })

vim.keymap.set("n", "<C-S-Left>", "<cmd>lua require('smart-splits').resize_left() <cr>")
vim.keymap.set("n", "<C-S-Down>", "<cmd>lua require('smart-splits').resize_down() <cr>")
vim.keymap.set("n", "<C-S-Up>", "<cmd>lua require('smart-splits').resize_up() <cr>")
vim.keymap.set("n", "<C-S-Right>", "<cmd>lua require('smart-splits').resize_right() <cr>")
-- moving between splits
vim.keymap.set("n", "<C-Left>", "<cmd>lua require('smart-splits').move_cursor_left() <cr>")
vim.keymap.set("n", "<C-Down>", "<cmd>lua require('smart-splits').move_cursor_down() <cr>")
vim.keymap.set("n", "<C-Up>", "<cmd>lua require('smart-splits').move_cursor_up() <cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>lua require('smart-splits').move_cursor_right() <cr>")

-- Move text up and down
Map("i", "<S-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Move up" })
Map("i", "<S-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Move up" })
Map("n", "<S-Down>", ":m .+1<CR>==", { desc = "Move down" })
Map("n", "<S-Up>", ":m .-2<CR>==", { desc = "Move up" })
Map("v", "<S-Up>", ":m '<-2<CR>gv=gv", { desc = "Move up" })
Map("v", "<S-Down>", ":m '>+1<CR>gv=gv", { desc = "Move down" })

-- Map("n", "<C-p>", ":lua require'telescope'.find_open_buffers()<CR>", { desc = "Find open buffers" })
vim.keymap.set(
  "n",
  "<C-p>",
  '<cmd>lua require("telescope.builtin").buffers({ sort_mru = true }) <CR>',
  { desc = "[ ] Find existing buffers" }
)

-- Don't overrite yanked text
Map("v", "<leader>p", '"_dp', { desc = "Paste" })
Map("n", "<leader>y", '"+y', { desc = "Yank" })
Map("v", "<leader>y", '"+y', { desc = "Yank" })
Map("v", "<leader>d", '"_d', { desc = "Delete" })
Map("n", "<leader>d", '"_d', { desc = "Delete" })

Map("n", "Y", "yg$", { desc = "Join lines" })

-- delete word ctrl bs seems to be sent as C-H
Map("i", "<C-H>", "<C-w>", { desc = "Delete word" })

-- Corne issue with shift del
Map("i", "<S-Del>", "<Del>", { desc = "Delete char" })
Map("n", "<S-Del>", "<Del>", { desc = "Delete char" })

-- clear search
Map("n", "<ESC>", ":let @/=''<CR>", { desc = "clear search" })

-- close buffer
Map("n", "<leader>c", "<cmd>bdelete<CR>", { desc = "Close buffer" })

-- close all but current buffer
Map("n", "<leader>C", '<cmd>lua require("user.functions").close_all_but_current()<CR>', { desc = "Close all but current" })
Map("n", "<leader>ul", "<cmd>Lazy<cr>", { desc = "Lazy" })

Map("v", "<leader>f", "<cmd>lua require('conform').format(opts) <cr>", { desc = "Format" })
Map("n", "<leader>f", "<cmd>lua require('conform').format() <cr>", { desc = "Format" })

Map("n", "<leader>su", '<cmd>lua require("telescope").extensions.undo.undo({ side_by_side = true }) <CR>', { desc = "Undo" })

-- Git
Map("n", "<leader>gt", '<cmd>lua require("user.functions").lazygit_toggle()<cr>', { desc = "Lazygit" })
-- Map("n", "<leader>gg", '<cmd>Neogit<cr>', { desc = "Neogit" })

--norg
Map("n", "<leader>nn", "<cmd>Neorg workspace notes <cr> <bar> <cmd> Neorg keybind norg core.dirman.new.note<cr>", { desc = "Norg" })

Map("n", "<leader>nj", "<cmd>Neorg workspace notes <cr> <bar> <cmd> Neorg journal today<cr>", { desc = "Norg" })

-- Indenting
Map("v", "<", "<gv", { desc = "Indent left" })
Map("v", ">", ">gv", { desc = "Indent right" })

-- Map("n", "?", "!", { desc = "Backward search" })
Map("n", "?", "/", { desc = "Forward search", silent = false })

Map("n", "<leader>k", '<cmd>lua require("kubectl").open()<cr>')
Map("n", "<leader>m", '<cmd> lua require("user.functions").move_messages_to_buffer()<CR>')

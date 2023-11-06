-- local Map = vim.api.nvim_set_keymap

function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- unMaps
Map("n", "q", "<nop>")
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
Map({'n', 't'}, '<C-Left>', '<CMD>NavigatorLeft<CR>')
Map({'n', 't'}, '<C-Right>', '<CMD>NavigatorRight<CR>')
Map({'n', 't'}, '<C-Down>', '<CMD>NavigatorDown<CR>')
Map({'n', 't'}, '<C-Up>', '<CMD>NavigatorUp<CR>')

-- Resize windows
-- Map("n", "<C-S-Left>", ":vertical resize -2<CR>", { desc = "Resize left" })
-- Map("n", "<C-S-Right>", ":vertical resize +2<CR>", { desc = "Resize rigth" })
-- Map("n", "<C-S-Up>", ":resize -2<CR>", { desc = "Resize up" })
-- Map("n", "<C-S-Down>", ":resize +2<CR>", { desc = "Resize down" })
Map({'n', 't'}, '<C-S-Left>', '<CMD>NavigatorSizeLeft<CR>')
Map({'n', 't'}, '<C-S-Right>', '<CMD>NavigatorSizeRight<CR>')
Map({'n', 't'}, '<C-S-Down>', '<CMD>NavigatorSizeDown<CR>')
Map({'n', 't'}, '<C-S-Up>', '<CMD>NavigatorSizeUp<CR>')

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
	"<cmd> Telescope buffers <CR>",
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

-- no highlight
Map("n", "<ESC>", "<cmd>noh<CR>", { desc = "nohl" })
-- Map('n', '<leader>h', '<cmd>nohlsearch<CR>', { desc = "nohl" })

-- close buffer
Map("n", "<leader>c", "<cmd>Bdelete<CR>", { desc = "Close buffer" })

-- close all but current buffer
Map(
	"n",
	"<leader>C",
	'<cmd>lua require("user.functions").close_all_but_current()<CR>',
	{ desc = "Close all but current" }
)
Map("n", "<leader>ul", "<cmd>Lazy<cr>", { desc = "Lazy" })
Map("n", "<leader>e", "<cmd>Vexplore<CR>", { desc = "Explorer" })
Map("n", "<leader>/", ":normal gcc<CR>", { desc = "Comment" })
Map("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", { desc = "Comment" })

Map("v", "<leader>f", "vim.lsp.buf.format(opts)", { desc = "Format" })
Map("n", "<leader>f", "<cmd>LspZeroFormat<cr>", { desc = "Format" })

Map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "Explorer" })

Map("n", "<leader>gu", "<cmd> UndotreeToggle <CR>", { desc = "Explorer" })

-- Git
Map("n", "<leader>gg", '<cmd>lua require("user.functions").lazygit_toggle()<cr>', { desc = "Lazygit" })

--norg
Map("n", "<leader>nn", "<cmd>Neorg workspace notes <cr> <bar> <cmd> Neorg keybind norg core.dirman.new.note<cr>",
	{ desc = "Norg" })

Map("n", "<leader>nj", "<cmd>Neorg workspace notes <cr> <bar> <cmd> Neorg journal today<cr>", { desc = "Norg" })

-- trouble
Map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Toggle" })
Map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "Workspace" })
Map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { desc = "Document" })
Map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { desc = "Loclist" })
Map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { desc = "Quickfix" })
Map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { desc = "References" })

-- Indenting
Map("v", "<", "<gv", { desc = "Indent left" })
Map("v", ">", ">gv", { desc = "Indent right" })

-- Map("n", "?", "!", { desc = "Backward search" })
Map("n", "?", "/", { desc = "Forward search", silent = false })

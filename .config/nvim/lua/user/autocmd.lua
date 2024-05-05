local vim = vim
local function augroup(name)
	return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("wrap_spell"),
	pattern = { "gitcommit", "markdown", "norg" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "InsertLeave" }, {
-- 	pattern = "*.norg",
-- 	group = augroup("auto-save"),
-- 	callback = function()
-- 		vim.cmd("silent! update")
-- 	end,
-- })

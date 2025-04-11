local bufnr = vim.api.nvim_get_current_buf()
local map = function(keys, func, desc, mode)
  mode = mode or "n"
  vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
end

map("K", function()
  vim.cmd.RustLsp({ "hover", "actions" })
end, "[H]over")

map("gra", "<cmd>FzfLua lsp_code_actions <cr>", "[C]ode [A]ction", { "n", "x" })

local lsp = vim.lsp
local command = vim.api.nvim_create_user_command

local on_attach = function(client, bufnr)
  local map = function(keys, func, desc, mode)
    mode = mode or "n"
    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
  end

  if client:supports_method("textDocument/hover") or client:supports_method("textDocument/signatureHelp") then
    map("K", function()
      lsp.buf.hover({
        silent = true,
        border = "single",
        width = math.floor(vim.o.columns / 2),
      })
    end, "LSP: Show Documentation")
  end

  if client:supports_method("textDocument/inlayHint") then
    lsp.inlay_hint.enable(true, { bufnr = bufnr })

    command("InlayHint", function()
      lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
    end, { nargs = 0 })
  end

  map("grr", "<cmd>FzfLua lsp_references      jump_to_single_result=true ignore_current_line=true<cr>", "[G]oto [R]eferences")
  map("gri", "<cmd>FzfLua lsp_implementations jump_to_single_result=true ignore_current_line=true<cr>", "[G]oto [I]mplementations")
  map("gy", "<cmd>FzfLua lsp_typedefs				 jump_to_single_result=true ignore_current_line=true<cr>", "[G]oto T[y]ype Definition")
  map("gl", "<cmd>:lua vim.diagnostic.open_float()<cr>", "[S]how [D]iagnostics")
  map("gra", "<cmd>FzfLua lsp_code_actions <cr>", "[C]ode [A]ction", { "n", "x" })

  if not client:is_stopped() then
    command("LspStop", function()
      client:stop({ force = true })
      vim.notify(client.name:upper() .. " already stopped")
    end, { nargs = 0 })
  end
end
-- Ref: https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/
-- Ref: https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#completionClientCapabilities
local capabilities = {
  textDocument = {
    semanticTokens = {
      multilineTokenSupport = true,
    },
    completion = {
      completionItem = {
        snippetSupport = true,
        commitCharactersSupport = true,
        deprecatedSupport = true,
        preselectSupport = true,
        insertReplaceSupport = true,
        labelDetailsSupport = true,
        resolveSupport = {
          properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
          },
        },
      },
    },
  },
}

vim.lsp.config("*", {
  capabilities = capabilities,
  on_attach = on_attach,
})

-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
--   callback = function(ev)
--     vim.lsp.completion.enable(true, ev.data.client_id, ev.buf)
--   end,
-- })

vim.lsp.enable("lua_ls")
vim.lsp.enable("rust-analyzer")

vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  signs = true,
})

vim.o.winborder = "rounded"

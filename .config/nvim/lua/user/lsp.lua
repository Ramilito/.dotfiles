vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
  callback = function(ev)
    vim.lsp.completion.enable(true, ev.data.client_id, ev.buf)

    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
    end
    map("grr", "<cmd>FzfLua lsp_references      jump_to_single_result=true ignore_current_line=true<cr>", "[G]oto [R]eferences")
    map("gri", "<cmd>FzfLua lsp_implementations jump_to_single_result=true ignore_current_line=true<cr>", "[G]oto [I]mplementations")
    map("gy", "<cmd>FzfLua lsp_typedefs				 jump_to_single_result=true ignore_current_line=true<cr>", "[G]oto T[y]ype Definition")
    map("gl", "<cmd>:lua vim.diagnostic.open_float()<cr>", "[S]how [D]iagnostics")
    map("gra", "<cmd>FzfLua lsp_code_actions <cr>", "[C]ode [A]ction", { "n", "x" })
  end,
})

-- vim.lsp.enable("rust-analyzer") -- Don't use when using rustaceanvim
vim.lsp.enable("lua_ls")
vim.lsp.enable("gopls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("roslyn_ls")
vim.lsp.enable("pyright")

vim.lsp.config("roslyn_ls", {
  cmd = {
    "dotnet",
    os.getenv("HOME") .. "/.roslyn-lsp/content/LanguageServer/osx-arm64/Microsoft.CodeAnalysis.LanguageServer.dll",
    "--logLevel=Information",
    "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.log.get_filename()),
    "--stdio",
  },
  settings = {
    ["csharp|projects"] = {
      dotnet_enable_file_based_programs = false,
    },
  },
  handlers = {
    ["workspace/roslyn_projectNeedsRestore"] = function(result, ctx)
      return result
    end,
  },

  --     on_attach = function()
  --         print("This will run when the server attaches!")
  --     end,
  --     settings = {
  --         ["csharp|inlay_hints"] = {
  --             csharp_enable_inlay_hints_for_implicit_object_creation = true,
  --             csharp_enable_inlay_hints_for_implicit_variable_types = true,
  --         },
  --         ["csharp|code_lens"] = {
  --             dotnet_enable_references_code_lens = true,
  --         },
  --     },
})

vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  signs = true,
})

vim.o.winborder = "rounded"

lvim.builtin.which_key.mappings = {
  -- ["q"] = { "<cmd>lua require('lvim.utils.functions').smart_quit()<CR>", "Quit" },
  [";"] = { "<cmd>Alpha<CR>", "Dashboard" },
  ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
  ["c"] = { "<cmd>BufferKill<CR>", "Close Buffer" },
  ["C"] = { "<cmd>lua require('user.utils').close_all_but_current()<CR>", "Close all but current" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  -- e = { "<CMD>NeoTreeRevealToggle<CR>", "Explorer" },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
    w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    f = { require("lvim.lsp.utils").format, "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>Mason<cr>", "Mason Info" },
    j = {
      vim.diagnostic.goto_next,
      "Next Diagnostic",
    },
    k = {
      vim.diagnostic.goto_prev,
      "Prev Diagnostic",
    },
    l = { vim.lsp.codelens.run, "CodeLens Action" },
    p = {
      name = "Peek",
      d = { "<cmd>lua require('lvim.lsp.peek').Peek('definition')<cr>", "Definition" },
      t = { "<cmd>lua require('lvim.lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
      i = { "<cmd>lua require('lvim.lsp.peek').Peek('implementation')<cr>", "Implementation" },
    },
    q = { vim.diagnostic.setloclist, "Quickfix" },
    r = { vim.lsp.buf.rename, "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
  },
  u = {
    name = "+Utils",
    p = { "<cmd>PackerSync<cr>", "PackerSync" },
    l = { name = "+LunarVim",
      c = {
        "<cmd>edit " .. get_config_dir() .. "/config.lua<cr>",
        "Edit config.lua",
      },
      f = {
        "<cmd>lua require('lvim.core.telescope.custom-finders').find_lunarvim_files()<cr>",
        "Find LunarVim files",
      },
      g = {
        "<cmd>lua require('lvim.core.telescope.custom-finders').grep_lunarvim_files()<cr>",
        "Grep LunarVim files",
      },
      k = { "<cmd>Telescope keymaps<cr>", "View LunarVim's keymappings" },
      i = {
        "<cmd>lua require('lvim.core.info').toggle_popup(vim.bo.filetype)<cr>",
        "Toggle LunarVim Info",
      },
      I = {
        "<cmd>lua require('lvim.core.telescope.custom-finders').view_lunarvim_changelog()<cr>",
        "View LunarVim's changelog",
      },
      l = {
        name = "+logs",
        d = {
          "<cmd>lua require('lvim.core.terminal').toggle_log_view(require('lvim.core.log').get_path())<cr>",
          "view default log",
        },
        D = {
          "<cmd>lua vim.fn.execute('edit ' .. require('lvim.core.log').get_path())<cr>",
          "Open the default logfile",
        },
        l = {
          "<cmd>lua require('lvim.core.terminal').toggle_log_view(vim.lsp.get_log_path())<cr>",
          "view lsp log",
        },
        L = { "<cmd>lua vim.fn.execute('edit ' .. vim.lsp.get_log_path())<cr>", "Open the LSP logfile" },
        n = {
          "<cmd>lua require('lvim.core.terminal').toggle_log_view(os.getenv('NVIM_LOG_FILE'))<cr>",
          "view neovim log",
        },
        N = { "<cmd>edit $NVIM_LOG_FILE<cr>", "Open the Neovim logfile" },
        p = {
          "<cmd>lua require('lvim.core.terminal').toggle_log_view(get_cache_dir() .. '/packer.nvim.log')<cr>",
          "view packer log",
        },
        P = { "<cmd>edit $LUNARVIM_CACHE_DIR/packer.nvim.log<cr>", "Open the Packer logfile" },
      },
      n = { "<cmd>Telescope notify<cr>", "View Notifications" },
      r = { "<cmd>LvimReload<cr>", "Reload LunarVim's configuration" },
      u = { "<cmd>LvimUpdate<cr>", "Update LunarVim" },
    },
  },
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<CMD>Telescope oldfiles<CR>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<CMD>Telescope live_grep<CR>", "Text" },
    w = { "<CMD>Telescope grep_string<CR>", "Find Word" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    p = {
      "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
      "Colorscheme with Preview",
    },
  },
  z = { "<CMD>lua require('zen-mode').toggle()<CR>", "Zen" },
}

lvim.builtin.which_key.mappings["g"] = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" }

-- Sessions
lvim.builtin.which_key.mappings["s"]["s"] = { "<CMD>Telescope session-lens search_session<CR>", "Sessions" }
lvim.builtin.which_key.mappings["s"]["i"] = { "<CMD>PickIconsInsert<CR>", "Pick icons" }

lvim.builtin.which_key.mappings["o"] = {
  name = "+Overseer",
  t = { "<CMD>OverseerToggle[!]<CR>", "Toggle" },
  r = { "<CMD>OverseerRun<CR>", "Run" }
}

-- replace
lvim.builtin.which_key.mappings["r"] = {
  name = "Replace",
  r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
  w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
}

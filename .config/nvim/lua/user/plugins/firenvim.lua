if vim.g.started_by_firenvim then
  vim.pack.add({ "https://github.com/glacambre/firenvim" })

  vim.g.firenvim_config = {
    globalSettings = {
      -- Which modifier key opens the browser's address bar
      alt = "all",

      -- Enable `<Esc>` to leave insert mode inside the browser frame
      cmdlineTimeout = 3000,
    },

    localSettings = {
      -- Disable Firenvim on Google Docs (recommended & necessary)
      ["https?://docs%.google%.com/.*"] = {
        takeover = "never",
      },

      -- Reddit: open textareas automatically in Neovim
      ["https?://www%.reddit%.com/.*"] = {
        takeover = "always",
        priority = 1,
      },

      -- GitHub: only take over the "edit file" UI, not comments
      ["https?://github%.com/.*/edit/.*"] = {
        takeover = "always",
        priority = 1,
      },
      ["https?://github%.com/.*/pull/.*"] = {
        takeover = "once",
        priority = 0,
      },

     -- ChatGPT (new domain)
      ["https?://chatgpt%.com/.*"] = {
        takeover = "always",
        priority = 1,
      },
      -- Default rule for all other sites
      [".*"] = {
        takeover = "once",
        priority = 0,
      },
    },
  }

  vim.o.guifont = "JetBrainsMono Nerd Font:h13"
  vim.o.wrap = true
  vim.o.linebreak = true
  vim.o.laststatus = 0

  local group = vim.api.nvim_create_augroup("FirenvimUiOverrides", { clear = true })

  vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter", "TextChanged" }, {
    group = group,
    pattern = "*",
    callback = function(ev)
      if vim.bo[ev.buf].buftype ~= "" then
        return
      end

      local o = vim.opt_local
      o.number = false
      o.relativenumber = false
      o.cursorline = false
      o.signcolumn = "no"
      o.foldcolumn = "0"
      o.statuscolumn = "" -- 🔑 hide custom gutter (numbers/signs/folds)
    end,
  })
end

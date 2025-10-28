vim.pack.add({ "https://github.com/obsidian-nvim/obsidian.nvim" }, {
  load = function() end,
  confirm = true,
})

require("lz.n").load({
  {
    "obsidian.nvim",
    ft = "markdown",
    after = function()
      require("obsidian").setup({
        legacy_commands = false,
        workspaces = {
          {
            name = "personal",
            path = "~/workspace/mine",
          },
          {
            name = "podme",
            path = "~/workspace/podme/notes",
          },
        },
      })
    end,
  },
})

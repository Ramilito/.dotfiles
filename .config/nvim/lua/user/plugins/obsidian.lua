return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
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
  },
}

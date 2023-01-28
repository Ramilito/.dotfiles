lvim.builtin.dap.on_config_done = function()
  local dap = require("dap")
  dap.adapters.netcoredbg = {
    type = "executable",
    command = "/home/ramilito/netcoredbg/netcoredbg",
    args = { '--interpreter=vscode'}
  }
  dap.configurations.cs = {
    {
      type = "netcoredbg",
      name = "launch - netcoredbg",
      request = "launch",
      program = function()
          return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/Web/bin/Debug/net6.0/Web.dll', 'file')
      end,
    },
  }
end

-- lvim.builtin.dap.adapters.netcoredbg = {
--   type = "executable",
--   command =

-- }
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"

--   lvim.builtin.telescope.defaults.mappings = {
--     i = {
--       ["<C-j"] = actions.move_selection_next
--     }
--   }
--   -- -- for input mode
--   -- lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   -- lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   -- lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   -- lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- -- for normal mode
--   -- lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   -- lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

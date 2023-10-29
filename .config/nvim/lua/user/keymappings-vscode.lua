local M = {}

-- local augroup = vim.api.nvim_create_augroup
local keymap = vim.api.nvim_set_keymap

-- M.my_vscode = augroup('MyVSCode', {})

-- vim.filetype.add {
--     pattern = {
--         ['.*%.ipynb.*'] = 'python',
--         -- uses lua pattern matching
--         -- rathen than naive matching
--     },
-- }

local function notify(cmd)
  return string.format("<cmd>call VSCodeNotify('%s')<CR>", cmd)
end

local function v_notify(cmd)
  return string.format("<cmd>call VSCodeNotifyVisual('%s', 1)<CR>", cmd)
end

keymap('n', 'gR', notify 'references-view.findReferences', { silent = true })  -- language references
keymap('n', 'gr', notify 'editor.action.goToReferences', { silent = true })
keymap('n', '<Leader>xw', notify 'workbench.actions.view.problems', { silent = true }) -- language diagnostics
keymap('n', '<Leader>xq', notify 'workbench.action.togglePanel', { silent = true })
keymap('n', '<F2>', notify 'editor.action.rename', { silent = true })
keymap('n', '<Leader>f', notify 'editor.action.formatDocument', { silent = true })
keymap('n', '<F4>', notify 'editor.action.refactor', { silent = true })                   -- language code actions

keymap('n', '<Leader>st', notify 'workbench.action.findInFiles', { silent = true })             -- use ripgrep to search files
keymap('n', '<Leader>e', notify 'workbench.action.toggleSidebarVisibility', { silent = true })
-- keymap('n', '<Leader>th', notify 'workbench.action.toggleAuxiliaryBar', { silent = true })      -- toggle docview (help page)
keymap('n', '<Leader>sk', notify 'workbench.action.showCommands', { silent = true })            -- find commands
-- keymap('n', '<Leader>ff', notify 'workbench.action.quickOpen', { silent = true })               -- find files
keymap('n', '<Leader>tt', notify 'workbench.action.terminal.toggleTerminal', { silent = true }) -- terminal window

keymap('v', '<Leader>f', v_notify 'editor.action.formatSelection', { silent = true })
keymap('v', '<F4>', v_notify 'editor.action.refactor', { silent = true })
keymap('v', '<Leader>sk', v_notify 'workbench.action.showCommands', { silent = true })

return M

local M = {}

M.smart_quit = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_buf_get_option(bufnr, "modified")
  if modified then
    vim.ui.input({
      prompt = "You have unsaved changes. Quit anyway? (y/n) ",
    }, function(input)
      if input == "y" then
        vim.cmd "q!"
      end
    end)
  else
    vim.cmd "q!"
  end
end

M.close_all_but_current = function()
  local current = vim.fn.bufnr "%"
  local buffers = vim.fn.getbufinfo { buflisted = 1 }
  for _, buffer in ipairs(buffers) do
    if buffer.bufnr ~= current then
      vim.api.nvim_buf_delete(buffer.bufnr, { force = true })
    end
  end
end

M.lazygit_toggle = function()
  local Terminal = require("toggleterm.terminal").Terminal
  local cmd = "lazygit"
  if vim.loop.cwd() == vim.call('expand', '~/.config') then
    print("Using lazygit in ~/.config")
    cmd = 'lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME'
  end
  local lazygit = Terminal:new({
    cmd = cmd,
    hidden = true,
    direction = "float",
    float_opts = {
      border = "none",
      width = 100000,
      height = 100000,
    },
    on_open = function(_)
      vim.cmd "startinsert!"
    end,
    on_close = close_terminal_on_zero_exit,
    count = 99,
  })
  lazygit:toggle()
end

local function close_terminal_on_zero_exit(terminal, _, exit_code)
    if exit_code == 0 then
        terminal:close()
    end
end

return M

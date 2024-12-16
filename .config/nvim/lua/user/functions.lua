local M = {}

local function close_terminal_on_zero_exit(terminal, _, exit_code)
  if exit_code == 0 then
    terminal:close()
  end
end

M.smart_quit = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_get_option_value("modified", { buf = bufnr })
  if modified then
    vim.ui.input({
      prompt = "You have unsaved changes. Quit anyway? (y/n) ",
    }, function(input)
      if input == "y" then
        vim.cmd("q!")
      end
    end)
  else
    vim.cmd("q!")
  end
end

M.close_all_but_current = function()
  local current = vim.fn.bufnr("%")
  local buffers = vim.fn.getbufinfo({ buflisted = 1 })
  for _, buffer in ipairs(buffers) do
    if buffer.bufnr ~= current then
      vim.api.nvim_buf_delete(buffer.bufnr, { force = true })
    end
  end
end

M.lazygit_toggle = function()
  local lazygit = require("snacks.lazygit")
  local cmd = {}
  local home = vim.fn.expand("$HOME")
  if vim.loop.cwd() == vim.call("expand", "~/.config") then
    cmd = { args = { "--git-dir=" .. home .. "/.dotfiles", "--work-tree=" .. home } }
  end
  lazygit.open(cmd)
end

function M.move_messages_to_buffer()
  -- Capture the current messages
  local messages = vim.fn.execute("messages")

  -- Get all the messages
  local history = {}
  for i = 1, vim.fn.histnr("cmd") do
    local msg = vim.fn.histget("cmd", i)
    if msg ~= "" then
      table.insert(history, msg)
    end
  end

  -- Combine messages and history
  messages = messages .. "\n" .. table.concat(history, "\n")

  -- Create a new buffer
  local buf = vim.api.nvim_create_buf(false, true) -- Create a new buffer with no file and no listed

  -- Split the messages by newlines to get lines for the buffer
  local lines = vim.split(messages, "\n", true)

  -- Set the lines in the buffer
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Open the buffer in a new window
  vim.api.nvim_command("split")
  vim.api.nvim_set_current_buf(buf)
end

return M

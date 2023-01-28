lvim.builtin.terminal.on_config_done = function()
  local Terminal = require("toggleterm.terminal").Terminal
  local term = Terminal:new({
    direction = 'float',
    float_opts = {
      width = function()
        return vim.o.columns
      end,
      height = function(_term)
        local height = math.ceil(math.min(vim.o.lines, math.max(20, vim.o.lines / 20)))
        _term.float_opts.row = vim.o.lines - height
        return height
      end,
      border = { "─", "─", "─", " ", "─", "─", "─", " " },
      highlights = {
        -- background = "NormalFloat",
        border = "SpecialComment"
      },
      winblend = 7
    },
    close_on_exit = true
  })
  function _ToggleTerm()
    term:toggle()
  end

  local gitui = Terminal:new({
    cmd = 'gitui',
    direction = 'float',
    float_opts = {
      width = function()
        return vim.o.columns
      end,
      border = 'solid',
    },
    close_on_exit = true
  })
  function _ToggleGitUI()
    gitui:toggle()
  end
end


-- lvim.builtin.terminal.execs[#lvim.builtin.terminal.execs+1] = {"gitui", "gg", "Git ui"}

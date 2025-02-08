if _G.StatusColumn then
  return
end

_G.StatusColumn = {
  display = {
    fold = function()
      if vim.v.wrap then
        return ""
      end

      local lnum = vim.v.lnum
      local icon = "  "

      -- Line isn't in folding range
      if vim.fn.foldlevel(lnum) <= 0 then
        return icon
      end

      -- Not the first line of folding range
      if vim.fn.foldlevel(lnum) <= vim.fn.foldlevel(lnum - 1) then
        return icon
      end

      if vim.fn.foldclosed(lnum) == -1 then
        icon = " "
      else
        icon = " "
      end

      return icon
    end,
  },

  sections = {
    line_number = {
      [[%=%{v:relnum?v:relnum:v:lnum}]],
    },
    folds = {
      [[%#FoldColumn#]],
      [[%{v:lua.StatusColumn.display.fold()}]],
    },
  },

  build = function(tbl)
    local statuscolumn = {}

    for _, value in ipairs(tbl) do
      if type(value) == "string" then
        table.insert(statuscolumn, value)
      elseif type(value) == "table" then
        table.insert(statuscolumn, StatusColumn.build(value))
      end
    end

    return table.concat(statuscolumn)
  end,

  set_window = function(value)
    vim.defer_fn(function()
      vim.api.nvim_win_set_option(vim.api.nvim_get_current_win(), "statuscolumn", value)
    end, 1)
  end,
}

return StatusColumn.build({
  StatusColumn.sections.line_number,
  StatusColumn.sections.folds,
})

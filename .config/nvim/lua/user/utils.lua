local M = {}

local last_diagnostics_result = {}

local mt = {
  __index = function(_, _) return { count = 0, level = nil } end,
}

local severity_name = vim.tbl_add_reverse_lookup({
  [1] = "error",
  [2] = "warning",
  [3] = "info",
  [4] = "hint",
  [5] = "other",
})

setmetatable(severity_name, {
  __index = function() return "other" end,
})

-- local function is_disabled(diagnostics)
--   if
--     not diagnostics
--     or not vim.tbl_contains({ "nvim_lsp", "coc" }, diagnostics)
--     -- check if the current nvim version is one that will have either vim.diagnostics or vim.lsp.diagnostics
--     or (diagnostics == "nvim_lsp")
--     or (diagnostics == "coc" and vim.g.coc_service_initialized ~= 1)
--   then
--     return true
--   end
--   return false
-- end

local function is_insert() -- insert or replace
  local mode = vim.api.nvim_get_mode().mode
  return mode == "i" or mode == "ic" or mode == "ix" or mode == "R" or mode == "Rc" or mode == "Rx"
end

local function get_err_dict(errs)
  local ds = {}
  local max = #severity_name
  for _, err in ipairs(errs) do
    if err then
      -- calculate max severity
      local sev_num = err.severity
      local sev_level = severity_name[sev_num]
      if sev_num < max then max = sev_num end
      -- increment diagnostics dict
      if ds[sev_level] then
        ds[sev_level] = ds[sev_level] + 1
      else
        ds[sev_level] = 1
      end
    end
  end
  local max_severity = severity_name[max]
  return { level = max_severity, errors = ds }
end

function M.get_diagnostics()
  -- if is_disabled(opts.diagnostics) then return setmetatable({}, mt) end
  if is_insert() then
    return setmetatable(last_diagnostics_result, mt)
  end

  local diagnostics = vim.diagnostic.get(vim.fn.bufnr('%'))

  local result = {}
  local d = get_err_dict(diagnostics)
  result = {
    count = #diagnostics,
    level = d.level,
    errors = d.errors,
  }

  last_diagnostics_result = result
  return setmetatable(result, mt)
end

function M.get_icon()
  local path = vim.fn.bufname()
  local filetype = vim.bo.filetype
  local extension = vim.fn.fnamemodify(path, ":e")

  if filetype == "" then
    return "", "Default"
  end

  local loaded, webdev_icons = pcall(require, "nvim-web-devicons")
  if vim.fn.isdirectory(path) > 0 then
    local hl = loaded and "DevIconDefault" or nil
    return "", hl
  end

  if not loaded then
    if vim.fn.exists("*WebDevIconsGetFileTypeSymbol") > 0 then
      return vim.fn.WebDevIconsGetFileTypeSymbol(path), ""
    end
    return "", ""
  end

  if type == "terminal" then return webdev_icons.get_icon(type) end

  local icon, hl
  if filetype then
    -- Don't use a default here so that we fall through to the next case if no icon is found
    icon, hl = webdev_icons.get_icon_by_filetype(filetype, { default = false })
  end
  if not icon then
    icon, hl = webdev_icons.get_icon(vim.fn.fnamemodify(path, ":t"), extension, {
      true,
    })
  end

  if not icon then return "", "" end
  return icon, hl
end

function M.close_all_but_current()
  local current = vim.fn.bufnr('%')
  local buffers = vim.fn.getbufinfo({ buflisted = 1 })
  for _, buffer in ipairs(buffers) do
    if buffer.bufnr ~= current then
      vim.api.nvim_buf_delete(buffer.bufnr, { force = true })
    end
  end

end

function M.warn(msg, name)
  vim.notify(msg, vim.log.levels.WARN, { title = name or "init.lua" })
end

function M.error(msg, name)
  vim.notify(msg, vim.log.levels.ERROR, { title = name or "init.lua" })
end

function M.info(msg, name)
  vim.notify(msg, vim.log.levels.INFO, { title = name or "init.lua" })
end

function M.get_root()
  ---@type string?
  local path = vim.api.nvim_buf_get_name(0)
  path = path ~= "" and vim.loop.fs_realpath(path) or nil
  ---@type string[]
  local roots = {}
  if path then
    for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
      local workspace = client.config.workspace_folders
      local paths = workspace and vim.tbl_map(function(ws)
        return vim.uri_to_fname(ws.uri)
      end, workspace) or client.config.root_dir and { client.config.root_dir } or {}
      for _, p in ipairs(paths) do
        local r = vim.loop.fs_realpath(p)
        if path:find(r, 1, true) then
          roots[#roots + 1] = r
        end
      end
    end
  end
  table.sort(roots, function(a, b)
    return #a > #b
  end)
  ---@type string?
  local root = roots[1]
  if not root then
    path = path and vim.fs.dirname(path) or vim.loop.cwd()
    ---@type string?
    root = vim.fs.find(M.root_patterns, { path = path, upward = true })[1]
    root = root and vim.fs.dirname(root) or vim.loop.cwd()
  end
  ---@cast root string
  return root
end

return M

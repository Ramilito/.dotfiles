local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then
  return
end

auto_session.setup({
  log_level = "error",
  pre_save_cmds = { "lua require'neo-tree'.setup()", "tabdo NeoTreeClose" },
  auto_session_suppress_dirs = { "~/", "/" },
  cwd_change_handling = {
    restore_upcoming_session = true,
    pre_cwd_changed_hook = nil, -- lua function hook. This is called after auto_session code runs for the `DirChangedPre` autocmd
    post_cwd_changed_hook = nil, -- lua function hook. This is called after auto_session code runs for the `DirChanged` autocmd
  }
})

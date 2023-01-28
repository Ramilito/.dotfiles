local status_ok, session_lens = pcall(require, "session-lens")
if not status_ok then
  return
end

session_lens.setup({})


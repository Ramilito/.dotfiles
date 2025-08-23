vim.pack.add({ "https://github.com/saghen/blink.download" })
vim.pack.add({ "https://github.com/ramilito/kubectl.nvim" })
vim.opt.runtimepath:prepend("~/workspace/mine/kubectl.nvim/")

require("kubectl").setup({
  diff = {
    bin = "kubediff",
  },
  statusline = {
    enabled = true,
  },
})
local group = vim.api.nvim_create_augroup("kubectl_mappings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "k8s_*",
  callback = function(ev)
    local k = vim.keymap
    local opts = { buffer = ev.buf }

    pcall(k.del, "n", 1, opts)
    pcall(k.del, "n", 2, opts)
    pcall(k.del, "n", 3, opts)
    pcall(k.del, "n", 5, opts)
    pcall(k.del, "n", 6, opts)
  end,
})

return {
  {
    "ramilito/kubectl.nvim",
    -- branch ="feat/use_kube_rs",
    dir = "~/workspace/mine/kubectl.nvim/",
    dev = true,
    build = "cargo build --release",
    dependencies = "saghen/blink.download",
    config = function()
      require("kubectl").setup({
        diff = {
          bin = "kubediff",
        },
        auto_refresh = {
          enabled = true,
          interval = 200, -- milliseconds
        },
        lineage = {
          enabled = true,
        },
        obj_fresh = 10,
        float_size = {
          width = 0.9,
          height = 0.8,
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
    end,
  },
}

return {
  {
    "ramilito/kubectl.nvim",
    -- tag = "v2.0.0-rc1",
    -- branch = "feat/use_kube_rs",
    dir = "~/workspace/mine/kubectl.nvim/",
    dependencies = "ramilito/blink.download",
    -- build = "cargo build --release",
    config = function()
      require("kubectl").setup({
        namespace = "All",
        diff = {
          bin = "kubediff",
        },
        auto_refresh = {
          enabled = true,
          interval = 200, -- milliseconds
        },
        lineage = {
          enabled = false,
        },
        header = true,
        hints = true,
        context = true,
        heartbeat = true,

        obj_fresh = 10,
        float_size = {
          width = 0.9,
          height = 0.8,
        },
        skew = {
          log_level = vim.log.levels.OFF,
        },
      })
      local group = vim.api.nvim_create_augroup("kubectl_mappings", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = "k8s_*",
        callback = function(ev)
          local k = vim.keymap
          local opts = { buffer = ev.buf }
          for i = 1, 6 do
            pcall(k.del, "n", tostring(i), opts)
          end
        end,
      })
    end,
  },
}

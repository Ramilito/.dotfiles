return {
  {
    "ramilito/kubectl.nvim",
    dir = "~/workspace/mine/kubectl.nvim/",
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
        hints = true,
        obj_fresh = 10,
        context = true,
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
            pcall(k.del,"n", tostring(i), opts)
          end
        end,
      })
    end,
  },
}

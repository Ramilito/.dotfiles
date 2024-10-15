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
          enabled = true,
        },
        hints = true,
        obj_fresh = 10,
        context = true,
        float_size = {
          width = 0.9,
          height = 0.8,
        },
      })
    end,
  },
}

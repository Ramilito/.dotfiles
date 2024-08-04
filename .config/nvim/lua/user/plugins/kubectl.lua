return {
  {
    "ramilito/kubectl.nvim",
    dir = "~/workspace/mine/kubectl.nvim/",
    config = function()
      require("kubectl").setup({
        namespace = "All",
        notifications = {
          enabled = true,
          verbose = false,
        },
        auto_refresh = {
          enabled = true,
          interval = 2000, -- milliseconds
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

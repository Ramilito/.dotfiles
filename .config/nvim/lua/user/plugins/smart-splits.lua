vim.pack.add({ "https://github.com/mrjones2014/smart-splits.nvim" }, {
  confirm = true,
})

require("lz.n").load({
  {
    "smart-splits.nvim",
    keys = {
      {
        "<C-S-Left>",
        mode = { "n" },
        function()
          require("smart-splits").resize_left()
        end,
        desc = "Resize left",
      },
      {
        "<C-S-Down>",
        mode = { "n" },
        function()
          require("smart-splits").resize_down()
        end,
        desc = "Resize down",
      },
      {
        "<C-S-Up>",
        mode = { "n" },
        function()
          require("smart-splits").resize_up()
        end,
        desc = "Resize up",
      },
      {
        "<C-S-Right>",
        mode = { "n" },
        function()
          require("smart-splits").resize_right()
        end,
        desc = "Resize right",
      },

      {
        "<C-Right>",
        mode = { "n" },
        function()
          require("smart-splits").move_cursor_right()
        end,
        desc = "Window right",
      },
      {
        "<C-Left>",
        mode = { "n" },
        function()
          require("smart-splits").move_cursor_left()
        end,
        desc = "Window left",
      },
      {
        "<C-Down>",
        mode = { "n" },
        function()
          require("smart-splits").move_cursor_down()
        end,
        desc = "Window down",
      },
      {
        "<C-Up>",
        mode = { "n" },
        function()
          require("smart-splits").move_cursor_up()
        end,
        desc = "Window up",
      },
    },
    after = function()
      require("smart-splits").setup({ at_edge = "stop" })
    end,
  },
})

return {
  "gelguy/wilder.nvim",
  build = ":UpdateRemotePlugins",
  config = function()
    local wilder = require("wilder")
    wilder.setup({ modes = { ":", "/", "?" } })
    wilder.set_option("pipeline", {
      wilder.branch(wilder.cmdline_pipeline()),
    })

    wilder.set_option(
      "renderer",
      wilder.popupmenu_renderer({
        highlighter = wilder.basic_highlighter(),
        left = { " " },
        right = { " ", wilder.popupmenu_scrollbar({ thumb_char = " " }) },
        highlights = { default = "WilderMenu", accent = "WilderAccent" },
      })
    )
  end,
}

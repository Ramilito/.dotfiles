return
{
  {
    'echasnovski/mini.statusline',
    event = "VeryLazy",
    version = false,
    config = function()
      require('mini.statusline').setup {
        set_vim_settings = false
      }
    end
  }
}

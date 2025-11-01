return {
  'nvim-mini/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.indentscope').setup()
    require('mini.notify').setup()
    require('mini.extra').setup()
    require('mini.starter').setup()
  end,
}

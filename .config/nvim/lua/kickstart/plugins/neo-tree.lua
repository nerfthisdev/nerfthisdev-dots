-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree<CR>', desc = 'NeoTree', silent = true },
  },
  opts = {
    source_selector = {
      winbar = false,
      statusline = false,
    },
    close_if_last_window = true,
    popup_border_style = 'NC',
    filesystem = {
      bind_to_cwd = true,
      follow_current_file = { enabled = true, leave_dirs_open = false },
      use_libuv_file_watcher = true,
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['l'] = 'open',
          ['h'] = 'close_node',
        },
      },
    },
  },
}

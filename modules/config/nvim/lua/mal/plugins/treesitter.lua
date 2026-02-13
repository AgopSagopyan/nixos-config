-- lua/user/treesitter.lua
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "python", "javascript", "typescript", "c", "java"},
  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
  playground = { enable = true },
}


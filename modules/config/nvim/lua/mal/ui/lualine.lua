-- lua/user/ui/lualine.lua
require('lualine').setup {
  options = {
    theme = 'tokyonight',
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_c = { 'filename', 'branch' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
  }
}


-- lua/user/options.lua
-- Editor behavior
vim.opt.number = true               -- show line numbers
vim.opt.relativenumber = true       -- relative line numbers
vim.opt.expandtab = true            -- use spaces instead of tabs
vim.opt.shiftwidth = 2              -- indentation width
vim.opt.tabstop = 2
vim.opt.smartindent = true

-- UI / display
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Backup / swap files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.cmd [[
  colorscheme gruvbox
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

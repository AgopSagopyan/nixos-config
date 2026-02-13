-- lua/user/keymaps.lua
local opts = { noremap = true, silent = true }

-- Leader key (space)
vim.g.mapleader = " "

-- Basic mappings
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', opts)

-- Telescope shortcuts
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', opts)

-- Move selected text up/down in visual mode
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)

vim.keymap.set("n", "<space>oo", function()
  vim.cmd("normal! gg=G")
end, { desc = "Re-indent entire file" })

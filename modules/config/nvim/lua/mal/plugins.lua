local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
  {

    "ellisonleao/gruvbox.nvim",


    {
      'goolord/alpha-nvim',
      dependencies = { 'nvim-mini/mini.icons' },
      config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
      end
    },


    {
      "romgrk/barbar.nvim",
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
      config = function ()
        require("mal.plugin.barbar")
      end
    },

    "neovim/nvim-lspconfig",

    {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      config = function ()
        require("mal.plugins.mason")
      end
    },

    {
      "nvim-telescope/telescope.nvim",
      config = function ()
        require("mal.plugins.telescope")
      end
    },

    {
      "nvim-lualine/lualine.nvim",
      config = function ()
        require("mal.plugins.lualine")
      end
    },

    {
      "rcarriga/nvim-notify",
      config = function ()
        require("mal.plugins.notify")
      end
    },

    {
      "nvim-treesitter/nvim-treesitter",
      config = function ()
        require("mal.plugins.treesitter")
      end
    },

    {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",

      config = function()
        require("mal.plugins.cmp")
      end
    },
  }})

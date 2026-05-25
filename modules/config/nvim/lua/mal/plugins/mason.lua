require("mason").setup()

require("mason-lspconfig").setup {
    ensure_installed = { "clangd", "pyright" },
}

--[[
local lspconfig = require('lspconfig')

local cmp = require'cmp'

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.lua_ls.setup({
	capabilities = capabilities,
})


lspconfig.clangd.setup({
	capabilities = capabilities,
})

lspconfig.pyright.setup({
	capabilities = capabilities,
})

]]--



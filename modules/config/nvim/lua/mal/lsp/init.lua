-- lua/user/lsp/init.lua
local servers = { "pyright", "tsserver", "lua_ls"}

for _, server in ipairs(servers) do
  local ok, _ = pcall(require, "user.lsp.servers." .. server)
  if not ok then
    -- Fallback for servers without a custom config
    vim.lsp.config(server, {})
    vim.lsp.enable(server)
  end
end

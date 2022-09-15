--local on_attach = function(client, bufnr) end

local lspconfig = require('lspconfig')

--Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'clojure_lsp', 'pyright', 'sumneko_lua', 'html'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

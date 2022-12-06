local lsp_config = require("lspconfig")
local servers = {"clangd", "clojure_lsp", "pyright", "sumneko_lua", "html"}
for _, lsp in ipairs(servers) do
  lsp_config.lsp.setup({on_attach = "on_attach", capabilities = "capabilities"})
end
return nil

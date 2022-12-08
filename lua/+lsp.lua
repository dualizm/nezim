local lsp_config = require("lspconfig")
do
  local lsp_f = require("lsp-format")
  lsp_f.setup()
  lsp_config.gopls.setup({on_attach = lsp_f.on_attach})
end
local servers = {"clangd", "lua-language-server"}
for _, lsp in ipairs(servers) do
  lsp_config.lsp.setup({on_attach = "on_attach", capabilities = "capabilities"})
end
return nil

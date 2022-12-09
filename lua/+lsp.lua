local lsp_config = require("lspconfig")
do
  local lsp_f = require("lsp-format")
  lsp_f.setup()
  lsp_config.gopls.setup({on_attach = lsp_f.on_attach})
end
local on_attach
local function _1_(client, bufnr)
  _G.assert((nil ~= bufnr), "Missing argument bufnr on fnl/config/plugins/+lsp.fnl:7")
  _G.assert((nil ~= client), "Missing argument client on fnl/config/plugins/+lsp.fnl:7")
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  local bufopts = {noremap = true, silent = true, buffer = bufnr}
  local binds
  local function _2_()
    return vim.inspect(vim.lsp.buf.list_workspace_folders())
  end
  binds = {{"n", "gD", vim.lsp.buf.declaration}, {"n", "gd", vim.lsp.buf.definition}, {"n", "K", vim.lsp.buf.hover}, {"n", "gi", vim.lsp.buf.implementation}, {"n", "<C-k>", vim.lsp.buf.signature_help}, {"n", "<space>wa", vim.lsp.buf.add_workspace_folder}, {"n", "<space>wr", vim.lsp.buf.remove_workspace_folder}, {"n", "<space>wl", _2_}, {"n", "<space>D", vim.lsp.buf.type_definition}, {"n", "<space>rn", vim.lsp.buf.rename}, {"n", "<space>ca", vim.lsp.buf.code_action}, {"n", "gr", vim.lsp.buf.references}, {"n", "<space>f", vim.lsp.buf.format({async = true})}}
  for _, bind in ipairs(binds) do
    local mod, lhs, rhs = unpack(bind)
    vim.keymap.set(mod, lhs, rhs, bufopts)
  end
  return nil
end
on_attach = _1_
local servers = {"clangd"}
local capabilities = (require("cmp_nvim_lsp")).default_capabilities()
for _, lsp in ipairs(servers) do
  lsp_config.lsp.setup({on_attach = on_attach, capabilities = capabilities})
end
return nil

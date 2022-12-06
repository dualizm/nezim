local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = (require("cmp_nvim_lsp")).update_capabilities(capabilities)
local luasnip = require("luasnip")
local lspkind = require("lspkind")
local cmp = require("cmp")
local function _1_(_241)
  return luasnip.lsp_expand(_241.body)
end
local function _2_(fallback)
  _G.assert((nil ~= fallback), "Missing argument fallback on fnl/config/plugins/+nvim-cmp.fnl:19")
  if cmp.visible() then
    return cmp.select_next_item()
  elseif luasnip.expand_or_jumpable() then
    return luasnip.expand_or_jump()
  else
    return fallback()
  end
end
local function _4_(fallback)
  _G.assert((nil ~= fallback), "Missing argument fallback on fnl/config/plugins/+nvim-cmp.fnl:27")
  if cmp.visible() then
    return cmp.select_prev_item()
  elseif luasnip.expand_or_jumpable(-1) then
    return luasnip.expand_or_jump(-1)
  else
    return fallback()
  end
end
local function _6_(entry, vim_item)
  _G.assert((nil ~= vim_item), "Missing argument vim-item on fnl/config/plugins/+nvim-cmp.fnl:39")
  _G.assert((nil ~= entry), "Missing argument entry on fnl/config/plugins/+nvim-cmp.fnl:39")
  return vim_item
end
return cmp.setup({snippet = {expand = _1_}, mapping = cmp.mapping.preset.insert({["<C-d>"] = cmp.mapping.scroll_docs(-4), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<C-Space>"] = cmp.mapping.complete(), ["<CR>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true})}), ["<Tab>"] = cmp.mapping(_2_, {"i", "s"}), ["<S-Tab>"] = cmp.mapping(_4_, {"i", "s"}), sources = {{name = "nvim_lsp"}, {name = "luasnip"}}, formatting = {format = lspkind.cmp_format({with_text = true, maxwidth = 50, before = _6_})}})

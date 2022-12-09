for _, modules in ipairs({"settings", "packages", "colorscheme", "mappings", "+sitter", "+lualine", "+nvim-tree", "+nvim-comment", "+neoscroll", "+beacon", "+illuminate", "+lsp", "+lspkind", "+nvim-cmp", "+mason", "+telescope", "+wilder", "+todo-comments", "+hop"}) do
  require(modules)
end
return nil

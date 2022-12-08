for _, modules in ipairs({"settings", "packages", "colorscheme", "mappings", "+sitter", "+lualine", "+nvim-tree", "+nvim-comment", "+neoscroll", "+beacon", "+illuminate", "+lsp", "+mason", "+nvim-cmp", "+telescope", "+wilder", "+todo-comments"}) do
  require(modules)
end
return nil

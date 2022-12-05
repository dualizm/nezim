for _, modules in ipairs({"settings", "packages", "colorscheme", "sitter-cfg", "lualine-cfg", "nvim-tree-cfg"}) do
  require(modules)
end
return nil

for _, modules in ipairs({"settings", "packages", "colorscheme", "sitter-cfg"}) do
  require(modules)
end
return nil

for _, modules in ipairs({"settings", "packages", "colorscheme", "sitter"}) do
  require(modules)
end
return nil

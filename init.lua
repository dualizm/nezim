for _, modules in ipairs({"settings", "packages", "lualine-config"}) do
  require(modules)
end
return nil

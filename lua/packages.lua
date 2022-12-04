local function _1_(use)
  _G.assert((nil ~= use), "Missing argument use on fnl/packages.fnl:2")
  use("wbthomason/packer.nvim")
  use("nvim-lualine/lualine.nvim")
  return true
end
return (require("packer")).startup(_1_)

local function _1_(use)
  _G.assert((nil ~= use), "Missing argument use on fnl/packages.fnl:2")
  use("wbthomason/packer.nvim")
  use("nvim-lualine/lualine.nvim")
  use({requires = {"kyazdani42/nvim-web-devicons"}, "kyazdani42/nvim-tree.lua"})
  use({"shaunsingh/solarized.nvim"})
  use({run = ":TSUpdate", requires = {"nvim-treesitter/nvim-treesitter-context", "andrewferrier/textobj-diagnostic.nvim"}, "nvim-treesitter/nvim-treesitter"})
  return true
end
return (require("packer")).startup(_1_)

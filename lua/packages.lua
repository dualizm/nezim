local function _1_(use)
  _G.assert((nil ~= use), "Missing argument use on fnl/config/packages.fnl:1")
  local plugins = {["wbthomason/packer.nvim"] = {}, ["nvim-lualine/lualine.nvim"] = {}, ["kyazdani42/nvim-tree.lua"] = {requires = {"kyazdani42/nvim-web-devicons"}}, ["terrortylor/nvim-comment"] = {}, ["ishan9299/nvim-solarized-lua"] = {}, ["nvim-treesitter/nvim-treesitter"] = {run = ":TSUpdate", requires = {"nvim-treesitter/nvim-treesitter-context", "andrewferrier/textobj-diagnostic.nvim", "folke/todo-comments.nvim"}}, ["karb94/neoscroll.nvim"] = {}, ["rainbowhxch/beacon.nvim"] = {}, ["p00f/nvim-ts-rainbow"] = {}, ["RRethy/vim-illuminate"] = {}, ["neovim/nvim-lspconfig"] = {}, ["williamboman/mason.nvim"] = {}, ["williamboman/mason-lspconfig.nvim"] = {}, ["hrsh7th/nvim-cmp"] = {}, ["hrsh7th/cmp-nvim-lsp"] = {}, ["saadparwaiz1/cmp_luasnip"] = {}, ["L3MON4D3/LuaSnip"] = {}, ["onsails/lspkind.nvim"] = {}, ["lukas-reineke/lsp-format.nvim"] = {}, ["nvim-telescope/telescope.nvim"] = {requires = {"nvim-lua/plenary.nvim"}}, ["gelguy/wilder.nvim"] = {}, ["phaazon/hop.nvim"] = {}, ["Olical/conjure"] = {}}
  for plug, conf in pairs(plugins) do
    table.insert(conf, plug)
    local _, c = ipairs(conf)
    use(c)
  end
  return nil
end
return (require("packer")).startup(_1_)

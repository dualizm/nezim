return require('packer').startup(function(use)

--[[ PLUGIN-MANAGER ]]--
  -- A use-package inspired plugin manager for Neovim.
  use 'wbthomason/packer.nvim'

--[[ STATUS-LINE ]]--
  -- A blazing fast and easy to configure 
  -- neovim statusline plugin written in pure lua. 
  use 'nvim-lualine/lualine.nvim'

--[[ PROJECT-MANAGER ]]--
  -- A file explorer tree for neovim written in lua 
  use { 'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    }
  }

--[[ GIT ]]--
  use 'TimUntersberger/neogit'

--[[ COMMENTER ]]--
use {
  -- Neovim treesitter plugin for setting 
  -- the commentstring based on the cursor 
  -- location in a file. 
  'JoosepAlviste/nvim-ts-context-commentstring',

  -- A comment toggler for Neovim, written in Lua  
  'terrortylor/nvim-comment',
}

--[[ ALIGN ]]--
  use 'Vonr/align.nvim'

--[[ SEARCH ]]--
  -- Hlsearch Lens for Neovim 
  use 'kevinhwang91/nvim-hlslens'

--[[ TELESCOPE ]]--
use {
  -- Find, Filter, Preview, Pick. All lua, all the time. 
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}

--[[ LISP-LIKE ]]-- 
use {
  -- Interactive evaluation for Neovim 
  -- (Clojure, Fennel, Janet, Racket, Hy, MIT Scheme, Guile) 
  'Olical/conjure',

  -- cider-jack-in for vim 
  'clojure-vim/vim-jack-in',

  -- Adds neovim support to vim-dispatch 
  'radenling/vim-dispatch-neovim'
}

--[[ SCROLL ]]--
use {
  -- Xtensible Neovim Scrollbar 
  'petertriho/nvim-scrollbar',
  -- Smooth scrolling neovim plugin written in lua 
  'karb94/neoscroll.nvim',
}

--[[ THEMES ]]--
use {
  -- A minimal colorscheme that only puts 
  -- emphasis on the paramount
  'owickstrom/vim-colors-paramount',

  -- gruvbox with Material Palette 
  'sainnhe/gruvbox-material',

  -- A dark color scheme for Vim & Neovim 
  'bluz71/vim-moonfly-colors',

  -- Plugin that creates missing LSP diagnostics 
  -- highlight groups for color schemes that don't yet support 
  -- the Neovim 0.5 builtin LSP client. 
  'folke/lsp-colors.nvim',

  'B4mbus/oxocarbon-lua.nvim',
}

--[[ NVIM-TREE-SITTER ]]--
  -- Nvim Treesitter configurations and abstraction layer
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
---[[ MODULES-NVIM-TREE-SITTER
use {
  'nvim-treesitter/nvim-treesitter-context',
  'andrewferrier/textobj-diagnostic.nvim',
}
--]]

--[[ LSP ]]--
use {
  'neovim/nvim-lspconfig',

  -- Portable package manager for Neovim that runs everywhere Neovim runs.
  -- Easily install and manage LSP servers, DAP servers, linters, and formatters. 
  'williamboman/mason.nvim',

  -- Extension to mason.nvim that makes it
  -- easier to use lspconfig with mason.nvim 
  "williamboman/mason-lspconfig.nvim",

  'hrsh7th/nvim-cmp', -- Autocompletion plugin
  'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
  'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
  'L3MON4D3/LuaSnip', -- Snippets plugin
  'onsails/lspkind.nvim', -- vscode-like pictograms for neovim lsp completion items 
}

--[[ CODE-SUPPORT ]]--
use {
  -- Uses native packages, supports Luarocks dependencies, written in Lua, allows for expressive config 
  'rainbowhxch/beacon.nvim',

  -- Indent guides for Neovim 
  'lukas-reineke/indent-blankline.nvim',

  -- Rainbow parentheses for neovim using tree-sitter
  'p00f/nvim-ts-rainbow',

  -- (Neo)Vim plugin for automatically highlighting other 
  -- uses of the word under the cursor using either LSP,
  -- Tree-sitter, or regex matching. 
  'RRethy/vim-illuminate',

  -- A pretty diagnostics, references, telescope results,
  -- quickfix and location list to help you solve all 
  -- the trouble your code is causing. 
  'folke/trouble.nvim',

  -- The neovim tabline plugin. 
  'romgrk/barbar.nvim',

  -- autopairs for neovim written by lua 
  'windwp/nvim-autopairs',
}

end)

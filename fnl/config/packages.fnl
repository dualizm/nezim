((. (require "packer") :startup)
  (λ [use]
    "List of plugins used"

    ;; plugin-manager
    ;;  A use-package inspired plugin manager for Neovim.
    (use "wbthomason/packer.nvim")

    ;; status-line
    ;;  A blazing fast and easy to configure 
    ;;  neovim statusline plugin written in pure lua. 
    (use "nvim-lualine/lualine.nvim")
    
    ;; file-manager
    ;; A file explorer tree for neovim
    ;; written in lua
    (use { 
      1 "kyazdani42/nvim-tree.lua"
      :requires 
        ;; file icons
        ["kyazdani42/nvim-web-devicons"]})

    ;; commenter
    ;; A comment toggler
    (use "terrortylor/nvim-comment")

    ;; themes
    (use "ishan9299/nvim-solarized-lua")

    ;; sitter
    ;; An incremental parsing system for programming tools
    (use { 
      1 "nvim-treesitter/nvim-treesitter" 
      :run ":TSUpdate"
      :requires 
        ;; show code context
      [ "nvim-treesitter/nvim-treesitter-context"
        ;; text object that finds diagnostics
        "andrewferrier/textobj-diagnostic.nvim"]})

    ;; scroll
    ;; smooth scrolling
    (use "karb94/neoscroll.nvim")

    ;; code-support
    (use 
      ;; flash cursor whem jumps or moves between windows
      [ "rainbowhxch/beacon.nvim"

      ;; ranbow parentheses using tree-sitter
        "p00f/nvim-ts-rainbow"

      ;; uses of the word under the cursor
      ;; using either lsp
      ;; tree-sitter, or regex matching
        "RRethy/vim-illuminate"])

    ;; lsp
    (use
      ;; configs for lsp clients
      [ "neovim/nvim-lspconfig"
      
      ;; easily install and manage lsp servers,
      ;; dap servers, linters and formatters
        "williamboman/mason.nvim"

      ;; extension to mason.nvim that makes it
      ;; easier to use lspconfig with mason
        "williamboman/mason-lspconfig.nvim"
      
      ;; autocompletion plugin
        "hrsh7th/nvim-cmp"

      ;; lsp source for nvim-cmp
        "hrsh7th/cmp-nvim-lsp"

      ;; snippets source for nvim-cmp
        "saadparwaiz1/cmp_luasnip"

      ;; snippets plugin
        "L3MON4D3/LuaSnip"

      ;; vscode-like pictograms for lsp
        "onsails/lspkind.nvim"])



    ;; lisp
      ;; Interactive evaluation for neovim
      ;; clojurem fennel janet racket Hy Scheme Guile
      (use "Olical/conjure")

    true))

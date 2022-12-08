((. (require "packer") :startup) (λ [use]
  (let [plugins {
    ;; plugin-manager
    ;;  A use-package inspired plugin manager for Neovim.
    :wbthomason/packer.nvim {}

    ;; status-line
    ;;  A blazing fast and easy to configure 
    ;;  neovim statusline plugin written in pure lua. 
    :nvim-lualine/lualine.nvim {}

    ;; file-manager
    ;; A file explorer tree for neovim
    ;; written in lua
    :kyazdani42/nvim-tree.lua {
      :requires 
        ;; file icons
        [:kyazdani42/nvim-web-devicons]}

    ;; commenter
    ;; A comment toggler
    :terrortylor/nvim-comment {}

    ;; themes
    :ishan9299/nvim-solarized-lua {}

    ;; sitter
    ;; An incremental parsing system 
    ;; for programming tools
    :nvim-treesitter/nvim-treesitter {
      :run ":TSUpdate"
        :requires 
          ;; show code context
          [ :nvim-treesitter/nvim-treesitter-context
            ;; text object that finds diagnostics
            :andrewferrier/textobj-diagnostic.nvim]}

    ;; scroll
    ;; smooth scrolling
    :karb94/neoscroll.nvim {}

    ;; code-support
    ;; flash cursor whem jumps or moves between windows
    :rainbowhxch/beacon.nvim {}

    ;; ranbow parentheses using tree-sitter
    :p00f/nvim-ts-rainbow {}

    ;; uses of the word under the cursor
    ;; using either lsp
    ;; tree-sitter, or regex matching
    :RRethy/vim-illuminate {}

    ;; lsp
    ;; configs for lsp clients
    :neovim/nvim-lspconfig {}
    
    ;; easily install and manage lsp servers,
    ;; dap servers, linters and formatters
    :williamboman/mason.nvim {}

    ;; extension to mason.nvim that makes it
    ;; easier to use lspconfig with mason
    :williamboman/mason-lspconfig.nvim {}
    
    ;; autocompletion plugin
    :hrsh7th/nvim-cmp {}

    ;; lsp source for nvim-cmp
    :hrsh7th/cmp-nvim-lsp {}

    ;; snippets source for nvim-cmp
    :saadparwaiz1/cmp_luasnip {}

    ;; snippets plugin
    :L3MON4D3/LuaSnip {}

    ;; vscode-like pictograms for lsp
    :onsails/lspkind.nvim {}

    ;; A wrapper around Neovims 
    ;; native LSP formatting. 
    :lukas-reineke/lsp-format.nvim {}

    ;; telescope
    :nvim-telescope/telescope.nvim {
        :requires [ :nvim-lua/plenary.nvim ]}

    ;; A more adventurous wildmenu 
    :gelguy/wilder.nvim {}

    ;; lisp
    ;; Interactive evaluation for neovim
    ;; clojurem fennel janet racket Hy Scheme Guile
    :Olical/conjure {}}]

    (each [plug conf (pairs plugins)]
      (table.insert conf plug)
      (let [(_ c) (ipairs conf)]
        (use c))))))


    







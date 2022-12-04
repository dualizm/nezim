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
    


    true))

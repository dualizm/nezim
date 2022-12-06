;;;        . .  .             
;;; .-..-.-|-..-| .-.-..-. .-.
;;; ' '`-' '-'`-'-' ' '`-`-' '
;;; init

(each [_ modules (ipairs 
	[ :settings
	  :packages
	  :colorscheme
    :mappings

  ;; plugins
    :+sitter
	  :+lualine
    :+nvim-tree
    :+nvim-comment
    :+neoscroll
    :+beacon
    :+illuminate
    :+lsp
    :+mason
    :+nvim-cmp
	])]
  (require modules))

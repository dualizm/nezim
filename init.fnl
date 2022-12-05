;;;        . .  .             
;;; .-..-.-|-..-| .-.-..-. .-.
;;; ' '`-' '-'`-'-' ' '`-`-' '
;;; init

(each [_ modules (ipairs 
	[ :settings
	  :packages
	  :colorscheme

  ;; plugins
    :sitter-cfg
	  :lualine-cfg
    :nvim-tree-cfg
	])]
  (require modules))

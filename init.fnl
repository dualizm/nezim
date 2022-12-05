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
	 ;; TODO
	 ;;:lualine
	])]
  (require modules))

;;;        . .  .             
;;; .-..-.-|-..-| .-.-..-. .-.
;;; ' '`-' '-'`-'-' ' '`-`-' '
;;; init

(each [_ modules (ipairs 
	[:settings
	 :packages
	 :colorscheme

   ;; plugins
   :sitter

	 ;; TODO
	 ;;:lualine
	])]
  (require modules))

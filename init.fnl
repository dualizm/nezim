;;;        . .  .             
;;; .-..-.-|-..-| .-.-..-. .-.
;;; ' '`-' '-'`-'-' ' '`-`-' '
;;; init

(each [_ modules (ipairs 
	[:settings
	 :packages

	 ;; TODO
	 ;;:lualine-config
	])]
  (require modules))

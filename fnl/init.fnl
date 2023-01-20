;;;; init
;;;; @authors ezbq <ognieff@yandex.ru>
;;;; @url https://github.com/ezbq/nezim
;;;; @project-name nezim
;;;; @date-start 09-15-22

(each [_ modules (ipairs 
	[ 
  ;; configs
    :settings
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
    :+lspkind
    :+nvim-cmp
    :+mason
    :+telescope
    :+wilder
    :+todo-comments
    :+hop
	])]
  (require modules))

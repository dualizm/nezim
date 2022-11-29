;;;; config setting

(let [v vim.opt]
  (-> v.number
  	(set true)))

;;; set neovim parameters
;;(-> (doto (vim.opt)
;;	(set : number true)))
;;(-> vim.opt
;;  (set number true))

;;(let [v vim.opt]
;;  (do ; tabs-and-space
;;    (set v:smarttab true)
;;    (set v:expandtab true)
;;    (set v:tabstop 2)
;;    (set v:softtabstop 2)
;;    (set v:shiftwidth 2)
;;    (set v:autoindent true)
;;    (set v:smartindent true))
;;  (do ; lines
;;    (set v:relativenumber true)
;;    (set v:number true)
;;    ;;(set v:foldcolumn "2")
;;    (set v:showcmd true)
;;    ;;(set v:cursorline true)
;;    (set v:textwidth 80))
;;  (do ; search
;;    (set v:incsearch true)
;;    (set v:smartcase true)
;;    (set v:hlsearch true)
;;    (set v:incsearch true))
;;  (do ; encoding
;;    (set v:fileencoding tf8)
;;    (set v:termencoding tf8)
;;    (set v:guifont "CaskaydiaCove NF:h12")))

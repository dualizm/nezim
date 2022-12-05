(local bind vim.api.nvim_set_keymap)
(local vbind vim.heymap.set)
(local opts { :noremap true :silent true })

(set vim.g.mapleader " ")
(set vim.g.localleader ",")

;; save-binds
(fn make-binds [table-binds]
  (each [mode lhs rhs (unpack table-binds)]
    (bind mode lhs rhs opts)))
  
(make-binds 
  { [:n :<f2> "<esc>:w<cr>"]
    [:i :<f2> "<esc>:w<cr>"]})
true
;;(bind :n :<f2> "<esc>:w<cr>" opts)
;;(bind :i :<f2> "<esc>:w<cr>" opts)
;;(bind :n :<f10> "<esc>:x<cr>" opts)
;;(bind :i :<f10> "<esc>:x<cr>" opts)
;;
;;(bind :n :<f12> ":nohl<cr>" opts)

;; panes-move


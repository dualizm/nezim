;;;        . .  .             
;;; .-..-.-|-..-| .-.-..-. .-.
;;; ' '`-' '-'`-'-' ' '`-`-' '
;;; settings 
 
(doto vim.opt
;; tabs and space
  (tset :smarttab       true)
  (tset :expandtab      true)
  (tset :tabstop           2)
  (tset :softtabstop       2)
  (tset :shiftwidth        2)
  (tset :autoindent     true)
  (tset :smartindent    true)
;; lines
  (tset :relativenumber true)
  (tset :number         true)
  (tset :showcmd        true)
  (tset :textwidth        80)
  ;; (tset :cursorline     true)
;; search
  (tset :incsearch      true)
  (tset :smartcase      true)
  (tset :hlsearch       true)
;; encoding
  (tset :fileencoding   utf8)
  (tset :termencoding   utf8)
  (tset :guifont 
    "CaskaydiaCove NF:h12")
;; colors
  (tset :syntax           on)
  (tset :termguicolors  true)
;; wild
  (tset :wildmode 
    "longest:list,full"))

(let [acmd vim.api.nvim_create_autocmd]
  (acmd :TextYankPost { 
    :desc "Hightlight selection on yank" 
    :pattern "*"
    :callback #(vim.highlight.on_yank {:higroup :IncSearch :timeout 500})})
  (acmd :VimEnter {
    :desc "Greets the user"
    :pattern "*"
    :command "echo 'Hello, ' . $USER . '!'"})
  (doto :filetype
    (acmd {:pattern :make   :command "set noexpandtab nocin"})
    (acmd {:pattern :html   :command "set noexpandtab nocin textwidth=160"})
    (acmd {:pattern :css    :command "set noexpandtab nocin"})
    (acmd {:pattern :python :command "set nocin"})))
true

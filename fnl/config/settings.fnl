;;;        . .  .             
;;; .-..-.-|-..-| .-.-..-. .-.
;;; ' '`-' '-'`-'-' ' '`-`-' '
;;; settings 

(let [options
       ;; tabs and space 
       {  :smarttab       true
          :expandtab      true
          :tabstop           2
          :softtabstop       2
          :shiftwidth        2
          :autoindent     true
          :smartindent    true
      ;; lines
          :relativenumber true
          :number         true
          :showcmd        true
          :textwidth        80
          ;;:cursorline     true
      ;; search
          :incsearch      true
          :smartcase      true
          :hlsearch       true
      ;; encoding
          :fileencoding   utf8
          :termencoding   utf8
          :guifont 
            "Blex Nerd Font:h12"
      ;; colors
          :syntax          on
          :termguicolors true}]
      ;; wild
          ;;:wildmode
            ;;"longest:list,full"}]
  (each [option value (pairs options)]
    (tset vim.opt option value)))

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

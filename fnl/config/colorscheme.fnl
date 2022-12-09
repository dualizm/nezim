;;;;
;;;;  ▓███▄    █  ██  ███▄ ▄███▓  █████▒
;;;;  ▓██ ▀█   █  ██ ▓██▒▀█▀ ██▒▓██   ▒ 
;;;;  ▓██  ▀█ ██ ▒██▒▓██    ▓██░▒████ ░ 
;;;;  ▓██▒  ▐▌██▒░██░▒██    ▒██ ░▓█▒  ░ 
;;;;  ▒██░   ▓██░░██░▒██▒   ░██▒░▒█░    
;;;;  ░ ▒░   ▒ ▒ ░▓  ░ ▒░   ░  ░ ▒ ░    
;;;;  ░ ░░   ░ ▒░ ▒ ░░  ░      ░ ░      
;;;;     ░   ░ ░  ▒ ░░      ░    ░ ░    
;;;;           ░  ░         ░        
;;;; colorscheme

(doto vim.g
  (tset :solarized_italics    true)
  (tset :solarized_visibility :normal)
  (tset :solarized_diffmode   :normal)
  (tset :solarized_statusline :normal))

;;(if (= vim.fn.has :gui_running 0)
;;    (set vim.g.solarized_termtrans 0)
;;    (set vim.g.solarized_termtrans 1))

(vim.cmd "colorscheme solarized-high")

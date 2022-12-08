(let [bind vim.api.nvim_set_keymap
      vbind vim.keymap.set
      opts {:noremap true :silent true}]
  (set vim.g.mapleader    " ")
  (set vim.g.localleader  ",")

  ;;; declaration of binds of the form 
  ;;; [ mode key-combination command ]
  (let [binds [
          ;; save current buffer
          [ "" :<leader>w  "<esc>:w<cr>"]
          ;; save all buffers
          [ "" :<leader>wa  "<esc>:wall<cr>"]
          ;; save current buffer and close
          [ "" :<leader>x "<esc>:x<cr>"]
          ;; save all buffer and close
          [ "" :<leader>xa "<esc>:xall<cr>"]
          ;; close buffer
          [ "" :<leader>q "<esc>:q<cr>"]
          [ "" :<leader>q! "<esc>:q!<cr>"]
          ;; close all buffer
          [ "" :<leader>qa "<esc>:qall<cr>"]
          ;; remove the search light
          [ "" :<f12> ":nohl<cr>"]
          ;; window moves
          [ :n :<leader>h "<C-w>h"]
          [ :n :<leader>j "<C-w>j"]
          [ :n :<leader>k "<C-w>k"]
          [ :n :<leader>l "<C-w>l"]
          ;; source config
          [ "" :<f11> 
            "<esc>:luafile ~/.config/nvim/init.lua<cr>"]
          ;; nvim-tree
          [ :n :<leader>t ":NvimTreeToggle<cr>"]
          ;; telescope
          [ :n :<leader>ff "<cmd>Telescope find_files<cr>"]
          [ :n :<leader>fg "<cmd>Telescope live_grep<cr>" ]
          [ :n :<leader>fb "<cmd>Telescope buffers<cr>"   ]
          [ :n :<leader>fn "<cmd>Telescope help_tags<cr>" ]]]
    ;;; initializing binds
    (each [_ t (ipairs binds)]
      (let [(mod lhs rhs) (unpack t)]
        (bind mod lhs rhs opts)))))

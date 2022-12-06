(let [bind vim.api.nvim_set_keymap
      vbind vim.keymap.set
      opts {:noremap true :silent true}]
  (set vim.g.mapleader    " ")
  (set vim.g.localleader  ",")

  (let [binds [
          ;; save binds
          [ :n :<f2>  "<esc>:w<cr>"]
          [ :i :<f2>  "<esc>:w<cr>"]
          [ :n :<f10> "<esc>:xall<cr>"]
          [ :i :<f10> "<esc>:xall<cr>"]
          ;; update binds
          [ :n :<f12> ":nohl<cr>"]
          [ :n :<leader>r ":luafile %<cr>"]
          ;; panes
          [ :n :<leader>h "<C-w>h"]
          [ :n :<leader>j "<C-w>j"]
          [ :n :<leader>k "<C-w>k"]
          [ :n :<leader>l "<C-w>l"]
          ;; nvimtree
          [ :n :<leader>t ":NvimTreeToggle<cr>"]]]
    (each [_ t (ipairs binds)]
      (let [(mod lhs rhs) (unpack t)]
        (bind mod lhs rhs opts)))))

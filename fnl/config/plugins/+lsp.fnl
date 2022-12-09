(let [lsp-config (require :lspconfig)
      lsp-f (require :lsp-format)]
      ((. lsp-f :setup))
      ((. (. lsp-config :gopls) :setup) { :on_attach (. lsp-f :on_attach)})

(local on_attach
       (λ [client bufnr]
          (vim.api.nvim_buf_set_option bufnr :omnifunc "v:lua.vim.lsp.omnifunc")
          (local bufopts { :noremap true :silent true :buffer bufnr })
          (let [binds 
                 [  [ :n :gD vim.lsp.buf.declaration]
                    [ :n :gd vim.lsp.buf.definition]
                    [ :n :K vim.lsp.buf.hover]
                    [ :n :gi vim.lsp.buf.implementation]
                    [ :n :<C-k> vim.lsp.buf.signature_help]
                    [ :n :<space>wa vim.lsp.buf.add_workspace_folder]
                    [ :n :<space>wr vim.lsp.buf.remove_workspace_folder]
                    [ :n :<space>wl #(vim.inspect (vim.lsp.buf.list_workspace_folders))]
                    [ :n :<space>D vim.lsp.buf.type_definition]
                    [ :n :<space>rn vim.lsp.buf.rename]
                    [ :n :<space>ca vim.lsp.buf.code_action]
                    [ :n :gr vim.lsp.buf.references]
                    [ :n :<space>f (vim.lsp.buf.format { :async true })]]]
            (each [_ bind (ipairs binds)]
              (let [(mod lhs rhs) (unpack bind)]
                (vim.keymap.set mod lhs rhs bufopts))))))

(local servers 
  [ :clangd 
    ;;:lua-language-server 
    ;;:clojure-lsp 
    ;;:html-lsp 
    ])

(local capabilities ((. (require :cmp_nvim_lsp) :default_capabilities)))

(each [_ lsp (ipairs servers)]
  ((. lsp-config.lsp :setup)
    { :on_attach on_attach
      :capabilities capabilities})))

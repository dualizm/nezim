(local lsp-config (require :lspconfig))
(let [lsp-f (require :lsp-format)]
  ((. lsp-f :setup))
  ((. (. lsp-config :gopls) :setup) { :on_attach (. lsp-f :on_attach)})

(local servers 
  [ :clangd 
    :lua-language-server 
    ;;:clojure_lsp 
    ;;:html-lsp 
    ])

(each [_ lsp (ipairs servers)]
  ((. lsp-config.lsp :setup)
    { :on_attach :on_attach
      :capabilities :capabilities}))

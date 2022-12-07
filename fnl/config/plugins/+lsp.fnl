(local lsp-config (require :lspconfig))

;;(local servers [ :clangd :clojure_lsp :lua-language-server :html-lsp ])
;;
;;(each [_ lsp (ipairs servers)]
;;  ((. lsp-config.lsp :setup)
;;    { :on_attach :on_attach
;;      :capabilities :capabilities}))

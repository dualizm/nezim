(local lsp-config (require :lspconfig))

(local servers [ :clangd :clojure_lsp :pyright :sumneko_lua :html ])

(each [_ lsp (ipairs servers)]
  ((. lsp-config.lsp :setup)
    { :on_attach :on_attach
      :capabilities :capabilities}))

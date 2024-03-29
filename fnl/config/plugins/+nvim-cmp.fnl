(let [luasnip (require :luasnip)
      lspkind (require :lspkind)
      cmp     (require :cmp)]
  ((. cmp :setup)
    { :snippet { :expand #(luasnip.lsp_expand $1.body)}
      :mapping 
        (cmp.mapping.preset.insert 
          { :<C-d> (cmp.mapping.scroll_docs -4)
            :<C-f> (cmp.mapping.scroll_docs 4)
            :<C-Space> (cmp.mapping.complete)
            :<CR> (cmp.mapping.confirm 
                    { :behavior cmp.ConfirmBehavior.Replace
                      :select true})
            :<Tab> (cmp.mapping 
                      (λ [fallback] 
                         (if (cmp.visible)
                             (cmp.select_next_item)
                             (luasnip.expand_or_jumpable)
                             (luasnip.expand_or_jump)
                             (fallback))) 
                      [ :i :s ])
            :<S-Tab> (cmp.mapping 
                      (λ [fallback] 
                         (if (cmp.visible)
                             (cmp.select_prev_item)
                             (luasnip.expand_or_jumpable -1)
                             (luasnip.expand_or_jump -1)
                             (fallback))) 
                      [ :i :s ])})
      :sources [ { :name :nvim_lsp } { :name :luasnip } ]
      :formatting {
        :format (lspkind.cmp_format 
                  { :mode :symbol
                    :maxwidth 50
                    :ellipsis_car "..."
                    :before (λ [entry vim-item] vim-item)})}}))
  

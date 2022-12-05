((. (require "nvim-treesitter.configs") :setup)
  {
    :ensure-installed [ "c" "cpp" "cmake" "commonlisp" "fish" "lua" "fennel"
                        "clojure" "gitattributes" "html" "json" "json5" "css"
                        "regex" "vim" "yaml" "verilog" "python" "scheme"]
    :sync-install false
    :auto-install true
    
    :highlight {
      :enable true
      :additional-vim-regex-highlighting false}
    :rainbow {
      :enable true
      :extended-mode true
      :max-file-lines nil
      :colors [ "#2e4740" ]
      :termcolors {}}
    :context-commentstring {
      :enable true
      :enable-autocmd false}})

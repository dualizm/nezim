((. (require "nvim-treesitter.configs") :setup)
  {
    :ensure_installed [ "c" "cpp" "cmake" "commonlisp" "fish" "lua" "fennel"
                        "clojure" "gitattributes" "html" "json" "json5" "css"
                        "regex" "vim" "yaml" "verilog" "python" "scheme"]
    :sync_install false
    :auto_install true
    
    :highlight {
      :enable true
      :additional_vim_regex_highlighting false}
    :rainbow {
      :enable true
      :extended_mode true
      :max_file_lines nil
      :colors [ "#2e4740" ]
      :termcolors {}}
    :context_commentstring {
      :enable true
      :enable_autocmd false}})

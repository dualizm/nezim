(let [lualine (require :lualine)]
  (local colors {
    :bg       :#202328
    :fg       :#bbc2cf
    :yellow   :#ECBE7B
    :cyan     :#008080
    :darkblue :#081633
    :green    :#98be65
    :orange   :#FF8800
    :violet   :#a9a1e1
    :magenta  :#c678dd
    :blue     :#51afef
    :red      :#ec5f67
    :carrot   :#e08421
    :azure    :#007fff })

  (fn color-mode []
    (let [mode-color { 
          :n colors.violet
          :i colors.red
          :v colors.blue
          "" colors.azure
          :V colors.azure
          :c colors.magenta
          :no colors.red
          :s colors.orange
          :S colors.orange
          "" colors.orange
          :ic colors.yellow
          :R colors.carrot
          :Rv colors.carrot
          :cv colors.red
          :ce colors.red
          :r colors.cyan
          :rm colors.cyan
          "r?" colors.cyan
          "!" colors.red
          :t colors.red }]
      { :fg (. mode-color vim.fn.mode)}))

  (local conditions {
    ;; TODO ~= 1
    :buffer-not-empty #(bxor (vim.fn.empty (vim.fn.expand "%:t")) 1)
    :hide-in-width #(> (vim.fn.winwidth 0) 80)
    :check-git-workspace 
      (λ []
        (local filepath (vim.fn.expand "%:p:h"))
        (local gitdir (vim.fn.finddir ".git" (.. filepath ";")))
        (and gitdir (> (length gitdir) 0) (< (length gitdir) (length
        filepath))))})
  
  ;; config
  (local config {
    :options {
      :component-separators ""
      :section-separators ""
      :theme {
        :normal   { :c {  :fg colors.fg
                          :bg "121212" }}
        :inactive { :c {  :fg colors.fg
                          :bg "121212" }}}}
    :sections {
        :lualine-a {}
        :lualine-b {}
        :lualine-y {}
        :lualine-z {}
        :lualine-c {}
        :lualine-x {}}
    :inactive-sections {
        :lualine-a {}
        :lualine-b {}
        :lualine-y {}
        :lualine-z {}
        :lualine-c {}
        :lualine-x {}}})

  (fn ins-left [component]
    (table.insert config.sections.lualine-c component))

  (fn ins-right [component]
    (table.insert config.sections.lualine-x component))

  (ins-left {
      1 #("▊")
      :color color-mode
      :padding { :left 0 :right 1 }})

  (ins-left {
    1 #("")
    :color color-mode
    :padding { :right 1 }})
  
  (ins-left {
    1 "filesize"
    :cond conditions.buffer-not-empty})

  (ins-left {
    1 "filename"
    :cond conditions.buffer-not-empty
    :color { :fg colors.magenta :gui :bold }})

  (ins-left [ :location ])
  (ins-left { 1 :progress :color { :fg colors.fg :gui :bold } }) 
  (ins-left {
    1 :diagnostics
    :sources { :error " " :warn " " :info "" }
    :diagnostics-color {
      :color-error  { :fg colors.red }
      :color-warn   { :fg colors.yellow }
      :color-info   { :fg colors.cyan }}})

  (ins-left [ #("%=") ])

  ;; Lsp sersver name
;;-- ins_left {
;;--   -- Lsp server name .
;;--   function()
;;--     local msg = 'No Active Lsp'
;;--     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
;;--     local clients = vim.lsp.get_active_clients()
;;--     if next(clients) == nil then
;;--       return msg
;;--     end
;;--     for _, client in ipairs(clients) do
;;--       local filetypes = client.config.filetypes
;;--       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
;;--         return client.name
;;--       end
;;--     end
;;--     return msg
;;--   end,
;;--   icon = ' LSP:',
;;--   color = { fg = '#ffffff', gui = 'bold' },
;;-- }

  (ins-right { 
    1 "o:encoding"
    :fmt string.upper
    :cond conditions.hide-in-width
    :color { :fg colors.green :gui :bold }})

  (ins-right {
    1 :fileformat
    :fmt string.upper
    :icons-enabled false
    :color { :fg colors.green :gui :bold }})

  (ins-right {
    1 "branch"
    :icon ""
    :color { :fg colors.violet :gui :bold }})

  (ins-right {
    1 "diff"
    :symbols { :added " " :modified "柳 " :removed " " }
    :diff-color {
      :added { :fg colors.green }
      :modified { :fg colors.orange }
      :removed { :fg colors.red }}
    :cond conditions.hide-in-width})

  (ins-right {
    1 #("▊")
    :color color-mode
    :padding { :left 1 }})

  (lualine.setup config))

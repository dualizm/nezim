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

  (fn color_mode []
    (let [mode_color { 
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
      { :fg (. mode_color vim.fn.mode)}))

  (local conditions {
    :buffer_not_empty #(not= (vim.fn.empty (vim.fn.expand "%:t")) 1)
    :hide_in_width #(> (vim.fn.winwidth 0) 80)
    :check_git_workspace 
      (λ []
        (local filepath (vim.fn.expand "%:p:h"))
        (local gitdir (vim.fn.finddir ".git" (.. filepath ";")))
        (and gitdir (> (length gitdir) 0) (< (length gitdir) (length
        filepath))))})
  
  ;; config
  (local config {
    :options {
      :component_separators ""
      :section_separators ""
      :theme {
        :normal   { :c {  :fg colors.fg
                          :bg "002730" }}
        :inactive { :c {  :fg colors.fg
                          :bg "002730" }}}}
    :sections {
        :lualine_a {}
        :lualine_b {}
        :lualine_y {}
        :lualine_z {}
        :lualine_c {}
        :lualine_x {}}
    :inactive_sections {
        :lualine_a {}
        :lualine_b {}
        :lualine_y {}
        :lualine_z {}
        :lualine_c {}
        :lualine_x {}}})

  (fn ins_left [component]
    (table.insert config.sections.lualine_c component))

  (fn ins_right [component]
    (table.insert config.sections.lualine_x component))

  (ins_left {
      1 #("▊")
      :color color_mode
      :padding { :left 0 :right 1 }})

  (ins_left {
    1 #("")
    :color color_mode
    :padding { :right 1 }})
  
  (ins_left {
    1 "filesize"
    :cond conditions.buffer_not_empty})

  (ins_left {
    1 "filename"
    :cond conditions.buffer_not_empty
    :color { :fg colors.magenta :gui :bold }})

  (ins_left [ :location ])
  (ins_left { 1 :progress :color { :fg colors.fg :gui :bold } }) 
  (ins_left {
    1 :diagnostics
    :sources [ "nvim_diagnostic"]
    :symbols { :error " " :warn " " :info "" }
    :diagnostics_color {
      :color_error  { :fg colors.red }
      :color_warn   { :fg colors.yellow }
      :color_info   { :fg colors.cyan }}})

  (ins_left [ #("%=") ])

  ;; Lsp sersver name
;;__ ins_left {
;;__   __ Lsp server name .
;;__   function()
;;__     local msg = 'No Active Lsp'
;;__     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
;;__     local clients = vim.lsp.get_active_clients()
;;__     if next(clients) == nil then
;;__       return msg
;;__     end
;;__     for _, client in ipairs(clients) do
;;__       local filetypes = client.config.filetypes
;;__       if filetypes and vim.fn.index(filetypes, buf_ft) ~= _1 then
;;__         return client.name
;;__       end
;;__     end
;;__     return msg
;;__   end,
;;__   icon = ' LSP:',
;;__   color = { fg = '#ffffff', gui = 'bold' },
;;__ }

  (ins_right { 
    1 "o:encoding"
    :fmt string.upper
    :cond conditions.hide_in_width
    :color { :fg colors.green :gui :bold }})

  (ins_right {
    1 :fileformat
    :fmt string.upper
    :icons_enabled false
    :color { :fg colors.green :gui :bold }})

  (ins_right {
    1 "branch"
    :icon ""
    :color { :fg colors.violet :gui :bold }})

  (ins_right {
    1 "diff"
    :symbols { :added " " :modified "柳 " :removed " " }
    :diff_color {
      :added { :fg colors.green }
      :modified { :fg colors.orange }
      :removed { :fg colors.red }}
    :cond conditions.hide_in_width})

  (ins_right {
    1 #("▊")
    :color color_mode
    :padding { :left 1 }})

  (lualine.setup config))

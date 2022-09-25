local set = vim.opt

--[[ TABS AND SPACE ]]--
---[[
  set.smarttab    = true
  set.expandtab   = true
  set.tabstop     = 2
  set.softtabstop = 2
  set.shiftwidth  = 2
  set.autoindent  = true
  set.smartindent = true
--]]

--[[ LINES ]]--
---[[
  set.relativenumber = true
  set.number         = true
  -- set.foldcolumn     = "2"
  set.showcmd        = true
  -- set.cursorline     = true
  set.textwidth      = 80
--]]

--[[ SEARCH ]]--
---[[
  set.incsearch = true
  set.smartcase = true
  set.hlsearch  = true
  set.incsearch = true
--]]

--[[ ENCODING ]]--
---[[
  set.fileencoding = utf8
  set.termencoding = utf8
  set.guifont      = "FiraCode Nerd Font Mono:h12"
--]]

--[[ COLORS ]]--
---[[
  set.syntax          = on
  set.termguicolors   = true
  --set.nocompatible  = true

  vim.api.nvim_create_autocmd('TextYankPost', {
    -- group = vim.api.nvim_create_augroup('highlight_yank'),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
      vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
    end,
  })
--]]

--[[ AUTOSTART ]]--
  -- OLD (notify won)
  -- vim.api.nvim_create_autocmd('VimEnter', {
  --   desc = 'Greets the user',
  --   pattern = '*',
  --   command =
  --     "echo 'Hello,' . $USER . '!'",
  -- })

--[[ WILD ]]--
    set.wildmode = "longest:list,full"


--[[ FILES ]]--
---[[
local ftset = vim.api.nvim_create_autocmd

  ftset('filetype', {
    pattern = 'make',
    command = 'set noexpandtab nocin'
  })

  ftset('filetype', {
    pattern = 'html',
    command = 'set noexpandtab nocin textwidth=160'
  })

  ftset('filetype', {
    pattern = 'css',
    command = 'set noexpandtab nocin'
  })

  ftset('filetype', {
    pattern = 'python',
    command = 'set nocin'
  })
--]]

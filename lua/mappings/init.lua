local bind  = vim.api.nvim_set_keymap
local vbind = vim.keymap.set
local opts  = { noremap = true, silent = true}

vim.g.mapleader = ' '
vim.g.localleader = ','

--[[ SAVE ]]--
---[[
  bind('n', '<f2>', '<esc>:wall<cr>', opts)
  bind('i', '<f2>', '<esc>:wall<cr>', opts)
  bind('n', '<f10>', '<esc>:xall<cr>', opts)
  bind('i', '<f10>', '<esc>:xall<cr>', opts)
--]]

--[[ UPDATE ]]--
---[[
  bind('n', '<leader>r', ':luafile %<cr>', opts)
  bind('n', '<f12>', ':nohl<cr>', opts)
--]]

--[[ PANES ]]--
---[[
  bind('n', '<C-l>', '<C-w>l', opts)
  bind('n', '<C-h>', '<C-w>h', opts)
  bind('n', '<C-j>', '<C-w>j', opts)
  bind('n', '<C-k>', '<C-w>k', opts)
--]]

--[[ NEOGIT ]]--
---[[
  bind('n', '<f4>', ':Neogit<cr>', opts)
--]]

--[[ TROUBLE ]]--
---[[
  bind('n', '<f3>', ':TroubleToggle<cr>', opts)
  bind('i', '<f3>', '<esc>:TroubleToggle<cr>', opts)
--]]

--[[ ALIGN ]]--
---[[
  vbind('x', 'aa', function() require'align'.align_to_char(1, true)             end, opts) -- Aligns to 1 character, looking left
  vbind('x', 'as', function() require'align'.align_to_char(2, true, true)       end, opts) -- Aligns to 2 characters, looking left and with previews
  vbind('x', 'aw', function() require'align'.align_to_string(false, true, true) end, opts) -- Aligns to a string, looking left and with previews
  vbind('x', 'ar', function() require'align'.align_to_string(true, true, true)  end, opts) -- Aligns to a Lua pattern, looking left and with previews

  vbind('x', 'at', function() require'align'.align_to_string(false, false, false) end, opts) -- Aligns to a string, looking left and with previews
--]]

--[[ TELESCOPE ]]--
---[[
  bind('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
  bind('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
  bind('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
  bind('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
--]]

--[[ NVIMTREE ]]--
  bind('n', '<leader>n', ':NvimTreeToggle<cr>', opts)

--[[ LSP ]]--
---[[
  vbind('n', '<space>e', vim.diagnostic.open_float, opts)
  vbind('n', '[d', vim.diagnostic.goto_prev, opts)
  vbind('n', ']d', vim.diagnostic.goto_next, opts)
  vbind('n', '<space>q', vim.diagnostic.setloclist, opts)

  local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vbind('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vbind('n', 'gd', vim.lsp.buf.definition, bufopts)
  vbind('n', 'K', vim.lsp.buf.hover, bufopts)
  vbind('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vbind('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vbind('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vbind('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vbind('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)

  vbind('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vbind('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vbind('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vbind('n', 'gr', vim.lsp.buf.references, bufopts)
  vbind('n', '<space>f', vim.lsp.buf.formatting, bufopts)
  end
--]]

--[[ BARBAR ]]--
---[[
-- Move to previous/next
bind('n', '<A-,>', '<cmd>BufferPrevious<cr>', opts)
bind('n', '<A-.>', '<cmd>BufferNext<cr>', opts)
-- Re-order to previous/next
bind('n', '<A-<>', '<cmd>BufferMovePrevious<cr>', opts)
bind('n', '<A->>', '<cmd>BufferMoveNext<cr>', opts)
-- Goto buffer in position...
bind('n', '<A-1>', '<cmd>BufferGoto 1<cr>', opts)
bind('n', '<A-2>', '<cmd>BufferGoto 2<cr>', opts)
bind('n', '<A-3>', '<cmd>BufferGoto 3<cr>', opts)
bind('n', '<A-4>', '<cmd>BufferGoto 4<cr>', opts)
bind('n', '<A-5>', '<cmd>BufferGoto 5<cr>', opts)
bind('n', '<A-6>', '<cmd>BufferGoto 6<cr>', opts)
bind('n', '<A-7>', '<cmd>BufferGoto 7<cr>', opts)
bind('n', '<A-8>', '<cmd>BufferGoto 8<cr>', opts)
bind('n', '<A-9>', '<cmd>BufferGoto 9<cr>', opts)
bind('n', '<A-0>', '<cmd>BufferLast<cr>', opts)
-- Pin/unpin buffer
bind('n', '<A-p>', '<cmd>BufferPin<cr>', opts)
-- Close buffer
bind('n', '<A-c>', '<cmd>BufferClose<cr>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
bind('n', '<C-p>', '<cmd>BufferPick<cr>', opts)
-- Sort automatically by...
bind('n', '<Space>bb', '<cmd>BufferOrderByBufferNumber<cr>', opts)
bind('n', '<Space>bd', '<cmd>BufferOrderByDirectory<cr>', opts)
bind('n', '<Space>bl', '<cmd>BufferOrderByLanguage<cr>', opts)
bind('n', '<Space>bw', '<cmd>BufferOrderByWindowNumber<cr>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
--]]

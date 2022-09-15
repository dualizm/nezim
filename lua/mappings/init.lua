local bind = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true}

vim.g.mapleader = ' '

--[[ SAVE ]]--
---[[
  bind('n', '<f2>', '<esc>:w<cr>', opts)
  bind('i', '<f2>', '<esc>:w<cr>', opts)
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

--[[ BUFFERS ]]--
---[[
  bind('n', '<f5>', ':bf<cr>', opts)
  bind('n', '<f6>', ':bn<cr>', opts)
--]]

--[[ NvimTree ]]--
  bind('n', '<leader>n', ':NvimTreeToggle<cr>', opts)

--[[ LSP ]]--
---[[
  local vbind = vim.keymap.set
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

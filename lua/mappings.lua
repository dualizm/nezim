local bind = vim.api.nvim_set_keymap
local vbind = vim.heymap.set
local opts = {noremap = true, silent = true}
vim.g.mapleader = " "
vim.g.localleader = ","
local function make_binds(opts0, table_binds)
  for _, t in ipairs(table_binds) do
    bind(table.unpack(t), opts0)
  end
  return nil
end
bind("n", "<f2>", "<esc>:w<cr>", opts)
bind("i", "<f2>", "<esc>:w<cr>", opts)
return true

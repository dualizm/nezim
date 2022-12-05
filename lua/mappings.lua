local bind = vim.api.nvim_set_keymap
local vbind = vim.heymap.set
local opts = {noremap = true, silent = true}
vim.g.mapleader = " "
vim.g.localleader = ","
local function make_binds(table_binds)
  for mode, lhs, rhs in unpack(table_binds) do
    bind(mode, lhs, rhs, opts)
  end
  return nil
end
make_binds({[{"n", "<f2>", "<esc>:w<cr>"}] = {"i", "<f2>", "<esc>:w<cr>"}})
return true

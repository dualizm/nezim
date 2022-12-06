local bind = vim.api.nvim_set_keymap
local vbind = vim.keymap.set
local opts = {noremap = true, silent = true}
vim.g.mapleader = " "
vim.g.localleader = ","
local binds = {{"n", "<f2>", "<esc>:w<cr>"}, {"i", "<f2>", "<esc>:w<cr>"}, {"n", "<f10>", "<esc>:xall<cr>"}, {"i", "<f10>", "<esc>:xall<cr>"}, {"n", "<f12>", ":nohl<cr>"}, {"n", "<leader>r", ":luafile %<cr>"}, {"n", "<leader>h", "<C-w>h"}, {"n", "<leader>j", "<C-w>j"}, {"n", "<leader>k", "<C-w>k"}, {"n", "<leader>l", "<C-w>l"}, {"n", "<leader>t", ":NvimTreeToggle<cr>"}}
for _, t in ipairs(binds) do
  local mod, lhs, rhs = unpack(t)
  bind(mod, lhs, rhs, opts)
end
return nil

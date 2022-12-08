local bind = vim.api.nvim_set_keymap
local vbind = vim.keymap.set
local opts = {noremap = true, silent = true}
vim.g.mapleader = " "
vim.g.localleader = ","
local binds = {{"", "<leader>w", "<esc>:w<cr>"}, {"", "<leader>wa", "<esc>:wall<cr>"}, {"", "<leader>x", "<esc>:x<cr>"}, {"", "<leader>xa", "<esc>:xall<cr>"}, {"", "<leader>q", "<esc>:q<cr>"}, {"", "<leader>q!", "<esc>:q!<cr>"}, {"", "<leader>qa", "<esc>:qall<cr>"}, {"", "<f12>", ":nohl<cr>"}, {"n", "<leader>h", "<C-w>h"}, {"n", "<leader>j", "<C-w>j"}, {"n", "<leader>k", "<C-w>k"}, {"n", "<leader>l", "<C-w>l"}, {"", "<f11>", "<esc>:luafile ~/.config/nvim/init.lua<cr>"}, {"n", "<leader>t", ":NvimTreeToggle<cr>"}, {"n", "<leader>ff", "<cmd>Telescope find_files<cr>"}, {"n", "<leader>fg", "<cmd>Telescope live_grep<cr>"}, {"n", "<leader>fb", "<cmd>Telescope buffers<cr>"}, {"n", "<leader>fn", "<cmd>Telescope help_tags<cr>"}}
for _, t in ipairs(binds) do
  local mod, lhs, rhs = unpack(t)
  bind(mod, lhs, rhs, opts)
end
return nil

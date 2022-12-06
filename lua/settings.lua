do
  local options = {smarttab = true, expandtab = true, tabstop = 2, softtabstop = 2, shiftwidth = 2, autoindent = true, smartindent = true, relativenumber = true, number = true, showcmd = true, textwidth = 80, incsearch = true, smartcase = true, hlsearch = true, fileencoding = utf8, termencoding = utf8, guifont = "Blex Nerd Font:h12", syntax = on, termguicolors = true, wildmode = "longest:list,full"}
  for option, value in pairs(options) do
    vim.opt[option] = value
  end
end
do
  local acmd = vim.api.nvim_create_autocmd
  local function _1_()
    return vim.highlight.on_yank({higroup = "IncSearch", timeout = 500})
  end
  acmd("TextYankPost", {desc = "Hightlight selection on yank", pattern = "*", callback = _1_})
  acmd("VimEnter", {desc = "Greets the user", pattern = "*", command = "echo 'Hello, ' . $USER . '!'"})
  local _2_ = "filetype"
  acmd(_2_, {pattern = "make", command = "set noexpandtab nocin"})
  acmd(_2_, {pattern = "html", command = "set noexpandtab nocin textwidth=160"})
  acmd(_2_, {pattern = "css", command = "set noexpandtab nocin"})
  acmd(_2_, {pattern = "python", command = "set nocin"})
end
return true

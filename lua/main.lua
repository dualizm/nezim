do
  local _1_ = vim.opt
  _1_["smarttab"] = true
  _1_["expandtab"] = true
  _1_["tabstop"] = 2
  _1_["softtabstop"] = 2
  _1_["shiftwidth"] = 2
  _1_["autoindent"] = true
  _1_["smartindent"] = true
  _1_["relativenumber"] = true
  _1_["number"] = true
  _1_["showcmd"] = true
  _1_["textwidth"] = 80
  _1_["incsearch"] = true
  _1_["smartcase"] = true
  _1_["hlsearch"] = true
  _1_["fileencoding"] = utf8
  _1_["termencoding"] = utf8
  _1_["guifont"] = "CaskaydiaCove NF:h12"
  _1_["syntax"] = on
  _1_["termguicolors"] = true
  _1_["wildmode"] = "longest:list,full"
end
do
  local acmd = vim.api.nvim_create_autocmd
  local function _2_()
    return vim.highlight.on_yank({higroup = "IncSearch", timeout = 500})
  end
  acmd("TextYankPost", {desc = "Hightlight selection on yank", pattern = "*", callback = _2_})
  acmd("VimEnter", {desc = "Greets the user", pattern = "*", command = "echo 'Hello, ' . $USER . '!'"})
  local _3_ = "filetype"
  acmd(_3_, {pattern = "make", command = "set noexpandtab nocin"})
  acmd(_3_, {pattern = "html", command = "set noexpandtab nocin textwidth=160"})
  acmd(_3_, {pattern = "css", command = "set noexpandtab nocin"})
  acmd(_3_, {pattern = "python", command = "set nocin"})
end
return true

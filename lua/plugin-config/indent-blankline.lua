vim.opt.list = true
vim.opt.listchars:append "eol:↴"
-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]
-- vim.opt.listchars:append "space:⋅"

require("indent_blankline").setup {
  -- char_highlight_list = {
  --     "IndentBlanklineIndent1",
  --     "IndentBlanklineIndent2",
  -- },
  -- space_char_highlight_list = {
  --     "IndentBlanklineIndent1",
  --     "IndentBlanklineIndent2",
  -- },
  show_trailing_blankline_indent = false,

  show_end_of_line = true,
  show_current_context = true,
  show_current_context_start = true,
  space_char_blankline = " ",
}

local lualine = require("lualine")
local colors = {bg = "#202328", fg = "#bbc2cf", yellow = "#ECBE7B", cyan = "#008080", darkblue = "#081633", green = "#98be65", orange = "#FF8800", violet = "#a9a1e1", magenta = "#c678dd", blue = "#51afef", red = "#ec5f67", carrot = "#e08421", azure = "#007fff"}
local function color_mode()
  local mode_color = {n = colors.violet, i = colors.red, v = colors.blue, [""] = colors.azure, V = colors.azure, c = colors.magenta, no = colors.red, s = colors.orange, S = colors.orange, [""] = colors.orange, ic = colors.yellow, R = colors.carrot, Rv = colors.carrot, cv = colors.red, ce = colors.red, r = colors.cyan, rm = colors.cyan, ["r?"] = colors.cyan, ["!"] = colors.red, t = colors.red}
  return {fg = mode_color[vim.fn.mode]}
end
local conditions
local function _1_()
  return (vim.fn.empty(vim.fn.expand("%:t")) ~= 1)
end
local function _2_()
  return (vim.fn.winwidth(0) > 80)
end
local function _3_()
  local filepath = vim.fn.expand("%:p:h")
  local gitdir = vim.fn.finddir(".git", (filepath .. ";"))
  return (gitdir and (#gitdir > 0) and (#gitdir < #filepath))
end
conditions = {["buffer-not-empty"] = _1_, ["hide-in-width"] = _2_, ["check-git-workspace"] = _3_}
local config = {options = {["component-separators"] = "", ["section-separators"] = "", theme = {normal = {c = {fg = colors.fg, bg = "121212"}}, inactive = {c = {fg = colors.fg, bg = "121212"}}}}, sections = {["lualine-a"] = {}, ["lualine-b"] = {}, ["lualine-y"] = {}, ["lualine-z"] = {}, ["lualine-c"] = {}, ["lualine-x"] = {}}, ["inactive-sections"] = {["lualine-a"] = {}, ["lualine-b"] = {}, ["lualine-y"] = {}, ["lualine-z"] = {}, ["lualine-c"] = {}, ["lualine-x"] = {}}}
local function ins_left(component)
  return table.insert(config.sections["lualine-c"], component)
end
local function ins_right(component)
  return table.insert(config.sections["lualine-x"], component)
end
local function _4_()
  return ("\226\150\138")()
end
ins_left({color = color_mode, padding = {left = 0, right = 1}, _4_})
local function _5_()
  return ("\239\140\141")()
end
ins_left({color = color_mode, padding = {right = 1}, _5_})
ins_left({cond = conditions["buffer-not-empty"], "filesize"})
ins_left({cond = conditions["buffer-not-empty"], color = {fg = colors.magenta, gui = "bold"}, "filename"})
ins_left({"location"})
ins_left({color = {fg = colors.fg, gui = "bold"}, "progress"})
ins_left({sources = {error = "\239\129\151 ", warn = "\239\129\177 ", info = "\239\129\170"}, ["diagnostics-color"] = {["color-error"] = {fg = colors.red}, ["color-warn"] = {fg = colors.yellow}, ["color-info"] = {fg = colors.cyan}}, "diagnostics"})
local function _6_()
  return ("%=")()
end
ins_left({_6_})
ins_right({fmt = string.upper, cond = conditions["hide-in-width"], color = {fg = colors.green, gui = "bold"}, "o:encoding"})
ins_right({fmt = string.upper, color = {fg = colors.green, gui = "bold"}, ["icons-enabled"] = false, "fileformat"})
ins_right({icon = "\239\145\191", color = {fg = colors.violet, gui = "bold"}, "branch"})
ins_right({symbols = {added = "\239\131\190 ", modified = "\239\167\137 ", removed = "\239\133\134 "}, ["diff-color"] = {added = {fg = colors.green}, modified = {fg = colors.orange}, removed = {fg = colors.red}}, cond = conditions["hide-in-width"], "diff"})
local function _7_()
  return ("\226\150\138")()
end
ins_right({color = color_mode, padding = {left = 1}, _7_})
return lualine.setup(config)

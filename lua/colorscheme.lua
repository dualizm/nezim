do
  local _1_ = vim.g
  _1_["solarized-italic-comments"] = true
  _1_["solarized-italic-keywords"] = false
  _1_["solarized-italic-functions"] = false
  _1_["solarized-italic-variables"] = false
  _1_["solarized-contrast"] = true
  _1_["solarized-borders"] = true
  _1_["solarized-disable-background"] = false
end
return (require("solarized")).set()

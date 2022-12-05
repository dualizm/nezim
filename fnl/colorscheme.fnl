(doto vim.g
  (tset :solarized-italic-comments    true)
  (tset :solarized-italic-keywords    false)
  (tset :solarized-italic-functions   false)
  (tset :solarized-italic-variables   false)
  (tset :solarized-contrast           true)
  (tset :solarized-borders            true)
  (tset :solarized-disable-background false))

((. (require :solarized) :set))

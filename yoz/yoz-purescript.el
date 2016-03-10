;;; yoz-purescript.el - Purescript settings

(require 'yoz-haskell)

(package-require 'purescript-mode)

(add-to-list 'auto-mode-alist (cons "\\.purs\\'" 'purescript-mode))

(add-hook 'purescript-mode-hook 'turn-on-purescript-indentation)

(provide 'yoz-purescript)

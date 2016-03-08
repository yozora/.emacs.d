;;; yoz-haskell.el - Home of the burrito?

(package-require 'haskell-mode)
(package-require 'ghc)
(package-require 'shm)

;; Hooks
(eval-after-load "haskell-mode"
  '(custom-set-variables
    '(haskell-mode-hook
      '(turn-on-haskell-indentation
        turn-on-haskell-doc))))

;; Flycheck
(package-require 'flycheck-haskell)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

(provide 'yoz-haskell)


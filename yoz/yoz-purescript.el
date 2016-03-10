;;; yoz-purescript.el - Purescript settings

(require 'yoz-haskell)

(package-require 'purescript-mode)

(add-to-list 'auto-mode-alist (cons "\\.purs\\'" 'purescript-mode))

(add-hook 'purescript-mode-hook 'turn-on-purescript-indentation)

(eval-after-load 'flycheck
  '(progn
     (flycheck-define-checker
      pulp
      "Use Pulp to flycheck PureScript code."
      :command ("pulp" "build" "--monochrome")
      :error-patterns
      ((error line-start
              (or (and "Error at " (file-name)    "line " line ", column " column ":"
                       (zero-or-more " "))
                  (and "\"" (file-name) "\" (line " line ", column " column "):"))
              (message (one-or-more (not (in "*"))))
              line-end))
      :modes purescript-mode)
     (add-to-list 'flycheck-checkers 'pulp)))
                              
(provide 'yoz-purescript)

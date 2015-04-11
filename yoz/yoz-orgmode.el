;; yoz-orgmode.el -- org mode setup

(add-hook 'org-mode-hook
          (lambda ()
            (visual-line-mode 1)
            (set-visual-wrap-column 80)))

(provide 'yoz-orgmode)

;; yoz-web.el -- Web mode config

(require 'web-mode) ;; reference - http://web-mode.org/
(package-require 'htmlize)

(add-to-list 'auto-mode-alist '("\\.as[cp]x?\\'" .web-mode))
(add-to-list 'auto-mode-alist '("\\.asp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))

(provide 'yoz-web)

;; yoz-js.el - Javascript customizations

;; js2-mode
(package-require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;(font-lock-add-keywords
; 'js2-mode `(("\\<\\(function\\) *("
;          (0 (progn (compose-region (match-beginning 1)
;                    (match-end 1) "\u0192") nil)))))

(setq-default js2-mode-indent-ignore-first-tab t)
(setq-default js2-global-externs
      '("module" "require" "__dirname" "process" "console" "define"
    "JSON" "$" "_" "Backbone" "buster" "sinon" "moment" "_gaq"
    "Zenbox" "Mousetrap" "Comoyo"))

(eval-after-load "js2-mode"
  `(define-key js2-mode-map (kbd "M-j") nil))

(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-hook 'js-mode-hook 'rainbow-delimiters-mode)

(provide 'yoz-js)

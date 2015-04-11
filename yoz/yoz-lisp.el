;;; yoz-lisp.el - Lisps

(setq yoz-lisp-modes
      '(emacs-lisp-mode clojure-mode lisp-mode))

(defun add-hooks (modes func)
  (dolist (mode modes)
    (add-hook (intern (concat (symbol-name mode) "-hook")) func)))
(defun add-lisp-hook (func)
  (add-hooks yoz-lisp-modes func))

;; Highlight sexp under cursor
;(package-require 'highlight-parentheses)
;(add-lisp-hook 'highlight-parentheses-mode)
(add-lisp-hook 'rainbow-delimiters-mode)

;;; Clojure

(package-require 'clojure-mode)
(add-to-list 'auto-mode-alist '("\\.cljs?$" . clojure-mode))

;; nRepl
; (package-require 'cider)
; (eval-after-load "clojure-mode" '(require 'cider))
; (setq nrepl-lein-command "lein")
; (setq nrepl-server-command "echo \"lein repl :headless\" | $SHELL -l")

;; cljsbuild
; (package-require 'cljsbuild-mode)

;;; Inferior lisps

;; Clojure REPL
(defun clojure-repl ()
  (interactive)
  (run-lisp "lein repl"))

;; ClojureScript REPL
(defun clojurescript-repl ()
  (interactive)
  (run-lisp "lein trampoline noderepl"))

;; Switch a Clojure nrepl to Clojurescript

(defun nrepl-start-noderepl ()
  (interactive)
  (save-excursion
    (nrepl-switch-to-repl-buffer nil)
    (insert "(require 'cljs.repl.node) (cljs.repl.node/run-node-nrepl)")
    (nrepl-send-input)))

(provide 'yoz-lisp)

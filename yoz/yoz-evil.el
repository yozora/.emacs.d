;;; yoz-evil.el - Evil mode setup

(package-require 'evil)
(evil-mode 1)
(package-require 'evil-surround)
(global-evil-surround-mode 1)

;; change mode-line color by evil state
(lexical-let ((default-colour (cons (face-background 'mode-line)
                                   (face-foreground 'mode-line))))
  (add-hook 'post-command-hook
    (lambda ()
      (let ((colour (cond ((minibufferp) default-colour)
                          ((evil-insert-state-p) '("#550055" . "#ffffff"))
                          ((evil-visual-state-p) '("#333366" . "#ffffff"))
                          ((evil-emacs-state-p)  '("#000000" . "#ffffff"))
                          ((buffer-modified-p)   '("#cc6600" . "#ffffff"))
                          ((evil-normal-state-p) '("#006633" . "#ffffff"))
                          (t default-colour))))
        (set-face-background 'mode-line (car colour))
        (set-face-foreground 'mode-line (cdr colour))))))

;; Keybinds
(require 'key-chord)
(setq key-chord-two-keys-delay 0.3)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
(key-chord-mode 1)

(global-unset-key (kbd "<f2>"))
(define-key evil-normal-state-map [f2] 'neotree-toggle)
(add-hook 'neotree-mode-hook
          (lambda () (hl-line-mode 1)
            (define-key evil-normal-state-local-map (kbd "o") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;;; esc quits
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

(provide 'yoz-evil)

;; yoz-helm -- Naviagating the filesystems

(package-require 'helm)
(global-set-key (kbd "<print>") 'helm-mini)
(package-require 'helm-projectile)

(define-key evil-normal-state-map "  " 'helm-projectile)

; Projectile integration
; (package-require 'helm-projection)
; (global-set-key (kbd "C-c <print>") 'helm-projectile)

(provide 'yoz-helm)

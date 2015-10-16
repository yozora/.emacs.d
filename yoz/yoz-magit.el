;;; magit.el -- More Git

(package-require 'magit)

(global-set-key (kbd "C-x g") 'magit-status)
(setq magit-last-seen-setup-instructions "1.4.0")

(provide 'yoz-magit)

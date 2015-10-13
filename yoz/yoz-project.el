;; yoz-project.el

(package-require 'projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(setq projectile-indexing-method 'alien)

(global-set-key (kbd "C-c C-f") 'projectile-find-file)

(provide 'yoz-project)

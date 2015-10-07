;; yoz-project.el

(package-require 'projectile)
(projectile-global-mode)

(global-set-key (kbd "C-c C-f") 'projectile-find-file)

(provide 'yoz-project)

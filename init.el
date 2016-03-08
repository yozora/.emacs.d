;; init.el - It all starts here

;; Reduce UI cluter
(dolist (mode '(tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Always use UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(load-library "iso-transl")

;; Automatically save before compiling
(setq compilation-ask-about-save nil)

;; y/n keypress instead of typing out yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; because the dinging is annoying
(setq visible-bell t)

;; Augument load path
(setq dotfiles-dir (file-name-directory
                     (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path (concat dotfiles-dir "yoz"))

(dolist
    (project (directory-files (concat dotfiles-dir "site-lisp") t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

(when (file-directory-p "c:/Program Files (x86)/Git/bin")
  (add-to-list 'exec-path "c:/Program Files (x86)/Git/bin")) 

;; Get hostname
(setq hostname (replace-regexp-in-string "\\(^[[:space:]\n]*\\|[[:space:]\n]*$\\)" "" (with-output-to-string (call-process "hostname" nil standard-output))))

(let ((proxy (getenv "http_proxy")))
  (when proxy
    (message "proxy on")
    (setq url-using-proxy t)
    (let ((trimmed (substring (substring proxy 7 nil) 0 -1)))
          (setq url-proxy-services `(("http" . ,trimmed))))))

;; Detect online status, from ESK
(require 'cl)
(defun esk-online? ()
  (if (and (functionp 'network-interface-list)
           (network-interface-list))
      (some (lambda (iface) (unless (equal "lo" (car iface))
                         (member 'up (first (last (network-interface-info
                                                   (car iface)))))))
            (network-interface-list))
    t))

;; ELPA
(setq package-user-dir (concat dotfiles-dir "elpa"))
(require 'package)
(dolist (source '(("melpa" . "http://melpa.org/packages/")
                  ("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))
(package-initialize)
(when (esk-online?)
  (unless package-archive-contents (package-refresh-contents)))

(defun package-require (pkg)
  "Install a package only if it's not already installed."
  (when (not (package-installed-p pkg))
    (package-install pkg)))

;; Store backups in their own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name (concat dotfiles-dir "bak")))))

;; Tabs lie in wait to kill us all
(setq-default indent-tabs-mode nil)

(define-key global-map (kbd "RET") 'newline-and-indent)

;; Automatically reload unchanged buffers when source file is changed
(global-auto-revert-mode t)

;; simple non-elpa packages (no config)
(require 'powershell)
(require 'rainbow-delimiters)
(require 'neotree)

;; My packages
(setq yoz-packages
      '(yoz-theme
        yoz-evil
        yoz-magit
        yoz-helm
        yoz-project
        yoz-flycheck
        yoz-orgmode
        yoz-lisp
        yoz-ml
        yoz-haskell
        yoz-purescript
        yoz-web
        yoz-js))

(dolist (file yoz-packages)
  (require file))

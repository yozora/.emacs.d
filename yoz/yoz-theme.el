;;; yoz-theme.el - Defining code fashion

;; Is this a terminal
(setq on-console (null window-system))

;; Disable default splash screen
(setq inhibit-startup-message t)

;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

;; GUI options
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))

;; Show line numbers
(global-linum-mode t)
(setq linum-format (if on-console "%4d " "%4d"))

;; Show column number in modeline
(setq column-number-mode t)

;; Disable line numbers in terminal buffers
(setq linum-disabled-modes
      '(term-mode slime-repl-mode magit-status-mode help-mode nrepl-mode
        xwidget-webkit-mode revealjs-mode shell-mode))
(defun linum-on ()
  (unless (or (minibufferp) (member major-mode linum-disabled-modes))
    (linum-mode 1)))

;; Custom theme path
(setq custom-theme-directory (concat dotfiles-dir "themes"))
(dolist
  (path (directory-files custom-theme-directory t "\\w+"))
    (when (file-directory-p path)
      (add-to-list 'custom-theme-load-path path)))

;; Colour themes
(require 'term)

;; Rainbow delimiters
(defun rainbow-delim-set-face ()
  (set-face-attribute 'rainbow-delimiters-depth-1-face   nil :foreground "RoyalBlue3")
  (set-face-attribute 'rainbow-delimiters-depth-2-face   nil :foreground "SeaGreen3")
  (set-face-attribute 'rainbow-delimiters-depth-3-face   nil :foreground "DarkOrchid3")
  (set-face-attribute 'rainbow-delimiters-depth-4-face   nil :foreground "firebrick3")
  (set-face-attribute 'rainbow-delimiters-depth-5-face   nil :foreground "RoyalBlue3")
  (set-face-attribute 'rainbow-delimiters-depth-6-face   nil :foreground "SeaGreen3")
  (set-face-attribute 'rainbow-delimiters-depth-7-face   nil :foreground "DarkOrchid3")
  (set-face-attribute 'rainbow-delimiters-depth-8-face   nil :foreground "firebrick3")
  (set-face-attribute 'rainbow-delimiters-unmatched-face nil :foreground "#AA0000"))

(eval-after-load "rainbow-delimiters" '(rainbow-delim-set-face))

;; Set default font
(defun font-existsp (font)
  (and (window-system)
       (fboundp 'x-list-fonts)
       (x-list-fonts font)))

(setq yoz-font-list
      '(
        "Ubuntu Mono-12"
        "Consolas-11"
        "Monaco-10"
        "Courier New-10.0"
        ))

(defun yoz-default-font (fonts)
  (when fonts
    (let ((font (car fonts)))
     (if (font-existsp font)
        (set-face-attribute 'default nil :font font)
        (yoz-default-font (cdr fonts))))))
(yoz-default-font yoz-font-list)

;; Create and use theme
(defun theme-dark ()
  (interactive)
  (load-theme 'monokai t))

(theme-dark)

(provide 'yoz-theme)

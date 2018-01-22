;;; This is all kind of necessary
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;;; Bootstrapping use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; Making sure theme theme is installed now
(unless (package-installed-p 'spacemacs-theme)
  (package-refresh-contents)
  (package-install 'spacemacs-theme))

;;; This is the actual config file
(org-babel-load-file (concat user-emacs-directory "config.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(default-input-method "korean-hangul")
 '(desktop-save-mode t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(make-backup-files nil)
 '(org-agenda-files (quote ("~/org/")))
 '(org-src-fontify-natively t)
 '(package-selected-packages
   (quote
    (avy which-key markdown-mode magit use-package slime auto-complete)))
 '(recentf-mode t)
 '(show-paren-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(tramp-syntax (quote default) nil (tramp)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; Begin initialization
;; Turn off mouse interface early in startup to avoid momentary display
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;;; Set up package
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;;; Bootstrap use-package
;; Install use-package if it's not already installed.
;; use-package is used to configure the rest of the packages.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(unless (package-installed-p 'powerline)
  (package-refresh-contents)
  (package-install 'powerline))

(unless (package-installed-p 'magit)
  (package-refresh-contents)
  (package-install 'magit))

(eval-when-compile
  (require 'use-package)
  (require 'powerline))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)
;(setq use-package-verbose t)

;;; Load the config
(require 'org)
(org-babel-load-file (concat user-emacs-directory "config.org"))

(set-frame-font "Ubuntu Mono-13" nil t)
(set-fontset-font t 'hangul (font-spec :name "D2Coding"))
(setq-default line-spacing 1)

(setq-default frame-title-format
              '(:eval
                (format "%s@%s: %s %s"
                        (or (file-remote-p default-directory 'user)
                            user-real-login-name)
                        (or (file-remote-p default-directory 'host)
                            system-name)
                        (buffer-name)
                        (cond
                         (buffer-file-truename
                          (concat "(" buffer-file-truename ")"))
                         (dired-directory
                          (concat "{" dired-directory "}"))
                         (t
                          "[no file]")))))

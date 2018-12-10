;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Install use-package for managing packages
(add-to-list 'load-path "~/.emacs.d/use-package")
(require 'use-package)
(setq use-package-always-ensure t)

;; Configure proxy servers to be used
(load-file "~/.emacs.d/proxy_conf.el")

;; MELPA to my package-archives
(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("elpy" . "https://jorgenschaefer.github.io/packages/"))

; Add user-defaults to load-path
(add-to-list 'load-path "~/.emacs.d/user-defaults")

; Configure Emacs according to operating system
(load "operating_system")

; Enable command completion system for Emacs
(load "commands_completion")

; Theme selection
(load "themes")

; Behavior/window configuration
(load "generic_behavior")

; Select input-interface system 
(load "input")

; Enable IDE features, static analysis / code completion
(load "syntax")

; Configure indexers - ctags/cscope/ggtags
(load "indexers")

; Configure project context 
(load "projects")

; Configure programming languages
(load "lang")

; Enable semantics in Emacs
(load "semantics")

(use-package neotree
  :bind ("M-1" . neotree-toggle)
  :init
  (setq neo-theme 'nerd))

(add-to-list 'load-path "~/.emacs.d/sr-speedbar")
(require 'sr-speedbar)
(global-set-key (kbd "M-2") 'sr-speedbar-toggle)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages
   (quote
	(neotree org-plus-contrib cmake-font-lock cmake-mode elpy projectile magit ggtags xcscope yasnippet smartparens company flycheck god-mode ergoemacs-mode ace-window visual-regexp powerline spacemacs-theme counsel smex flx which-key))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

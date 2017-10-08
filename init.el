;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Install use-package for managing packages
(add-to-list 'load-path "~/.emacs.d/use-package")
(require 'use-package)

;; Configure proxy servers to be used
(load-file "~/.emacs.d/proxy_conf.el")

;; MELPA to my package-archives
(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("elpy" . "https://jorgenschaefer.github.io/packages/"))

; Configure Emacs according to operating system
(load-file "~/.emacs.d/operating_system.el")

; Enable command completion system for Emacs
(load-file "~/.emacs.d/commands_completion.el")

; Theme selection
;(load-file "~/.emacs.d/themes.el")

; Behavior/window configuration
(load-file "~/.emacs.d/generic_behavior.el")

; Select input-interface system 
(setq ergoemacs-keyboard-layout "de")
(load-file "~/.emacs.d/input.el")

; Enable IDE features, static analysis / code completion
(load-file "~/.emacs.d/syntax.el")

; Configure indexers - ctags/cscope/ggtags
(setq path-to-ctags "c:/Users/SESA452110/MyPrograms/bin/ctags.exe")
(load-file "~/.emacs.d/indexers.el")

; Configure project context 
(load-file "~/.emacs.d/projects.el")

; Configure programming languages
(load-file "~/.emacs.d/lang.el")

(use-package neotree
  :ensure t
  :pin melpa-stable
  :bind ("M-1" . neotree-toggle)
  :init
  (setq neo-theme 'nerd))

(add-to-list 'load-path "~/.emacs.d/sr-speedbar")
(require 'sr-speedbar)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(smartparens xcscope which-key projectile persistent-soft neotree monokai-theme magit god-mode ggtags flycheck ergoemacs-status ergoemacs-mode counsel company cmake-font-lock auto-complete))))
(put 'narrow-to-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

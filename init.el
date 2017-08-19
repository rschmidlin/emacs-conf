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

; Configure Emacs to use find and grep from MSYS
(setenv "PATH"
	(concat
	 ;; Change this with your path to MSYS bin directory
	 "C:\\MinGW\\msys\\1.0\\bin;"
	 (getenv "PATH")))

;; Install cygwin-mount to work with Cygwin paths
(add-to-list 'load-path "~/.emacs.d/cygwin-mount")
(require 'cygwin-mount)
;; (add-to-list 'load-path "~/.emacs.d/setup-cygwin")
;; (require 'setup-cygwin)

; Require better-defaults
(add-to-list 'load-path "~/.emacs.d/better-defaults")
(require 'better-defaults)

; Use which-key
(use-package which-key
	     :ensure t
	     :pin melpa-stable
	     :config
	     (which-key-mode))

; Use IVY
(use-package counsel
	     :ensure t
	     :pin melpa-stable
	     :init
	     (setq ivy-use-virtual-buffers t)
	     (setq ivy-count-format "(%d/%d) ")
	     (setq magit-completing-read-function 'ivy-completing-read)
	     (setq projectile-completion-system 'ivy)
	     :config
	     (ivy-mode 1))
;(global-set-key (kbd "M-a") 'counsel-M-x)
;(global-set-key (kbd "C-o") 'counsel-find-file)
;(global-set-key (kbd "<f1> f") 'counsel-describe-function)
;(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;(global-set-key (kbd "<f1> l") 'counsel-find-library)
;(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;(global-set-key (kbd "<f2> u") 'counsel-unicode-char)

(use-package monokai-theme
	     :ensure t
	     :pin melpa-stable
	     :init
	     (add-hook 'after-init-hook '(lambda () (load-theme 'monokai t)))	     
	     ;; FIX: Invalid font in org-mode on Windows
	     ;; (when (and sys/win32p (> emacs-major-version 24))
	     ;;   (add-hook 'window-setup-hook '(lambda () (load-theme 'monokai t))))
             )

(use-package ergoemacs-status
  :ensure t
  :pin melpa
  :config
  (ergoemacs-status-mode))  

(setq ergoemacs-keyboard-layout "de")
; Initialize ErgoEmacs, requires persistent-soft and undo-tree (at directory .emacs.d)
(use-package ergoemacs-mode
	     :ensure t
 	     :pin melpa-stable
 	     :init
 	     (setq ergoemacs-theme nil)
 	     ;(setq ergoemacs-keyboard-layout "programmer-dv")
 	     (setq ergoemacs-keyboard-layout "de")
 	     :config
 	     (ergoemacs-mode 1))

(use-package god-mode
  :ensure t
  :pin melpa
  :config
  (setq god-exempt-major-modes nil)
  (setq god-exempt-predicates nil)
  (global-set-key (kbd "<escape>") 'god-mode-all)
  (god-mode))

;(use-package xah-fly-keys
; :ensure t
; :pin melpa
; :config
; (xah-fly-keys-set-layout "qwerty") ; required if you use qwerty
 ;; (xah-fly-set-layout "dvorak") ; by default, it's dvorak
; (xah-fly-keys 1))

; Specializations for Ergoemacs mode
(defun insert-commercial-at()
  "Insert a commercial at before point."
  (interactive)
  (insert "@"))

(defun insert-tilde()
  "Insert a tilde before point."
  (interactive)
  (insert "~"))

(defun insert-left-curly-brace()
  "Insert a left curly brace before point."
  (interactive)
  (insert "{"))

(defun insert-right-curly-brace()
  "Insert a right curly brace before point."
  (interactive)
  (insert "}"))

(defun insert-left-squared-bracket()
  "Insert a left square bracket before point."
  (interactive)
  (insert "["))

(defun insert-right-squared-bracket()
  "Insert a right square bracket before point."
  (interactive)
  (insert "]"))

(defun insert-backslash()
  "Insert a backslash before point."
  (interactive)
  (insert "\\"))

(defun insert-pipe()
  "Insert a pipe before point."
  (interactive)
  (insert "|"))

(when (string= ergoemacs-keyboard-layout "de")
    (global-set-key (kbd "M-4") 'split-window-horizontally)
    (global-set-key (kbd "M-$") 'split-window-vertically)
    (global-set-key (kbd "M-9") 'tags-loop-continue)
    (global-set-key (kbd "M-)") 'next-error)
    (global-set-key (kbd "M-0") 'xref-find-definitions)
    (global-set-key (kbd "M-ß") 'pop-tag-mark)
    (global-set-key (kbd "C-S-f") 'swiper)
;    (define-key compilation-mode-map (kbd "M-9") 'next-error)
    ; Workaround AltGr supression
    (global-set-key (kbd "C-M-q") 'insert-commercial-at)
    (global-set-key (kbd "C-M-+") 'insert-tilde)
    (global-set-key (kbd "C-M-7") 'insert-left-curly-brace)
    (global-set-key (kbd "C-M-8") 'insert-left-squared-bracket)
    (global-set-key (kbd "C-M-9") 'insert-right-squared-bracket)
    (global-set-key (kbd "C-M-0") 'insert-right-curly-brace)
    (global-set-key (kbd "C-M-ß") 'insert-backslash)
    (global-set-key (kbd "C-M-<") 'insert-pipe))

(when (string= ergoemacs-keyboard-layout "programmer-dv")
  (global-set-key (kbd "M-}") 'split-window-horizontally)
  (global-set-key (kbd "M-3") 'split-window-vertically)
  (global-set-key (kbd "M-+") 'tags-loop-continue)
  (global-set-key (kbd "M-4") 'next-error)
  (global-set-key (kbd "M-+") 'compilation-next-error)
  (global-set-key (kbd "M-]") 'xref-find-definitions)
  (global-set-key (kbd "M-!") 'pop-tag-mark)
  (global-set-key (kbd "C-S-u") 'swiper))

;; Configure C-style
(load-file "~/.emacs.d/cstyle.el")

; Enable CMake major mode
(use-package cmake-mode
  :ensure t
  :pin melpa-stable)

(use-package cmake-font-lock
  :ensure t
  :pin melpa
  :init
  (add-hook 'cmake-mode-hook 'cmake-font-lock-activate))

; Use cscope
(use-package xcscope
	     :ensure t
	     :pin melpa-stable
	     :init
	     ; Configure Emacs to accept Cygwin executables
	     (setq cscope-do-not-update-database t)
	     ;(setq exec-path (cons "C:/cygwin/bin" exec-path))
	     :config
	     (cscope-setup))

; Use auto-complete
;; (use-package auto-complete
;; 	     :ensure t
;; 	     :pin melpa-stable
;;              :init
;;              (setq ac-auto-show-menu    0.1)
;;              (setq ac-delay             0.5)
;; 	     :config
;; 	     (ac-config-default))

;; Auto-complete-mode-hook
;; When the `auto-complete-mode' is on, and when a word completion
;; is in process, Ctrl+s does `ac-isearch'.
;; This fixes it.
;; (auto-complete-mode-hook
;;  ((isearch-forward ac-isearch ac-completing-map)
;;   ("C-s" nil ac-completing-map)))

; Keybinding for using MaGit
(use-package magit
	     :ensure t
	     :pin melpa-stable
	     :bind ("C-x g" . magit-status))

(use-package projectile
	     :ensure t
	     :pin melpa-stable)

(use-package org
  :ensure t
  :pin org)

(setq redisplay-dont-pause t
	  scroll-margin 1
	  scroll-step 1
	  scroll-conservatively 10000
	  scroll-preserve-screen-position 1)

(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

(setq path-to-ctags "c:/Users/SESA452110/MyPrograms/bin/ctags.exe")

 ; Generate cscope.files from a directory list
(defun build-cscope-file (directories &optional target-directory)
  "Generate cscope.file for a list of DIRECTORIES, optionally in TARGET-DIRECTORY."
  (let
	  (
	   (file (if target-directory
				 (concat target-directory "/cscope.files")
			   "cscope.files"))
	   )
	(shell-command (concat "rm -rf " file))
	(dolist (dir directories)
	  (shell-command (concat "find " dir " -name *.cpp >> " file ))
	  (shell-command (concat "find " dir " -name *.hpp >> " file ))
	  (shell-command (concat "find " dir " -name *.c >> " file   ))
	  (shell-command (concat "find " dir " -name *.h >> " file   )))
	))

 ; Functions to create Ctags and Cscope files
(defun build-ctags (directory)
  (interactive "D")
  (let
      ((dos-dir (replace-regexp-in-string "/" "\\\\" (directory-file-name directory))))
    (call-process path-to-ctags nil (get-buffer-create "process-output") t "-e" "--extra=+fq" "--exclude=.git" "--exclude=build" "--exclude=GeneratedSources" "--exclude=CoSeMa" "--exclude=CppUnit" "--exclude=Import" "-R" "-f" (concat dos-dir "\\TAGS") dos-dir)
    (visit-tags-table (concat directory "/TAGS"))))

(defun build-ctags-from-list (filename &optional target-directory)
  (interactive "f")
  (if target-directory
	  (call-process path-to-ctags nil (get-buffer-create "process-output") t "-e" "--extra=+fq" "-L" filename "-f" (concat target-directory "/TAGS"))
	(call-process path-to-ctags nil (get-buffer-create "process-output") t "-e" "--extra=+fq" "-L" filename)))
	

(defun build-cscope (directory)
  (interactive "D")
  (call-process "sh" nil (get-buffer-create "process-output") t "cscope-indexer" "-r" directory)
  (cscope-set-initial-directory directory)
  (message (concat "Cscope file built successfully for " directory)))

(defun build-cscope-from-list (filename &optional target-directory)
  (interactive "f")
  (if target-directory
	  (let ((default-directory target-directory))
		(call-process "cscope" nil (get-buffer-create "process-output") t "-U" "-b" "-i" filename))
	(call-process "cscope" nil (get-buffer-create "process-output") t "-U" "-b" "-i" filename))
	(message (concat "Cscope file built successfully for " filename)))

; Allow (a) to be used in dired
(put 'dired-find-alternate-file 'disabled nil)

; Show line numbers
(global-linum-mode t)

; Avoid splash screen
(setq inhibit-splash-screen t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (cmake-font-lock cmake-mode persistent-soft projectile magit auto-complete xcscope ergoemacs-mode counsel))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

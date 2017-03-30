;; Added by Package.el.  This must come before configurations of
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
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

; Configure Emacs to use find and grep from MSYS
(setenv "PATH"
	(concat
	 ;; Change this with your path to MSYS bin directory
	 "C:\\MinGW\\msys\\1.0\\bin;"
	 (getenv "PATH")))

; Require better-defaults
(add-to-list 'load-path "~/.emacs.d/better-defaults")
(require 'better-defaults)

; Use IVY
(use-package counsel
	     :ensure t
	     :pin melpa-stable
	     :init
	     (setq ivy-use-virtual-buffers t)
	     (setq ivy-count-format "(%d/%d) ")
	     (setq magit-completing-read-function 'ivy-complete-read)
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
(use-package auto-complete
	     :ensure t
	     :pin melpa-stable
	     :config
	     (ac-config-default))

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

(setq path-to-ctags "c:/Users/SESA452110/MyPrograms/bin/ctags.exe")

 ; Functions to create Ctags and Cscope files
(defun build-ctags (directory)
  (interactive "D")
  (let
      ((dos-dir (replace-regexp-in-string "/" "\\\\" (directory-file-name directory))))
    (call-process path-to-ctags nil (get-buffer-create "process-output") t "-e" "--extra=+fq" "--exclude=GeneratedSources" "--exclude=Import" "--exclude=.git" "--exclude=public" "-R" "-f" (concat dos-dir "\\TAGS") dos-dir)
    (visit-tags-table (concat directory "/TAGS"))))

(defun build-cscope (directory)
  (interactive "D")
  (call-process "sh" nil (get-buffer-create "process-output") t "cscope-indexer" "-r" directory)
  (cscope-set-initial-directory directory)
  (message (concat "Cscope file built successfully for " directory)))

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
    (persistent-soft projectile magit auto-complete xcscope ergoemacs-mode counsel))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

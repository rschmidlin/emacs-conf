;; Select input mode - ergoemacs, xah-fly-keys, boon
(defvar input-mode "boon")

; Specializations for system-wide rebind of AltGr to Alt_L
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

; Help switching windows
(use-package ace-window
  :ensure t
  :pin melpa)

; Initialize ErgoEmacs, requires persistent-soft and undo-tree (at directory .emacs.d)
(when (string= input-mode "ergoemacs")
  (use-package ergoemacs-mode
	:ensure t
	:pin melpa
	:init
	(setq ergoemacs-theme nil)
										;(setq ergoemacs-keyboard-layout "programmer-dv")
	(setq ergoemacs-keyboard-layout "de")
	:config
	(ergoemacs-mode 1))

  (use-package god-mode
	:ensure t
	:pin melpa
	:bind ("<escape>" . god-local-mode)
	:init
	(setq god-exempt-major-modes nil)
	(setq god-exempt-predicates nil))

  (when (string= ergoemacs-keyboard-layout "de")
    (global-set-key (kbd "M-4") 'split-window-horizontally)
    (global-set-key (kbd "M-$") 'split-window-vertically)
    (global-set-key (kbd "M-9") 'tags-loop-continue)
    (global-set-key (kbd "M-)") 'next-error)
    (global-set-key (kbd "M-0") 'xref-find-definitions)
    (global-set-key (kbd "M-ß") 'xref-pop-marker-stack)
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
	(global-set-key (kbd "M-!") 'xref-pop-marker-stack)
	(global-set-key (kbd "C-S-u") 'swiper)))

;; Install use-package for managing packages
(when (string= input-mode "xah-fly-keys")
  (add-to-list 'load-path "~/.emacs.d/xah-fly-keys")
  (require 'xah-fly-keys)
  (xah-fly-keys-set-layout "qwertz")
  (define-key key-translation-map (kbd "ESC") (kbd "C-g"))
  (define-key isearch-mode-map (kbd "TAB") 'isearch-repeat-forward)
  (xah-fly-keys 1))

(when (string= input-mode "boon")
  (use-package multiple-cursors
	:ensure t
	:pin melpa)
  
  (use-package expand-region
	:ensure t
	:pin melpa)

  (add-to-list 'load-path "~/.emacs.d/boon")
  (require 'boon-qwertz) ;; for qwerty port
  (require 'boon-powerline)
  (boon-powerline-theme) ;; if you want use powerline with Boon
  (boon-mode)

										; Use M-SPC to go back to command mode
  (global-set-key (kbd "M-SPC") 'boon-set-command-state)

										; Special help keys like pressing escape for C-g, TAB for searching further
  ;; (define-key key-translation-map (kbd "ESC") (kbd "C-g"))
  (define-key isearch-mode-map (kbd "TAB") 'isearch-repeat-forward)

										; Also define commands for C-x that are available from x in Boon
  (global-set-key (kbd "C-x o") 'ace-window)
  (global-set-key  (kbd "M-x") 'counsel-M-x)
  (define-key boon-command-map (kbd "x x") 'counsel-M-x)
  (global-set-key (kbd "C-x x") 'counsel-M-x)

										; Define new commands for command mode
  (define-key boon-command-map (kbd ",") 'ace-window)
  (define-key boon-command-map (kbd "r") 'swiper)
  (define-key boon-command-map (kbd "m") 'split-window-below)
  (define-key boon-command-map (kbd "M") 'split-window-right)
  (define-key boon-command-map (kbd ".") 'delete-other-windows)
  (define-key boon-command-map (kbd ":") 'delete-window)
  (define-key boon-command-map (kbd "T") 'query-replace)
  (define-key boon-goto-map (kbd "i") 'imenu)

										; New keys on C-x group avoiding necessity of pressing control
  (global-set-key (kbd "C-x t") 'query-replace-regexp)
  (global-set-key (kbd "C-x ö") 'save-buffer)
  (global-set-key (kbd "C-x j") 'find-file)
  (global-set-key (kbd "C-x p") 'recenter-top-bottom)
  (global-set-key (kbd "C-x c") 'eval-last-sexp)
  (global-set-key (kbd "C-x y") 'comment-dwim)
  (global-set-key (kbd "C-x w") 'find-alternate-file)

										; New keys on C-c group avoiding the necessity of pressing control
  (defvar boon-help-map)
  (define-prefix-command 'boon-help-map)
  (set-keymap-parent boon-help-map help-map)
  (define-key boon-command-map (kbd "J") boon-help-map)

										; Include extended indexer navigation for Boon
  (global-set-key (kbd "C-c f") 'ggtags-find-file)
  (global-set-key (kbd "C-c i") 'cscope-find-functions-calling-this-function)
  (global-set-key (kbd "C-c o") 'cscope-find-called-functions)
  (global-set-key (kbd "C-c p") 'cscope-find-this-symbol))


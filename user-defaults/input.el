;; Select input mode - ergoemacs, xah-fly-keys, boon
(defvar input-mode "ergoemacs")
(defvar input-keyboard-layout "de")

                                        ; Specializations for system-wide rebind of AltGr to Alt_L
(when (string= input-keyboard-layout "de")
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

  (global-set-key (kbd "C-M-q") 'insert-commercial-at)
  (global-set-key (kbd "C-M-+") 'insert-tilde)
  (global-set-key (kbd "C-M-7") 'insert-left-curly-brace)
  (global-set-key (kbd "C-M-8") 'insert-left-squared-bracket)
  (global-set-key (kbd "C-M-9") 'insert-right-squared-bracket)
  (global-set-key (kbd "C-M-0") 'insert-right-curly-brace)
  (global-set-key (kbd "C-M-ß") 'insert-backslash)
  (global-set-key (kbd "C-M-<") 'insert-pipe))

                                       ; Help switching windows
(use-package ace-window)

; Initialize ErgoEmacs, requires persistent-soft and undo-tree (at directory .emacs.d)
(when (string= input-mode "ergoemacs")
  (use-package ergoemacs-mode
	:init
	(setq ergoemacs-theme nil)
	(setq ergoemacs-keyboard-layout "de")
	:config
	(ergoemacs-mode 1))

  (use-package god-mode
	:bind ("<escape>" . god-local-mode)
	:init
	(setq god-exempt-major-modes nil)
	(setq god-exempt-predicates nil))

  (when (string= input-keyboard-layout "de")
    (global-set-key (kbd "M-4") 'split-window-horizontally)
    (global-set-key (kbd "M-$") 'split-window-vertically)
    (global-set-key (kbd "M-9") 'tags-loop-continue)
    (global-set-key (kbd "M-)") 'next-error)
    (global-set-key (kbd "M-0") 'xref-find-definitions)
    (global-set-key (kbd "M-ß") 'xref-pop-marker-stack)
    (global-set-key (kbd "C-S-f") 'swiper)
    ;    (define-key compilation-mode-map (kbd "M-9") 'next-error)

  (when (string= input-keyboard-layout "programmer-dv")
	(global-set-key (kbd "M-}") 'split-window-horizontally)
	(global-set-key (kbd "M-3") 'split-window-vertically)
	(global-set-key (kbd "M-+") 'tags-loop-continue)
	(global-set-key (kbd "M-4") 'next-error)
	(global-set-key (kbd "M-+") 'compilation-next-error)
	(global-set-key (kbd "M-]") 'xref-find-definitions)
	(global-set-key (kbd "M-!") 'xref-pop-marker-stack)
	(global-set-key (kbd "C-S-u") 'swiper))))

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
  
  (use-package powerline
    :ensure t
    :pin melpa)

  (use-package boon
    :ensure t
    :pin melpa
    :init 
    (require 'boon-qwertz) ;; for qwerty port
    (require 'boon-powerline)
    (require 'boon-keybinding)
    :config
    (boon-powerline-theme) ;; if you want use powerline with Boon
    (boon-mode)
    (boon-keybinding-minor-mode))

  ;; Define special modes where boon should be used instead
  (defvar boon-non-special-list
    '(dired-mode
      bookmark-bmenu-mode))
  (defvar boon-new-special-list
    '())

  (defun use-special-mode-p (old-function &rest arguments)
    "Function to substitute boon-special-mode-p and disallow use of special mode for some major-modes"
    (or (memq major-mode boon-new-special-list)
        (and (apply old-function arguments)
             (not (memq major-mode boon-non-special-list)))))

  (advice-add #'boon-special-mode-p :around #'use-special-mode-p))



; Initialize ErgoEmacs, requires persistent-soft and undo-tree (at directory .emacs.d)
;; (use-package ergoemacs-mode
;; 	     :ensure t
;;  	     :pin melpa
;;  	     :init
;;  	     (setq ergoemacs-theme nil)
;;  	     ;(setq ergoemacs-keyboard-layout "programmer-dv")
;;  	     (setq ergoemacs-keyboard-layout "de")
;;  	     :config
;;  	     (ergoemacs-mode 1))

;; (use-package god-mode
;;   :ensure t
;;   :pin melpa
;;   :bind ("<escape>" . god-local-mode)
;;   :init
;;   (setq god-exempt-major-modes nil)
;;   (setq god-exempt-predicates nil))

(use-package xah-fly-keys
  :ensure t
  :pin melpa
  :config
  (xah-fly-keys-set-layout "qwerty") ; required if you use qwerty
										; (xah-fly-set-layout "dvorak") ; by default, it's dvorak
  (define-key key-translation-map (kbd "ESC") (kbd "C-g"))
  (define-key isearch-mode-map (kbd "TAB") 'isearch-repeat-forward)
  (xah-fly-keys 1))

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
  (global-set-key (kbd "C-S-u") 'swiper))


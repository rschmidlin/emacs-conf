;; Configure C-style
;; (use-package rtags
;;   :ensure t
;;   :pin melpa
;;   :init
;;   (use-package ivy-rtags
;; 	:ensure t
;; 	:pin melpa)
;;   (setq rtags-display-result-backend 'ivy))

;; (use-package irony
;;   :ensure t
;;   :pin melpa)

;; (use-package cmake-ide
;;   :ensure t
;;   :pin melpa
;;   :config
;;   (cmake-ide-setup))

(load "cstyle")

(add-hook 'prog-mode-hook
          (lambda ()
			(xah-fly--define-keys
			 ;; kinda replacement related
			 (define-prefix-command 'xah-fly-comma-keymap)
			 '(
			   ("'" . with-editor-finish)
			   ("," . org-capture)
			   ("c" . cscope-find-functions-calling-this-function)
			   ("e" . projectile-find-dir)
			   ("f" . xah-fly-cancel-edit)
			   ("g" . senator-go-to-up-reference)
			   ("j" . org-ctrl-c-ctrl-c)
			   ("k" . org-ctrl-c-minus)
			   ("l" . cscope-find-this-symbol)
			   ("m" . org-refile)
			   ("n" . xref-pop-marker-stack)
			   ("p" . gdb)
			   ("q" . pdflatex)
			   ("r" . cscope-find-called-functions)
			   ("s" . xref-find-references)
			   ("t" . xref-find-definitions)
			   ("u" . ggtags-find-file)
			   ("x" . compile)
			   ("y" . pdb)
			   ("i" . magit-status)))))

(use-package elpy
  :ensure t
  :pin elpy
  :config
  (elpy-enable)
  (add-hook 'python-mode-hook
			(lambda ()
			  (xah-fly--define-keys
			   ;; kinda (region-end)placement related
			   (define-prefix-command 'xah-fly-comma-keymap)
			   '(
				 ("'" . with-editor-finish)
				 ("," . org-capture)
				 ("c" . cscope-find-functions-calling-this-function)
				 ("e" . projectile-find-dir)
				 ("f" . xah-fly-cancel-edit)
				 ("g" . senator-go-to-up-reference)
				 ("j" . org-ctrl-c-ctrl-c)
				 ("k" . org-ctrl-c-minus)
				 ("l" . cscope-find-this-symbol)
				 ("m" . org-refile)
				 ("n" . xref-pop-marker-stack)
				 ("p" . gdb)
				 ("q" . pdflatex)
				 ("r" . cscope-find-called-functions)
				 ("s" . elpy-goto-definition)
				 ("t" . xref-find-definitions)
				 ("u" . ggtags-find-file)
				 ("x" . compile)
				 ("y" . pdb)
				 ("i" . magit-status))))))

; Enable CMake major mode
(use-package cmake-mode
  :ensure t
  :pin melpa)

(use-package cmake-font-lock
  :ensure t
  :pin melpa
  :init
  (add-hook 'cmake-mode-hook 'cmake-font-lock-activate))

(use-package org-plus-contrib
  :ensure t
  :pin org
  :init
  (setq org-default-notes-file "~/.emacs.d/notes.org")
  (setq org-agenda-files org-default-notes-file)
  (setq org-agenda-files (cons "~/.emacs.d/xah-fly-keys.org" org-agenda-files))
  (setq org-refile-targets org-agenda-files))

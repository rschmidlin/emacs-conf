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
			(define-key xah-fly-command-map (kbd "SPC w k") 'xref-find-definitions)))

(use-package elpy
  :ensure t
  :pin elpy
  :config
  (elpy-enable)
  (add-hook 'python-mode-hook
			(lambda ()
			  (define-key xah-fly-command-map (kbd "SPC w k") 'elpy-goto-definition))))

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


;; (use-package monokai-theme
;; 	     :ensure t
;; 	     :pin melpa
;; 	     :init
;; 	     (add-hook 'after-init-hook '(lambda () (load-theme 'monokai t)))	     
;; 	     ;; FIX: Invalid font in org-mode on Windows
;; 	     ;; (when (and sys/win32p (> emacs-major-version 24))
;; 	     ;;   (add-hook 'window-setup-hook '(lambda () (load-theme 'monokai t))))
;;              )

;; (use-package ergoemacs-status
;;   :ensure t
;;   :pin melpa
;;   :config
;;   (ergoemacs-status-mode))

(use-package spacemacs-theme
  :ensure t
  :pin melpa
  :config
  (load-theme 'spacemacs-dark))

(use-package hl-line
  :ensure t
  :pin melpa
  :config
  (global-hl-line-mode t))

(use-package powerline
  :ensure t
  :pin melpa
  :config
  (powerline-default-theme))

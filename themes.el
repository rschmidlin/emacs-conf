
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


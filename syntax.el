; Enable static code analysis

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))

; Enable text completion
(use-package company
  :ensure t
  :pin melpa
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package smartparens
  :ensure t
  :pin melpa
  :config
  (smartparens-global-mode))

(use-package yasnippet
  :ensure t
  :pin melpa
  :init
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  :config
  (yas-reload-all))


; Enable static code analysis 
(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))

; Enable text completion
(use-package company
  :ensure t
  :pin melpa-stable
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


; Enable static code analysis

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(use-package flycheck
  :config (global-flycheck-mode))

; Enable text completion
(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package smartparens
  :config
  (smartparens-global-mode))

(use-package yasnippet
  :init
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  :config
  (yas-reload-all))


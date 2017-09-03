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


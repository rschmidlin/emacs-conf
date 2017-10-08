;; Configure C-style
(load-file "~/.emacs.d/cstyle.el")

(use-package elpy
  :ensure t
  :pin elpy
  :config
  (elpy-enable))

; Enable CMake major mode
(use-package cmake-mode
  :ensure t
  :pin melpa-stable)

(use-package cmake-font-lock
  :ensure t
  :pin melpa
  :init
  (add-hook 'cmake-mode-hook 'cmake-font-lock-activate))

(use-package org-plus-contrib
  :ensure t
  :pin org
  :init
  (setq org-default-notes-file "~/.emacs.d/notes.org"))

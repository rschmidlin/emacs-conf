;; Configure C-style
(load-file "~/.emacs.d/cstyle.el")

; Enable CMake major mode
(use-package cmake-mode
  :ensure t
  :pin melpa-stable)

(use-package cmake-font-lock
  :ensure t
  :pin melpa
  :init
  (add-hook 'cmake-mode-hook 'cmake-font-lock-activate))

(use-package org
  :ensure t
  :pin org)

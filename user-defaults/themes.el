
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

(use-package tabbar-ruler
  :ensure t
  :pin melpa
  :init
  (setq tabbar-ruler-global-tabbar t))

; Configure mouse to be more smooth
;; (setq redisplay-dont-pause t
;; 	  scroll-margin 1
;; 	  scroll-step 1
;; 	  scroll-conservatively 10000
;; 	  scroll-preserve-screen-position 1)

;; (setq mouse-wheel-follow-mouse 't)
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; (use-package sublimity
;;   :ensure t
;;   :pin melpa-stable
;;   :init
;;   (require 'sublimity)
;;   (require 'sublimity-scroll)
;; ;; (require 'sublimity-map) ;; experimental
;; ;; (require 'sublimity-attractive)
;;   :config
;;   (sublimity-mode 1))


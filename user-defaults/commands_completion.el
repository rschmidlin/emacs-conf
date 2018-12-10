; Use which-key
(use-package which-key
  :config
  (which-key-mode))

; Helping IVY with Flx
(use-package flx)

; Include smex to sort recent commands first in counsel
(use-package smex)

; Use IVY
(use-package counsel
	     :init
		 (require 'smex)
	     (setq ivy-use-virtual-buffers t)
	     (setq ivy-count-format "(%d/%d) ")
	     (setq magit-completing-read-function 'ivy-completing-read)
	     (setq projectile-completion-system 'ivy)
		 (setq ivy-re-builders-alist
			   '((ivy-switch-buffer . ivy--regex-plus)
				 (swiper . ivy--regex-plus)
				 (t . ivy--regex-fuzzy)))
		 (setq ivy-initial-inputs-alist nil)
	     :config
	     (ivy-mode 1))
;(global-set-key (kbd "M-a") 'counsel-M-x)
;(global-set-key (kbd "C-o") 'counsel-find-file)
;(global-set-key (kbd "<f1> f") 'counsel-describe-function)
;(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;(global-set-key (kbd "<f1> l") 'counsel-find-library)
;(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;(global-set-key (kbd "<f2> u") 'counsel-unicode-char)


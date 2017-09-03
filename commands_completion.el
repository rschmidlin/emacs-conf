; Use which-key
(use-package which-key
	     :ensure t
	     :pin melpa-stable
	     :config
	     (which-key-mode))

; Use IVY
(use-package counsel
	     :ensure t
	     :pin melpa-stable
	     :init
	     (setq ivy-use-virtual-buffers t)
	     (setq ivy-count-format "(%d/%d) ")
	     (setq magit-completing-read-function 'ivy-completing-read)
	     (setq projectile-completion-system 'ivy)
	     :config
	     (ivy-mode 1))
;(global-set-key (kbd "M-a") 'counsel-M-x)
;(global-set-key (kbd "C-o") 'counsel-find-file)
;(global-set-key (kbd "<f1> f") 'counsel-describe-function)
;(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;(global-set-key (kbd "<f1> l") 'counsel-find-library)
;(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;(global-set-key (kbd "<f2> u") 'counsel-unicode-char)


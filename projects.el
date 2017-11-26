
; Keybinding for using MaGit
(use-package magit
	     :ensure t
	     :pin melpa
	     :bind ("C-x g" . magit-status))

; Projectile to access project files
(use-package projectile
	     :ensure t
	     :pin melpa)


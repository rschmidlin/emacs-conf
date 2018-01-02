
; Require better-defaults
(add-to-list 'load-path "~/.emacs.d/better-defaults")
(require 'better-defaults)

; Configure mouse to be more smooth
(setq redisplay-dont-pause t
	  scroll-margin 1
	  scroll-step 1
	  scroll-conservatively 10000
	  scroll-preserve-screen-position 1)

(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

; Allow (a) to be used in dired
(put 'dired-find-alternate-file 'disabled nil)

; Show line numbers
(global-linum-mode t)

; Avoid splash screen
(setq inhibit-splash-screen t)

; Make subwords with camel-case as single words
(global-subword-mode t)





; Require better-defaults
(add-to-list 'load-path "~/.emacs.d/better-defaults")
(require 'better-defaults)

; Allow (a) to be used in dired
(put 'dired-find-alternate-file 'disabled nil)

; Show line numbers
(global-linum-mode t)

; Avoid splash screen
(setq inhibit-splash-screen t)

; Make subwords with camel-case as single words
(global-subword-mode t)




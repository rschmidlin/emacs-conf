(setq c-default-style "k&r"
	  c-basic-offset 4
      default-tab-width 4
      ident-tabs-mode t)

(add-hook 'c++-mode-hook
          (lambda ()
            (flyspell-prog-mode)))

;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'c-mode-hook 'irony-mode)
;; (add-hook 'objc-mode-hook 'irony-mode)

;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t)

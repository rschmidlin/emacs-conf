(setq c-default-style "k&r"
	  c-basic-offset 4
      default-tab-width 4
      ident-tabs-mode t)

(add-hook 'c++-mode-hook
          (lambda ()
            (flyspell-prog-mode)))


(defvar boon-keybinding-minor-mode-map  (make-sparse-keymap))

                                        ; Use M-SPC to go back to command mode
(define-key boon-keybinding-minor-mode-map (kbd "M-SPC") 'boon-set-command-state)

                                        ; Special help keys like pressing escape for C-g, TAB for searching further
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))
(define-key isearch-mode-map (kbd "TAB") 'isearch-repeat-forward)

                                        ; Also define commands for C-x that are available from x in Boon
(global-set-key (kbd "C-x o") 'ace-window)
(define-key boon-keybinding-minor-mode-map  (kbd "M-x") 'counsel-M-x)
(define-key boon-command-map (kbd "x x") 'counsel-M-x)
(global-set-key (kbd "C-x x") 'counsel-M-x)

                                        ; Define new commands for command mode
(define-key boon-command-map (kbd ",") 'ace-window)
(define-key boon-command-map (kbd "r") 'swiper)
(define-key boon-command-map (kbd "m") 'split-window-below)
(define-key boon-command-map (kbd "M") 'split-window-right)
(define-key boon-command-map (kbd ".") 'delete-other-windows)
(define-key boon-command-map (kbd ":") 'delete-window)
(define-key boon-command-map (kbd "T") 'query-replace)
(define-key boon-goto-map (kbd "i") 'counsel-imenu)

                                        ; New keys on C-x or C-c groups avoiding necessity of pressing control
(global-set-key (kbd "C-x t") 'query-replace-regexp)
(global-set-key (kbd "C-x ö") 'save-buffer)
(global-set-key (kbd "C-x j") 'find-file)
(global-set-key (kbd "C-x p") 'recenter-top-bottom)
(global-set-key (kbd "C-x c") 'eval-last-sexp)
(global-set-key (kbd "C-x y") 'comment-dwim)
(global-set-key (kbd "C-x w") 'find-alternate-file)
(define-key boon-keybinding-minor-mode-map (kbd "C-c C-r") 'counsel-ag)

                                        ; Buffer and window control
(defun xah-new-empty-buffer ()
  "Create a new empty buffer.
     New buffer will be named “untitled” or “untitled<2>”,
     “untitled<3>”, etc.

     URL `http://ergoemacs.org/emacs/emacs_new_empty_buffer.html'
     Version 2016-12-27"
  (interactive)
  (let (($buf (generate-new-buffer "untitled")))
    (switch-to-buffer $buf)
    (funcall initial-major-mode)
    (setq buffer-offer-save t)))

(define-key boon-keybinding-minor-mode-map (kbd "C-c C-l") 'make-frame)
(define-key boon-keybinding-minor-mode-map (kbd "C-c C-k") 'delete-frame)
(global-set-key (kbd "C-x l") 'xah-new-empty-buffer)

                                        ; Help menu on J
(defvar boon-help-map)
(define-prefix-command 'boon-help-map)
(set-keymap-parent boon-help-map help-map)
(define-key boon-command-map (kbd "J") boon-help-map)

                                        ; Include extended indexer navigation for Boon
(define-key boon-keybinding-minor-mode-map (kbd "C-c C-z") 'xref-peek-definitions)
(define-key boon-keybinding-minor-mode-map (kbd "C-c C-f") 'ggtags-find-file)
(define-key boon-keybinding-minor-mode-map (kbd "C-c C-i") 'cscope-find-functions-calling-this-function)
(define-key boon-keybinding-minor-mode-map (kbd "C-c C-o") 'cscope-find-called-functions)
(define-key boon-keybinding-minor-mode-map (kbd "C-c C-p") 'cscope-find-this-symbol)

                                        ; Start org-mode
(define-key boon-keybinding-minor-mode-map (kbd "C-c C-w") 'org-capture)

                                        ; Load current file
(defun load-current-file ()
  "Execute file corresponding to current buffer"
  (interactive)
  (load-file (buffer-file-name)))

(define-key boon-keybinding-minor-mode-map (kbd "C-c C-c") 'load-current-file)


(define-minor-mode boon-keybinding-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter boon-keybinding " boon-keybinding")

(provide 'boon-keybinding)

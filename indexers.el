; Use cscope
(use-package xcscope
	     :ensure t
	     :pin melpa
	     :init
	     ; Configure Emacs to accept Cygwin executables
	     (setq cscope-do-not-update-database t)
	     ;(setq exec-path (cons "C:/cygwin/bin" exec-path))
	     :config
	     (cscope-setup))

; Install ggtags for GNU Global (ctags/cscope substitution)
(use-package ggtags
  :ensure t
  :pin melpa
  :init
  (add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1)))))

; Generate cscope.files from a directory list
(defun build-cscope-file (directories &optional target-directory)
  "Generate cscope.file for a list of DIRECTORIES, optionally in TARGET-DIRECTORY."
  (let
	  (
	   (file (if target-directory
				 (concat target-directory "/cscope.files")
			   "cscope.files"))
	   )
	(shell-command (concat "rm -rf " file))
	(dolist (dir directories)
	  (shell-command (concat "find " dir " -name *.cpp >> " file ))
	  (shell-command (concat "find " dir " -name *.hpp >> " file ))
	  (shell-command (concat "find " dir " -name *.c >> " file   ))
	  (shell-command (concat "find " dir " -name *.h >> " file   )))
	))

 ; Functions to create Ctags and Cscope files
(defun build-ctags-from-list (filename &optional target-directory)
  (interactive "f")
  (if target-directory
	  (call-process path-to-ctags nil (get-buffer-create "process-output") t "-e" "--extra=+fq" "-L" filename "-f" (concat target-directory "/TAGS"))
	(call-process path-to-ctags nil (get-buffer-create "process-output") t "-e" "--extra=+fq" "-L" filename)))

(defun build-cscope-from-list (filename &optional target-directory)
  (interactive "f")
  (if target-directory
	  (let ((default-directory target-directory))
		(call-process "cscope" nil (get-buffer-create "process-output") t "-U" "-b" "-i" filename))
	(call-process "cscope" nil (get-buffer-create "process-output") t "-U" "-b" "-i" filename))
	(message (concat "Cscope file built successfully for " filename)))

(defun build-gtags-from-list (filename &optional target-directory)
  (interactive "f")
  (if target-directory
	  (let ((default-directory target-directory))
		(call-process "gtags" nil (get-buffer-create "process-output") t "-f" filename))
	(call-process "gtags" nil (get-buffer-create "process-output") t "-f" filename))
	(message (concat "Cscope file built successfully for " filename)))


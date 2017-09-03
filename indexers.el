; Use cscope
(use-package xcscope
	     :ensure t
	     :pin melpa-stable
	     :init
	     ; Configure Emacs to accept Cygwin executables
	     (setq cscope-do-not-update-database t)
	     ;(setq exec-path (cons "C:/cygwin/bin" exec-path))
	     :config
	     (cscope-setup))

; Install ggtags for GNU Global (ctags/cscope substitution)
(use-package ggtags
  :ensure t
  :pin melpa-stable
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
(defun build-ctags (directory)
  (interactive "D")
  (let
      ((dos-dir (replace-regexp-in-string "/" "\\\\" (directory-file-name directory))))
    (call-process path-to-ctags nil (get-buffer-create "process-output") t "-e" "--extra=+fq" "--exclude=.git" "--exclude=build" "--exclude=GeneratedSources" "--exclude=CoSeMa" "--exclude=CppUnit" "--exclude=Import" "-R" "-f" (concat dos-dir "\\TAGS") dos-dir)
    (visit-tags-table (concat directory "/TAGS"))))

(defun build-ctags-from-list (filename &optional target-directory)
  (interactive "f")
  (if target-directory
	  (call-process path-to-ctags nil (get-buffer-create "process-output") t "-e" "--extra=+fq" "-L" filename "-f" (concat target-directory "/TAGS"))
	(call-process path-to-ctags nil (get-buffer-create "process-output") t "-e" "--extra=+fq" "-L" filename)))
	

(defun build-cscope (directory)
  (interactive "D")
  (call-process "sh" nil (get-buffer-create "process-output") t "cscope-indexer" "-r" directory)
  (cscope-set-initial-directory directory)
  (message (concat "Cscope file built successfully for " directory)))

(defun build-cscope-from-list (filename &optional target-directory)
  (interactive "f")
  (if target-directory
	  (let ((default-directory target-directory))
		(call-process "cscope" nil (get-buffer-create "process-output") t "-U" "-b" "-i" filename))
	(call-process "cscope" nil (get-buffer-create "process-output") t "-U" "-b" "-i" filename))
	(message (concat "Cscope file built successfully for " filename)))


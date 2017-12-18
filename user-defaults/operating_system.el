; Configure Emacs to use find and grep from MSYS
(setenv "PATH"
	(concat
	 ;; Change this with your path to MSYS bin directory
	 "C:\\MinGW\\msys\\1.0\\bin;"
	 "/usr/local/bin:"
	 (getenv "PATH")))

;; Install cygwin-mount to work with Cygwin paths
(add-to-list 'load-path "~/.emacs.d/cygwin-mount")
(require 'cygwin-mount)


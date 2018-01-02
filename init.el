;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Install use-package for managing packages
(add-to-list 'load-path "~/.emacs.d/use-package")
(require 'use-package)

;; Configure proxy servers to be used
(load-file "~/.emacs.d/proxy_conf.el")

;; MELPA to my package-archives
(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("elpy" . "https://jorgenschaefer.github.io/packages/"))

; Add user-defaults to load-path
(add-to-list 'load-path "~/.emacs.d/user-defaults")

; Configure Emacs according to operating system
(load "operating_system")

; Enable command completion system for Emacs
(load "commands_completion")

; Theme selection
(load "themes")

; Behavior/window configuration
(load "generic_behavior")

; Select input-interface system 
(setq ergoemacs-keyboard-layout "de")
(load "input")

; Enable IDE features, static analysis / code completion
(load "syntax")

; Configure indexers - ctags/cscope/ggtags
(setq path-to-ctags "c:/Users/SESA452110/MyPrograms/bin/ctags.exe")
(load "indexers")

; Configure project context 
(load "projects")

; Configure programming languages
(load "lang")

; Enable semantics in Emacs
(load "semantics")

(use-package neotree
  :ensure t
  :pin melpa
  :bind ("M-1" . neotree-toggle)
  :init
  (setq neo-theme 'nerd))

(add-to-list 'load-path "~/.emacs.d/sr-speedbar")
(require 'sr-speedbar)
(global-set-key (kbd "M-2") 'sr-speedbar-toggle)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
	("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(org-agenda-files (quote ("~/.emacs.d/xah-fly-keys.org")) t)
 '(package-selected-packages
   (quote
	(dash-at-point smartparens xcscope which-key projectile persistent-soft neotree monokai-theme magit god-mode ggtags flycheck ergoemacs-status ergoemacs-mode counsel company cmake-font-lock auto-complete)))
 '(safe-local-variable-values
   (quote
	((cmake-ide-build-pool-dir . t)
	 (cmake-ide-project-dir . "/home/user/MotionKernel/pcrt_ext_motionkernel/Workspace/UnitTestsCMake")
	 (company-clang-arguments "-IC:/pcrt_ext_motionkernel_ci/m262_fw/Workspace/ZC702_VSB//share/h" "-IC:/pcrt_ext_motionkernel_ci/m262_fw/Workspace/ZC702_VSB/krnl/h/system" "-IC:/pcrt_ext_motionkernel_ci/m262_fw/Workspace/ZC702_VSB/krnl/h/public" "-IC:/pcrt_ext_motionkernel_ci/m262_fw/Sources/ULoader/Includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PLC_Services/AbstractLayer/Includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PLC_Services/Export/Includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/GeneratedSources/Cds/Components" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/ExternalSources/CoSeMa" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/AdaptionLayer" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/ExternalSources" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/Manager" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/Platform")
	 (company-clang-arguments "-IC:/pcrt_ext_motionkernel_ci/m262_fw/Workspace/ZC702_VSB/share/h" "-IC:/pcrt_ext_motionkernel_ci/m262_fw/Workspace/ZC702_VSB/krnl/h/system" "-IC:/pcrt_ext_motionkernel_ci/m262_fw/Workspace/ZC702_VSB/krnl/h/public" "-IC:/pcrt_ext_motionkernel_ci/m262_fw/Sources/ULoader/includes" "-IC:/pcrt_ext_motionkernel_ci/m262_fw/Sources/Common/Includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PLC_Services/AbstractLayer/Includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PLC_Services/Export/Includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/ExternalSources" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/ExternalSources/CoSeMa" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/GeneratedSources/Cds/Components" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/AdaptionLayer" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/ExternalSources" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/Manager" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/Platform" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PCRT_Sdk/SDK/CDS_Interface/Platforms/VxWorks" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PCRT_Sdk/SDK/CDS_Interface/CDS_AddOn_Itf" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PCRT_Sdk/SDK/CDS_Interface/CDS_Itf" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PCRT_Sdk/SDK/Includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/GeneratedSources/Cds/Components" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel")
	 (company-clang-arguments "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/..//m262_fw/Workspace/ZC702_VSB/share/h" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/..//m262_fw/Workspace/ZC702_VSB/krnl/h/system" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/..//m262_fw/Workspace/ZC702_VSB/krnl/h/public" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/..//m262_fw/Workspace/ZC702_VSB/../../Sources/ULoader/includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/..//m262_fw/Workspace/ZC702_VSB/../../Sources/Common/Includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PLC_Services/AbstractLayer/Includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PLC_Services/Export/Includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/ExternalSources" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/ExternalSources/CoSeMa" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PCRT_Sdk/SDK/CDS_Interface/Platforms/VxWorks" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PCRT_Sdk/SDK/CDS_Interface/CDS_AddOn_Itf" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PCRT_Sdk/SDK/CDS_Interface/CDS_Itf" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PCRT_Sdk/SDK/Includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/GeneratedSources/Cds/Components" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel")))))
(put 'narrow-to-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

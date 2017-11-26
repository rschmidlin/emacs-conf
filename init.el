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

; Configure Emacs according to operating system
(load-file "~/.emacs.d/operating_system.el")

; Enable command completion system for Emacs
(load-file "~/.emacs.d/commands_completion.el")

; Theme selection
;(load-file "~/.emacs.d/themes.el")

; Behavior/window configuration
(load-file "~/.emacs.d/generic_behavior.el")

; Select input-interface system 
(setq ergoemacs-keyboard-layout "de")
(load-file "~/.emacs.d/input.el")

; Enable IDE features, static analysis / code completion
(load-file "~/.emacs.d/syntax.el")

; Configure indexers - ctags/cscope/ggtags
(setq path-to-ctags "c:/Users/SESA452110/MyPrograms/bin/ctags.exe")
(load-file "~/.emacs.d/indexers.el")

; Configure project context 
(load-file "~/.emacs.d/projects.el")

; Configure programming languages
(load-file "~/.emacs.d/lang.el")

; Enable semantics in Emacs
(load-file "~/.emacs.d/semantics.el")

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
 '(org-agenda-files (quote ("~/.emacs.d/xah-fly-keys.org")) t)
 '(package-selected-packages
   (quote
	(dash-at-point smartparens xcscope which-key projectile persistent-soft neotree monokai-theme magit god-mode ggtags flycheck ergoemacs-status ergoemacs-mode counsel company cmake-font-lock auto-complete)))
 '(safe-local-variable-values
   (quote
	((company-clang-arguments "-IC:/pcrt_ext_motionkernel_ci/m262_fw/Workspace/ZC702_VSB//share/h" "-IC:/pcrt_ext_motionkernel_ci/m262_fw/Workspace/ZC702_VSB/krnl/h/system" "-IC:/pcrt_ext_motionkernel_ci/m262_fw/Workspace/ZC702_VSB/krnl/h/public" "-IC:/pcrt_ext_motionkernel_ci/m262_fw/Sources/ULoader/Includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PLC_Services/AbstractLayer/Includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PLC_Services/Export/Includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/GeneratedSources/Cds/Components" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/ExternalSources/CoSeMa" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/AdaptionLayer" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/ExternalSources" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/Manager" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/Platform")
	 (company-clang-arguments "-IC:/pcrt_ext_motionkernel_ci/m262_fw/Workspace/ZC702_VSB/share/h" "-IC:/pcrt_ext_motionkernel_ci/m262_fw/Workspace/ZC702_VSB/krnl/h/system" "-IC:/pcrt_ext_motionkernel_ci/m262_fw/Workspace/ZC702_VSB/krnl/h/public" "-IC:/pcrt_ext_motionkernel_ci/m262_fw/Sources/ULoader/includes" "-IC:/pcrt_ext_motionkernel_ci/m262_fw/Sources/Common/Includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PLC_Services/AbstractLayer/Includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PLC_Services/Export/Includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/ExternalSources" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/ExternalSources/CoSeMa" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/GeneratedSources/Cds/Components" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/AdaptionLayer" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/ExternalSources" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/Manager" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/Platform" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PCRT_Sdk/SDK/CDS_Interface/Platforms/VxWorks" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PCRT_Sdk/SDK/CDS_Interface/CDS_AddOn_Itf" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PCRT_Sdk/SDK/CDS_Interface/CDS_Itf" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PCRT_Sdk/SDK/Includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/GeneratedSources/Cds/Components" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel")
	 (company-clang-arguments "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/..//m262_fw/Workspace/ZC702_VSB/share/h" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/..//m262_fw/Workspace/ZC702_VSB/krnl/h/system" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/..//m262_fw/Workspace/ZC702_VSB/krnl/h/public" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/..//m262_fw/Workspace/ZC702_VSB/../../Sources/ULoader/includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/..//m262_fw/Workspace/ZC702_VSB/../../Sources/Common/Includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PLC_Services/AbstractLayer/Includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PLC_Services/Export/Includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/ExternalSources" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/sercoshwmanager/Sources/ExternalSources/CoSeMa" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PCRT_Sdk/SDK/CDS_Interface/Platforms/VxWorks" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PCRT_Sdk/SDK/CDS_Interface/CDS_AddOn_Itf" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PCRT_Sdk/SDK/CDS_Interface/CDS_Itf" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/Import/PCRT_Sdk/SDK/Includes" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel/GeneratedSources/Cds/Components" "-IC:/pcrt_ext_motionkernel_ci/pcrt_ext_motionkernel")))))
(put 'narrow-to-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

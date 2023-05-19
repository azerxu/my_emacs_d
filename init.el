;;; Package: init.el --- Summary
;;; Commnentary:
;;; Code:

;; Add init-lisp package directory to load-path for require loading package
(add-to-list 'load-path (expand-file-name "init-lisp" user-emacs-directory))

(require 'init-font)			; 设置字体
(require 'init-ui)	    		; EMACS通用设置
(require 'init-package)			; 安装第三方包
(require 'init-tools)			; 设置通用工具
(require 'init-keys)			; 设置自定义快捷键
(require 'init-evil)			; 设置Evil-Mode兼容vim
(require 'init-theme)			; 设置主题
(require 'init-ivy)	    		; 自动补全
(require 'init-git)	    		; 设置git
(require 'init-projectile)		; 设置projectile
(require 'init-org)	    		; 设置org
(require 'init-lsp)	    		; 设置lsp language server protocol
(require 'init-term)			; 设置vterm
(require 'init-python)			; 设置python
(require 'init-dired)			; 设置dired file manager

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(zoom-window dired-hide-dotfiles dired-open all-the-icons-dired dired-single python-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

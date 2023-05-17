;;; Package: init.el --- Summary
;;; Commnentary:
;;; Code:

;; Add init-lisp package directory to load-path for require loading package
(add-to-list 'load-path (expand-file-name "init-lisp" user-emacs-directory))

(require 'init-font)			; 设置字体
(require 'init-options)			; EMACS通用设置
(require 'init-package)			; 安装第三方包
(require 'init-keys)			; 设置自定义快捷键
(require 'init-evil)			; 设置Evil-Mode兼容vim
(require 'init-theme)			; 设置主题
(require 'init-ivy)			; 自动补全
(require 'init-git)			; 设置git



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8" "be84a2e5c70f991051d4aaf0f049fa11c172e5d784727e0b525565bb1533ec78" "b99e334a4019a2caa71e1d6445fc346c6f074a05fcbb989800ecbe54474ae1b0" "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" default))
 '(package-selected-packages
   '(hydra evil-collection evil general all-the-icons doom-themes doom-thems helpful ivy-rich ivy-rick which-key rainbow-delimiters use-package doom-modeline counsel command-log-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )






(provide 'init)
;;; init.el ends here

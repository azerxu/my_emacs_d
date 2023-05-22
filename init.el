;;; Package: init.el --- Summary
;;; Commnentary:
;;; Code:

;; Set default coding system
(set-default-coding-systems 'utf-8)

;; Add init-lisp package directory to load-path for require loading package
(add-to-list 'load-path (expand-file-name "init-lisp" user-emacs-directory))

;; -------------------------------------------------------------------------
;; Default Settings
;; -------------------------------------------------------------------------
(require 'init-font)                ; 设置字体
(require 'init-ui)                  ; EMACS通用设置
(require 'init-setting)             ; 一些有用的设置


;; -------------------------------------------------------------------------
;; Package Settings
;; -------------------------------------------------------------------------
(require 'init-package)             ; 设置Package Manager


;; -------------------------------------------------------------------------
;; Package Settings
;; -------------------------------------------------------------------------
(require 'init-theme)               ; 设置主题
(require 'init-keys)                ; 设置自定义快捷键
(require 'init-tools)               ; 设置通用工具
(require 'init-evil)                ; 设置Evil-Mode兼容vim
(require 'init-projectile)          ; 设置projectile
(require 'init-term)                ; 设置vterm
(require 'init-dired)               ; 设置dired file manager

;; -------------------------------------------------------------------------
;; Programming Settings
;; -------------------------------------------------------------------------
(require 'init-completion)          ; completion
(require 'init-lsp)                 ; 设置lsp language server protocol
(require 'init-git)                 ; 设置git

;; Language Setting
(require 'init-python)              ; 设置python
(require 'init-lua)                 ; 设置lua


;; -------------------------------------------------------------------------
;; Org Setting
;; -------------------------------------------------------------------------
(require 'init-org)                 ; 设置org
(require 'init-present)             ; show org as PPT



(provide 'init)
;;; init.el ends here

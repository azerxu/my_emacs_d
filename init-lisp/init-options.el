;;; Package: init-options.el --- Summary
;;; Commentary:
;;; Code:

(setq inhibit-startup-message t)

(menu-bar-mode -1)			; Disable menubar
(scroll-bar-mode -1)			; Disable visible scrollbar
(tool-bar-mode -1)			; Disable the toolbar
(tooltip-mode -1)			; Disable tooltips
(set-fringe-mode 10)			; Give some breathing room

;; Set up the visible bell
(setq visible-bell t)

;; font setting
(set-face-attribute 'default nil :font "UbuntuMono NFM" :height 144)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Setting number line
(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))



(provide 'init-options)
;;; init-options.el ends here

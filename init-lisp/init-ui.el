;;; Package: init-ui.el --- Summary
;;; Commentary:
;;; Code:

(setq inhibit-startup-message t)

(menu-bar-mode -1)			; Disable menubar
(scroll-bar-mode -1)			; Disable visible scrollbar
(tool-bar-mode -1)			; Disable the toolbar
(tooltip-mode -1)			; Disable tooltips
(set-fringe-mode 10)			; Give some breathing room

;; turn off beeps, make them flash!
(setq visible-bell t)

;; (push '(tool-bar-lines . 0) default-frame-alist)
;; (push '(menu-bar-lines . 0) default-frame-alist)
;; (push '(vertical-scroll-bars) default-frame-alist)
;; (push '(background-color . "#232635") default-frame-alist)
;; (push '(foreground-color . "#FFFFFF") default-frame-alist)
;; (push '(mouse-color . "white") default-frame-alist)

;; Setting number line
(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                vterm-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


(provide 'init-ui)
;;; init-ui.el ends here

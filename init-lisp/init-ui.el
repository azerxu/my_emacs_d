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


;; Setting number line
(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


;; 可以避免生成*.*~文件
;; (setq-default make-backup-files nil)


;;以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p)


;; trailing spaces when saving a file
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; ************************************************************
;; Create directories that don't exist while creating a new file in emacs
;; ************************************************************
(add-hook 'before-save-hook
          (lambda ()
            (when buffer-file-name
              (let ((dir (file-name-directory buffer-file-name)))
                (when (not (file-exists-p dir))
                  (make-directory dir t))))))



(provide 'init-options)
;;; init-options.el ends here

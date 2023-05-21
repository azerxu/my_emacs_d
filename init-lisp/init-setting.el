;;; Package: init-setting.el --- Summary
;;; Commnentary:
;;; Code:

(autoload 'xclip-set-selection "xclip" "" t)
(autoload 'xclip-get-selection "xclip" "" t)

;; 可以避免生成*.*~文件
;; (setq-default make-backup-files nil)

;;以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p)


(hl-line-mode t)

; remember recent used file
(recentf-mode 1)

; remember minibuffer history use M-n, M-p to choose
(savehist-mode 1)
(setq history-length 25)

;; remember and restore the last cursor of opened files
(save-place-mode 1)

;; Changing the location of the "Custom file"
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; Don't pop up UI dialogs when prompting
;; (setq use-dialog-box nil)

;; Revert buffer when the underlying file has changed
(global-auto-revert-mode 1)

;; Revert Dired and other buffers
;; (setq global-auto-revert-non-file-buffers t)

;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)

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





(provide 'init-setting)
;;; init-setting.el ends here

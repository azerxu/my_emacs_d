;;; Package: init-setting.el --- Summary
;;; Commnentary:
;;; Code:

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


(provide 'init-setting)
;;; init-setting.el ends here

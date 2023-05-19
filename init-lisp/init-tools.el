;;; Package: init-tools.el --- Summary
;;; Commnentary:
;;; Code:

;; (use-package command-log-mode)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 2))

(use-package zoom-window
  :config
  (setq zoom-window-mode-line-color nil))

(general-define-key "C-c z" 'zoom-window-zoom)

(provide 'init-tools)
;;; init-tools.el ends here

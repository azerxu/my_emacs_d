;;; Package: init-projectile.el --- Summary
;;; Commnentary:
;;; Code:

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  ;; :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/source/Code")
    (setq projectile-project-search-path '("~/source/code")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :after projectile
  :config (counsel-projectile-mode 1))

(provide 'init-projectile)
;;; init-projectile.el ends here

;;; Package: init-typescript.el --- Summary
;;; Commnentary:
;;; Code:

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deffered)
  :config
  (setq typescript-indent-level 2))


(provide 'init-typescript)
;;; init-typescript.el ends here

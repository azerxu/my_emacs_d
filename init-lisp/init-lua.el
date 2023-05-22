;;; Package: init-lua.el --- Summary
;;; Commnentary:
;;; Code:

(use-package lua-mode
  :ensure t
  :hook (lua-mode . lsp-deferred))



(provide 'init-lua)
;;; init-lua.el ends here

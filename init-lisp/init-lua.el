;;; Package: init-lua.el --- Summary
;;; Commnentary:
;;; Code:


(use-package lsp-lua
  :ensure nil
  :diminish
  :config
  (setq lsp-lua-diagnostics-globals '("vim"))
  :hook (python-mode . (lambda ()
                         (require 'lsp-lua)
                         (lsp-deferred))))

(use-package lua-mode
  :ensure t
  :diminish
  :hook (lua-mode . lsp-deferred))


(provide 'init-lua)
;;; init-lua.el ends here

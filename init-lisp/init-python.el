;;; Package: init-python.el --- Summary
;;; Commnentary: Emacs setting for Python
;;; Code:

(use-package python-mode
  :ensure t
  :hook (python-mode . lsp-deferred)
  :custom
  (python-shell-interpreter "python3"))



(provide 'init-python)
;;; init-python.el ends here

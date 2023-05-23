;;; Package: init-python.el --- Summary
;;; Commnentary: Emacs setting for Python
;;; Code:

(defun python-run-buffer()
  (interactive)
  (shell-command (concat "python3 " (buffer-name))))


(use-package python-mode
  :ensure t
  :hook (python-mode . lsp-deferred)
  :bind (:map python-mode-map
              ("C-c C-c" . python-run-buffer))
  :config
  (add-to-list 'exec-path "/home/azer/.local/bin")
  :custom
  (python-shell-interpreter "python3"))



(provide 'init-python)
;;; init-python.el ends here

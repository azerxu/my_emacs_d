;;; Package: init-python.el --- Summary
;;; Commnentary: Emacs setting for Python
;;; Code:

;; ************************************************************
;; python setting
;; ************************************************************
(setenv "PATH" (concat (getenv "PATH") ":/home/azer/.local/bin"))


(defun python-run-buffer()
  (interactive)
  (shell-command (concat "python3 " (buffer-name))))


(use-package lsp-pylsp
  :ensure nil
  :config
  (add-to-list 'exec-path "/home/azer/.local/bin")
  :hook (python-mode . (lambda ()
                         (require 'lsp-pylsp)
                         (lsp-deferred))))


;; (use-package lsp-pyright
;;   :ensure t
;;   :config
;;   (add-to-list 'exec-path "/home/azer/.local/bin")
;;   ;; (setq lsp-pylsp-server-command "/home/azer/.local/bin/pylsp")
;;   :hook (python-mode . (lambda ()
;;                          (require 'lsp-pyright)
;;                          (lsp-deferred))))


(use-package python-mode
  :ensure t
  :hook (python-mode . lsp-deferred)
  :bind (:map python-mode-map
              ("C-c S-c" . python-run-buffer))
  :config
  (add-to-list 'exec-path "/home/azer/.local/bin")
  :custom
  (python-shell-interpreter "python3"))


(provide 'init-python)
;;; init-python.el ends here

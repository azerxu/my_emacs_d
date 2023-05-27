;;; Package: init-python.el --- Summary
;;; Commnentary: Emacs setting for Python
;;; Code:

;; ************************************************************
;; python setting
;; ************************************************************
(setenv "PATH" (concat (getenv "PATH") ":/home/azer/.local/bin"))


(defun efs/python-run-buffer ()
  (interactive)
  (shell-command (concat "python3 " (buffer-name))))

(defun efs/python-format-buffer ()
  (interactive)
  (shell-command (concat "isort " (buffer-name)))
  (shell-command (concat "black " (buffer-name))))


(use-package lsp-pylsp
  :ensure nil
  :config
  (add-to-list 'exec-path "/home/azer/.local/bin")
  (add-hook 'before-save-hook 'lsp-format-buffer)

  ;; Formatter
  (setq lsp-pylsp-plugins-yapf-enabled nil)
  (setq lsp-pylsp-plugins-black-enabled t)

  ;; Lint
  (setq lsp-pylsp-plugins-pyflakes-enabled nil)
  (setq lsp-pylsp-plugins-pylint-enabled nil)
  (setq lsp-pylsp-plugins-pycodestyle-enabled nil)
  (setq lsp-pylsp-plugins-pycodestyle-max-line-length 100)
  (setq lsp-pylsp-plugins-pydocstyle-enabled nil)
  (setq lsp-pylsp-plugins-flake8-enabled nil)
  (setq lsp-pylsp-plugins-flake8-max-line-length 100)
  (setq lsp-pylsp-plugins-mccabe-enabled nil)

  ;; JEDI
  (setq lsp-pylsp-plugins-jedi-completion-fuzzy t)
  (setq lsp-pylsp-plugins-jedi-completion-include-params t)
  (setq lsp-pylsp-plugins-jedi-completion-enabled t)
  (setq lsp-pylsp-plugins-jedi-definition-follow-imports t)
  (setq lsp-pylsp-plugins-jedi-definition-follow-builtin-imports t)
  (setq lsp-pylsp-plugins-jedi-hover-enabled t)
  (setq lsp-pylsp-plugins-jedi-references-enabled t)
  (setq lsp-pylsp-plugins-jedi-signature-help-enabled t)
  (setq lsp-pylsp-plugins-jedi-symbols-enabled t)
  (setq lsp-pylsp-plugins-jedi-symbols-all-scopes t)

  ;; CUSTOM SETTINGS
  ;; (setq lsp-pylsp-plugins-mypy-enabled t)
  ;; (setq lsp-pylsp-plugins-rope-autoimport-enabled t)
  (setq lsp-pylsp-plugins-ruff-enabled t)
  (setq lsp-pylsp-plugins-pyls-isort-enabled t)

 :hook (python-mode . (lambda ()
                         (require 'lsp-pylsp)
                         (lsp-deferred))))



  ;; (defcustom lsp-pylsp-plugins-ruff-enabled nil
  ;;   "Enable or disable the ruff plugin."
  ;;   :type 'boolean
  ;;   :group 'lsp-pylsp)

  ;; (defcustom lsp-pylsp-plugins-isort-enabled nil
  ;;   "Enable or disable the isort plugin."
  ;;   :type 'boolean
  ;;   :group 'lsp-pylsp)

  ;; (defcustom lsp-pylsp-plugins-rope-autoimport-enabled nil
  ;;   "Enable or disable rope_autoimport"
  ;;   :type 'boolean
  ;;   :group 'lsp-pylsp)

  ;; (defcustom lsp-pylsp-plugins-mypy-enabled nil
  ;;   "Enable or disable mypy"
  ;;   :type 'boolean
  ;;   :group 'lsp-pylsp)

  ;; ;; register custom settings for pyls plugins
  ;; (lsp-register-custom-settings
  ;;  '(("pylsp.plugins.mypy.enabled" lsp-pylsp-plugins-mypy-enabled t)
  ;;    ;;    ("pylsp.plugins.mypy.live_mode" nil t)
  ;;    ("pylsp.plugins.rope_autoimport.enabled" lsp-pylsp-plugins-rope-autoimport-enabled t)
  ;;    ("pylsp.plugins.ruff.enabled" lsp-pylsp-plugins-ruff-enabled t)
  ;;    ("pylsp.plugins.isort.enabled" lsp-pylsp-plugins-isort-enabled t)))



;; (use-package lsp-pyright
;;   :ensure t
;;   :config
;;   (add-to-list 'exec-path "/home/azer/.local/bin")

;;   ;; set this to nil if getting too many false positive type errors
;;   (setq lsp-pyright-use-library-code-for-types t)

;;   (setq lsp-pyright-auto-import-completions t)
;;   (setq lsp-pyright-stub-path (concat (getenv "HOME") "/source/python-type-stubs"))

;;   :hook (python-mode . (lambda ()
;;                          (require 'lsp-pyright)
;;                          (lsp-deferred))))


(use-package python-mode
  :ensure t
  :hook ((python-mode . lsp-deferred)
         (python-mode . hs-minor-mode))

  :bind (:map python-mode-map
              ("C-c r" . lsp-rename)
              ("C-c f" . lsp-format-buffer)
              ("C-c R" . efs/python-run-buffer))
  :config
  (setq python-indent-offset 4)
  (python-indent-offset 4)
  (add-to-list 'exec-path "/home/azer/.local/bin")
  (add-hook 'before-save-hook 'lsp-format-buffer)
  (general-def
   :prefix ","
   :states 'normal
   :keymaps 'python-mode-map

   ;; fold code
   "z" '(:ignore t :which-key "fold")
   "zi" '(:ignore t :which-key "fold")
   "za" '(evil-toggle-fold :which-key "toggle fold")
   "zo" '(:ignore t :which-key "fold")

   )
  :custom
  (python-indent-offset 4)
  (python-shell-interpreter "python3"))


(provide 'init-python)
;;; init-python.el ends here

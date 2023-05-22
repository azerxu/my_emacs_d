;;; Package: init-lsp.el --- Summary
;;; Commnentary:
;;; Code:

(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))


(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . efs/lsp-mode-setup)
  :init
  (setq lsp-keymap-prefix "C-c l")	; or "C-l", "S-l"
  :config
  (lsp-enable-which-key-integration t))


(use-package company
  :after lsp-mode
  :diminish company-mode
  :hook (prog-mode . company-mode)
  :bind
  (:map company-active-map
	("<tab>" . company-complete-selection)
	("C-l" . company-complete-selection))
  (:map lsp-mode-map
	("<tab>" . company-indent-or-complete-common))
  :custom
  (company-show-numbers t)
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))


(use-package company-box
  :diminish company-box-mode
  :hook (company-mode . company-box-mode))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

(use-package lsp-treemacs
  :after lsp)

;; (use-package lsp-ivy)

(use-package company-tabnine
  :commands (company-tabnine))
  ;; :init (company-tabnine 1))
;;   :config
;;   (add-to-list 'company-backends #'company-tabnine))

;; ;; (require 'company-tabnine)

(provide 'init-lsp)
;;; init-lsp.el ends here

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
  :hook (prog-mode . company-mode)
  :bind
  (:map company-active-map
	("S-<tab>" . company-select-previous)
	("<tab>" . company-select-next-if-tooltip-visible-or-complete-selection)
	("C-l" . company-complete-selection))
  (:map lsp-mode-map
	("<tab>" . company-select-next-if-tooltip-visible-or-complete-selection))
	;; ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

(use-package lsp-treemacs
  :after lsp)

(use-package lsp-ivy)


(provide 'init-lsp)
;;; init-lsp.el ends here

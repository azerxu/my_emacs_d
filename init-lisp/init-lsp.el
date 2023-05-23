;;; Package: init-lsp.el --- Summary
;;; Commnentary:
;;; Code:

(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))


(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . efs/lsp-mode-setup)
  :bind (:map lsp-mode-map
              ;; ("C-c l" . lsp-command-map)
              ("C-c d" . lsp-describe-thing-at-point)
              ("C-c a" . lsp-execute-code-action))
  :init
  (setq lsp-keymap-prefix "C-c l")	; or "C-l", "S-l"
  (setq lsp-enable-snippet nil)
  :config
  (lsp-enable-which-key-integration t))


(use-package company
  :after lsp-mode
  :hook ((lsp-mode . company-mode)
         (emacs-lisp-mode . (lambda ()
                              (setq-local company-backends '(company-elisp))))
         (emacs-lisp-mode . company-mode))
  :bind
  (:map company-active-map
        ("<tab>" . company-select-next-if-tooltip-visible-or-complete-selection)
        ;; ("<tab>" . company-complete-selection)
        ("C-l" . company-complete-selection))
  (:map lsp-mode-map
        ("<tab>" . company-indent-or-complete-common))
  :config
  (company-keymap--unbind-quick-access company-active-map)
  ;; (company-tng-mode)
  (company-tng-configure-default)
  :custom
  (company-show-numbers t)
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.1))


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

(use-package flycheck)

(provide 'init-lsp)
;;; init-lsp.el ends here

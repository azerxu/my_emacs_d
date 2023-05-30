;;; Package: init-lsp.el --- Summary
;;; Commnentary:
;;; Code:

(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments
        '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

;;; variable that controls the maximum amount of data to read from a subprocess in one chunk.
(setq read-process-output-max (* 1024 1024)) ;; 1mb

;;; Increasing the value of gc-cons-threshold can reduce the frequency of garbage collection
;;; and improve the responsiveness of lsp-mode, but it can also increase the memory usage of Emacs.
(defun efs/lsp-mode-gc-setup ()
  (setq gc-cons-threshold 100000000)) ;; 100mb


(use-package lsp-mode
  :diminish
  :commands (lsp lsp-deferred)
  :hook ((lsp-mode . efs/lsp-mode-setup)
         (lsp-mode . efs/lsp-mode-gc-setup))
  :bind
  (:map lsp-mode-map
        ("C-c d" . lsp-describe-thing-at-point)
        ("C-c e" . lsp-treemacs-errors-list)
        ("C-c a" . lsp-execute-code-action))
  (:map evil-normal-state-map
        ("gh" . lsp-describe-thing-at-point))
  :init
  (setq lsp-keymap-prefix "C-c l")	; or "C-l", "S-l", "C-c l"
  (setq lsp-enable-snippet nil)
  (setq lsp-enable-symbol-highlighting t)
  :config
  (efs/leader-key-def
    "l"   '(:ignore t :which-key "lsp")
    "lf"  '(lsp-format-buffer :which-key "format buffer")
    "lr"  '(lsp-rename :which-key "rename"))
  (lsp-enable-which-key-integration t))


(use-package lsp-treemacs
  :after lsp-mode
  :config
  (efs/leader-key-def
    "xx"  '(lsp-treemacs-errors-list :which-key "show errors")))


(use-package lsp-ui
  :commands lsp-ui-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-sideline-show-hover t)
  (setq lsp-ui-sideline-delay 0.5)
  (setq lsp-ui-sideline-ignore-duplicate t)
  ;; (setq lsp-ui-doc-position 'bottom)
  (setq lsp-ui-doc-position 'top)
  (setq lsp-ui-doc-delay 5)
  (setq lsp-ui-doc-alignment 'frame)
  (setq lsp-ui-doc-header nil)
  (setq lsp-ui-doc-include-signature t)
  (setq lsp-ui-use-childframe t)
  :bind
  (:map evil-normal-state-map
        ("gd" . lsp-ui-peek-find-definitions)
        ("gr" . lsp-ui-peek-find-references))
  :config
  (efs/leader-key-def
    "li"  '(lsp-ui-imenu :which-key "imenu"))
  :custom
  (lsp-ui-doc-position 'top))


(use-package company
  :after lsp-mode
  :hook ((lsp-mode . company-mode))
  :bind
  (:map company-active-map
        ("<tab>" . company-select-next-if-tooltip-visible-or-complete-selection)
        ("M-f"   . company-complete-common-or-show-delayed-tooltip)
        ("C-l"   . company-complete-selection))
  ;; (:map lsp-mode-map
  ;;       ("<tab>" . company-indent-or-complete-common))
  ;; :config
  ;; (company-keymap--unbind-quick-access company-active-map)
  ;; (company-tng-mode)
  ;; (company-tng-configure-default)
  :custom
  (company-show-numbers t)
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.1))


(use-package company-box
  :diminish
  :hook (company-mode . company-box-mode))


(use-package company-tabnine
  ;; :init (company-tabnine 1)
  ;; :config
  ;; (require 'company-tabnine)
  ;; (add-to-list 'company-backends #'company-tabnine)
  :commands (company-tabnine))

;; (use-package flycheck)

(provide 'init-lsp)
;;; init-lsp.el ends here

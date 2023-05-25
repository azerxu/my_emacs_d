;;; Package: init-theme.el --- Summary
;;; Commnentary:
;;; Code:

(use-package all-the-icons)

(setq all-the-icons-scale-factor 0.8)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-icon t            ; enable/disable all icons
        doom-modeline-modal-icon t      ; Icon for Evil mode
        doom-modeline-major-mode-icon t
        doom-modeline-major-mode-color-icon t
        doom-modeline-buffer-encoding t
        doom-modeline-enable-word-count t)
  :custom ((doom-modeline-height 15)
	   (doom-modeline-bar-width 5)
	   (doom-modeline-minor-modes t)))

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t ; if nil, bold is univerally disabled
        doom-themes-enable-italic t) ; if nil, bold is univerally disabled

  ;; Enable flashing mode-line on errors
  ;; (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minibuffer
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)
  :init (load-theme 'doom-one t))

(provide 'init-theme)
;;; init-theme.el ends here

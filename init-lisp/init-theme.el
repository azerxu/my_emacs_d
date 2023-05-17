;;; Package: init-theme.el --- Summary
;;; Commnentary:
;;; Code:

(use-package all-the-icons)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package doom-themes
  :init (load-theme 'doom-one t))

(setq all-the-icons-scale-factor 2.1)
;; setting theme
;; (load-theme 'wombat t)


(provide 'init-theme)
;;; init-theme.el ends here
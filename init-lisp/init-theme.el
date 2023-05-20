;;; Package: init-theme.el --- Summary
;;; Commnentary:
;;; Code:

(use-package all-the-icons)

(setq all-the-icons-scale-factor 1)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)
	   (doom-modeline-bar-width 6)
	   (doom-modeline-minor-modes t)))

(use-package doom-themes
  :init (load-theme 'doom-one t))

(provide 'init-theme)
;;; init-theme.el ends here

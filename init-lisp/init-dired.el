;;; Package: init-dired.el --- Summary
;;; Commnentary:
;;; Code:

(use-package dired-single)

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :custom
  ((dired-listing-switches "-agho --group-directories-first"))
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-single-up-directory
    "l" 'dired-single-buffer))

;; (use-package all-the-icons-dired
;;   :hook (dired-mode . all-the-icons-dired-mode))


(use-package dired-open
  :config
  ;; Doesn't work as expected!
  (add-to-list 'dired-open-functions #'dired-open-xdg t)
  ;; -- OR! --
  (setq dired-open-extensions '(("png" . "feh")
				("jpg" . "feh")
				("mp4" . "mpv")
				("mkv" . "mpv"))))

(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "H" 'dired-hide-dotfiles-mode))


(provide 'init-dired)
;;; init-dired.el ends here

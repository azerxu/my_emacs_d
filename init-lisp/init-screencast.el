;;; Package: init-screencast.el --- Summary
;;; Commnentary:
;;; Code:


(use-package keycast
  :hook (after-init . keycast-mode) ;; start the mode after Emacs starts
  :commands keycast-mode
  :config

  (define-minor-mode keycast-mode
    "Show current command and its key binding in the mode line."
    :global t
    (if keycast-mode
        (progn
          (setq keycast-mode-line-insert-after 'emacs-lisp-mode) ;; change this to your preferred value
          (add-to-list 'mode-line-format 'keycast-mode-line 'append))
      (setq mode-line-format (delete 'keycast-mode-line mode-line-format))))
  (setq keycast-insert-after 'mode-line-misc-info)
  (setq keycast-remove-tail-elements nil))


(provide 'init-screencast)
;;; init-screencast.el ends here

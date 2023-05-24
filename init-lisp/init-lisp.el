;;; Package: init-lisp.el --- Summary
;;; Commnentary:
;;; Code:

(use-package emacs-lisp-mode
  :ensure nil
  :config
  :hook ((emacs-lisp-mode . (lambda ()
                              (setq-local company-backends '(company-elisp))))
         (emacs-lisp-mode . company-mode)))



(provide 'init-lisp)
;;; init-lisp.el ends here

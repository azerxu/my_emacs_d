;;; Package: init-lisp.el --- Summary
;;; Commnentary:
;;; Code:

(use-package emacs-lisp-mode
  :ensure nil
  :config
  (general-def
    :prefix ","
    :states 'motion
    :keymaps 'emacs-lisp-mode-map
    ""    nil
    "e"  '(nil :which-key "eval")
    "es" '(eval-last-sexp :which-key "eval last sexp")
    "er" '(eval-region :which-key "eval region")
    "eb" '(eval-buffer :which-key "eval buffer")

    "c"  '(check-parens :which-key "check parens")
    "I"  '(indent-region :which-key "indent region")
    )
  
  :hook ((emacs-lisp-mode . (lambda ()
                              (setq-local company-backends '(company-elisp))))
         (emacs-lisp-mode . company-mode)))



(provide 'init-lisp)
;;; init-lisp.el ends here

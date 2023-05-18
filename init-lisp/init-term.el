;;; Package: init-term.el --- Summary
;;; Commnentary:
;;; Code:

(defun efs/configure-eshell()
  ;; Save command history when commands are entered
  ;; (add-hook 'eshell-pre-command-hook 'eshell-save-some-history)

  ;; Truncate buffer for preformance
  (add-to-list 'eshell-output-filter-functions 'eshell-truncate-buffer)

  ;; Bind some useful keys for evil-mode
  (evil-define-key '(normal insert visual) eshell-mode-map (kbd "C-r") 'counsel-esh-history)
  (evil-define-key '(normal insert visual) eshell-mode-map (kbd "<home>") 'eshell-bol)
  (evil-normalize-keymaps)

  (setq
   ;; eshell-history-size 10000
   eshell-buffer-maximum-lines 10000
   ;; eshell-hist-ignoredups t
   eshell-scroll-to-bottom-on-input t))

(use-package eshell-git-prompt)

(use-package eshell
  :config
  (eshell-git-prompt-use-theme 'powerline)
  :hook (eshell-mode . efs/configure-eshell))


(use-package vterm
  :commands vterm
  :config
  (setq vterm-max-scroolback 100000))


(provide 'init-term)
;;; init-term.el ends here

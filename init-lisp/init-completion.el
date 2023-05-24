;;; Package: init-completion.el --- Summary
;;; Commnentary:
;;; Code:

;; (defun efs/minibuffer-backward-kill (arg)
;;   "When minibuffer is completing a file name delete up to parent folder, otherwise delete a word"
;;   (interactive "p")
;;   (if minibuffer-completing-file-name
;;       (if (string-match-p "/." (minibuffer-contents))
;; 	  (zap-up-to-char (- arg) ?/)
;; 	(delete-minibuffer-contents))
;;     (backward-kill-word arg)))

;; Add a key binding for killing backward to go up parent directorys, etc
;; (define-key minibuffer-local-map (kbd "M-h") 'efs/minibuffer-backward-kill)



(use-package vertico
  :custom
  (vertico-cycle t)
  :bind (:map vertico-map
              ("C-j" . vertico-next)
              ("C-k" . vertico-previous)
              ("C-f" . vertico-exit)
              ("M-h" . vertico-directory-up))
  :init
  (vertico-mode))


(use-package marginalia
  :after vertico
  :custom
  (marginalia-annotators '(marginalia-lighter nil))
  :init
  (marginalia-mode 1))


(use-package consult
  :init
  (setq completion-in-region-function #'consult-completion-in-region)
  :config
  (global-set-key (kbd "C-M-j") 'consult-buffer)
  (global-set-key (kbd "C-s") 'consult-line)
  (define-key minibuffer-local-map (kbd "C-r") 'consult-history))


(use-package orderless
  :init
  (setq completion-styles '(orderless))
  (setq completion-category-defaults nil)
  (setq completion-category-overrides '((file (styles . (partial-completion))))))


(use-package embark-consult)

(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)                 ; pick some comfortale binding
   ("M-." . embark-dwim)                ; good alternative: M-.
   ("C-h B" . embark-bindings))         ; alternative for "describe binding
  :init
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command))


(provide 'init-completion)
;;; init-completion.el ends here

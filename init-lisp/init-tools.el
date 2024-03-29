;;; Package: init-tools.el --- Summary
;;; Commnentary:
;;; Code:

;; (use-package command-log-mode)

(use-package xclip)
;;; use xclip in terminal mode
(if (display-graphic-p)
    (message "Emacs is running in GUI mode")
  (xclip-mode 1))

;;; remove minor-mode name from modeline
(use-package diminish)

(use-package savehist
  :init
  (savehist-mode))


(use-package paredit
  :diminish eldoc-mode
  ;; :bind (:map paredit-mode-map
  ;;             ("M-;" . comment-dwim))
  :hook (emacs-lisp-mode . paredit-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish
  :config
  (setq which-key-idle-delay 2))

(use-package zoom-window
  :config
  (setq zoom-window-mode-line-color nil))

;; (general-define-key "C-c z" 'zoom-window-zoom)
(global-set-key (kbd "C-c z") 'zoom-window-zoom)


(use-package helpful
  :bind
  ([remap describe-function] . helpful-function)
  ([remap describe-callable] . helpful-callable)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-key] . helpful-key)
  :config
  (global-set-key (kbd "C-c C-d") #'helpful-at-point))


;;; remove minor mode from modeline
(defvar mode-line-cleaner-alist
  '((auto-complete-mode . " α")
    (yas/minor-mode . " υ")
    (company-mode . " ψ")
    (eldoc-mode . " ε")
    (evil-collection-unimpaired-mode " θ")
    (paredit-mode . " π"))
  "Alist for `clean-mode-line'.

When you add a new element to the alist, keep in mind that you must pass the correct
minor/major mode symbol and a string you want to use in the modeline")

(defun clean-mode-line ()
  (interactive)
  (dolist (cleaner mode-line-cleaner-alist)
    (let* ((mode (car cleaner))
           (mode-str (cdr cleaner))
           (old-mode-str (cdr (assq mode minor-mode-alist))))
      (when old-mode-str
        (setcar old-mode-str mode-str))
      ;; major mode
      (when (eq mode major-mode)
        (setq mode-name mode-str)))))



(add-hook 'after-change-major-mode-hook 'clean-mode-line)

(provide 'init-tools)
;;; init-tools.el ends here

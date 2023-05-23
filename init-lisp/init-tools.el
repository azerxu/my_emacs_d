;;; Package: init-tools.el --- Summary
;;; Commnentary:
;;; Code:

;; (use-package command-log-mode)

;;; remove minor-mode name from modeline
(use-package diminish)

(use-package paredit
  :diminish (paredit-mode)
  :bind (:map paredit-mode-map
              ("M-;" . comment-dwim))
  :hook (prog-mode . paredit-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
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


(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit 1))

(efs/leader-key-def
  "ts" '(hydra-text-scale/body :which-key "scale text"))


;;; remove minor mode from modeline
(defvar mode-line-cleaner-alist
  '((auto-complete-mode . " α")
    (yas/minor-mode . " υ")
    (company-mode . " ψ")
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

;;; Package: init-tools.el --- Summary
;;; Commnentary:
;;; Code:

;; (use-package command-log-mode)

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

(general-define-key "C-c z" 'zoom-window-zoom)


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



(provide 'init-tools)
;;; init-tools.el ends here

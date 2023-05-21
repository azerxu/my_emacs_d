;;; Package: init-keys.el --- Summary
;;; Commentary:
;;; Code:


;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; 设置注释选择区域快捷键
(global-set-key (kbd "s-o") 'comment-or-uncomment-region)
(global-set-key (kbd "M-o") 'comment-line)


(defun vi-open-line-below ()
  "Insert a newline below the current line and put point at beginning."
    (interactive)
    (unless (eolp)
      (end-of-line))
    (newline-and-indent))

(define-key global-map (kbd "C-S-o") 'vi-open-line-below)


(define-key emacs-lisp-mode-map (kbd "C-x M-t") 'counsel-load-theme)


(use-package general
  :ensure t
  :config
  (general-evil-setup t)

  (general-create-definer efs/leader-key-def
			  :keymaps '(normal insert visual emacs)
			  :prefix "C-x"
			  :global-prefix "C-x")

  (efs/leader-key-def
    "o"  '(:ignore t :which-key "org")
    "oa" '(org-agenda :which-key "org agenda")
    "oc" '(org-capture :which-key "org capture")

    "w"  '(:ignore t :which-key "window")
    "wz" '(zoom-window-zoom :which-key "zoom window")
    "w|" '(split-window-horizontally :which-key "split window horizon")
    "w-" '(split-window-vertically :which-key "split window vertically")

    "t"  '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")))


(provide 'init-keys)
;;; init-keys ends here

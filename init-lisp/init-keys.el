;;; Package: init-keys.el --- Summary
;;; Commentary:
;;; Code:


;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; 设置注释选择区域快捷键
(global-set-key (kbd "M-o") 'comment-or-uncomment-region)

;; 切换buffer带预览
;; (global-set-key (kbd "C-M-j") 'counsel-switch-buffer)


(define-key emacs-lisp-mode-map (kbd "C-x M-t") 'counsel-load-theme)


(use-package general
  :ensure t
  :config
  (general-evil-setup t)

  (general-create-definer rune/leader-keys
			  :keymaps '(normal insert visual emacs)
			  :prefix "C-x"
			  :global-prefix "C-x")

  (general-create-definer dw/leader-key-def
			  :keymaps '(normal insert emacs)
			  :prefix "C-x")

  (rune/leader-keys
   "t"  '(:ignore t :which-key "toggles")
   "tt" '(counsel-load-theme :which-key "choose theme")))


(general-define-key
 "C-M-j" 'counsel-switch-buffer)



(provide 'init-keys)
;;; init-keys ends here

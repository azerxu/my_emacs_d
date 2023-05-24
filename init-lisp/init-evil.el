;;; Package: init-evil.el --- Summary
;;; Commnentary:
;;; Code:

(defun efs/evil-hook ()
  (dolist (mode '(custom-mode
		  eshell-mode
		  git-rebase-mode
		  term-mode))
    (add-to-list 'evil-emacs-state-modes mode)))

(use-package undo-tree
  :diminish
  :config
  ;; Prevent undo tree files from polluting your git repo
  (setq undo-tree-history-directory-alist '(("." . "~/.config/emacs/undo-tree-history-directory"))) 
  (setq undo-tree-auto-save-history t)
  (global-undo-tree-mode))


;; C-z to switch emacs and vim
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  (setq evil-respect-visual-line-mode t)
  (setq evil-undo-system 'undo-tree)
  (evil-mode 1)
  :config

  ;; Rebind `universal-argument' to `C-M-u' since `C-u' now scrolls the buffer
  (global-set-key (kbd "C-M-u") 'universal-argument)

  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  (define-key evil-normal-state-map (kbd "C-e") 'evil-end-of-line)
  (define-key evil-insert-state-map (kbd "C-a") 'evil-beginning-of-line)
  (define-key evil-insert-state-map (kbd "C-k") 'paredit-kill)
  (define-key evil-insert-state-map (kbd "C-S-o") 'evil-open-above)
  (define-key evil-insert-state-map (kbd "C-o") 'evil-open-below)
  (define-key evil-insert-state-map (kbd "C-p") 'evil-previous-line)
  (define-key evil-insert-state-map (kbd "C-n") 'evil-next-line)
  (define-key evil-insert-state-map (kbd "C-y") 'yank)


  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal)

  :hook (evil-mode . efs/evil-hook))


(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))


(provide 'init-evil)
;;; init-evil.el ends here

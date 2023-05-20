;;; Package: init-window.el --- Summary
;;; Commnentary:
;;; Code:


;; (defvar efs-windows-key-map (make-keymap))

(defcustom efs-windows-evil-style nil
  "When t, window movement bindings will be evil-style.")

(defcustom efs-windows-prefix-key "C-c C-w"
  "Configure the prefix key for `efs-windows' bindings.")

(winner-mode 1)


(define-prefix-command 'efs-windows-key-map)


(define-key 'efs-windows-key-map (kbd "u") 'winner-undo)
(define-key 'efs-windows-key-map (kbd "r") 'winner-redo)
(define-key 'efs-windows-key-map (kbd "n") 'windmove-down)
(define-key 'efs-windows-key-map (kbd "p") 'windmove-up)
(define-key 'efs-windows-key-map (kbd "b") 'windmove-left)
(define-key 'efs-windows-key-map (kbd "f") 'windmove-right)

(global-set-key (kbd efs-windows-prefix-key) 'efs-windows-key-map)


(provide 'init-window)
;;; init-window.el ends here

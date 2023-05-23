;;; Package: init-exwm.el --- Summary
;;; Commnentary:
;;; Code:



(defun efs/exwm-update-class ()
  (exwm-workspace-rename-buffer exwm-class-name))

(use-package exwm
  :config
  ;; Set the default number of workspaces
  (setq exwm-workspace-number 5)

  ;; When window "class" updates, use it to set the buffer name
  (add-hook 'exwm-update-class-hook #'efs/exwm-update-class)

  ;; Set the screen resolution
  (require 'exwm-randr)
  (exwm-randr-enable)
  ;; ;; (start-process-shell-command "xrandr" nil
  ;;                              "xrandr --output Virtual-1 --primary --mode 2560x1440 --pos 0x0 --rotate normal")

  ;; Rebind CapsLock to Ctrl
  ;; Make sure xmodmap is installed!
  ;; Swap Capslock with Ctrl and places Capslock on right Ctrl key
  ;; (start-process-shell-command "xmodmap" nil "xmodmap ~/.config/emacs/exwm/Xmodmap")

  ;; Load the system tray before exwm-init
  (require 'exwm-systemtray)
  (exwm-systemtray-enable)

  ;; These keys should always pass through to emacs
  ;; Use M-& to lauch a process asynchronously
  ;; Use S-M-& binding from EXWM to lauch without popup
  (setq exwm-input-prefix-keys
        '(?\C-x
          ?\C-u
          ?\C-h
          ?\M-x
          ?\M-`
          ?\M-&
          ?\M-:
          ?\C-\M-j ;; buffer list
          ?\C-\ ))                      ;; ctrl+space

  ;; Ctrl+Q will enable the next key to be sent directly
  (define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)

  ;; Set up global key bindings. These always work, no matter the input states!
  ;; Keep in mind that changing this list after EXWM initializes has no effect
  (setq exwm-input-global-keys
        `(
          ;; Reset to line-mode (C-c C-k switches to char-mode via exwm-input-release-keyboard)
          ([?\s-r] . exwm-reset)

          ;; Move between windows
          ([s-left] . windmove-left)
          ([s-right] . windmove-right)
          ([s-up] . windmove-up)
          ([s-down] . windmove-down)

          ;; Launch application via shell command
          ([?\s-&] . (lambda (command)
                       (interactive (list (read-shell-command "$ ")))
                       (start-process-shell-command command nil command)))

          ;; Use C-c RET: Move window to numbered workspace
          ;; Switch workspace
          ([?\s-w] . exwm-workspace-switch)
          ([?\s-`] . (lambda () (interactive)
                       (exwm-workspace-switch-create 0)))

          ;; "s-N": switch to certein workspace with `Super' (Win) plus a number key (0-9)
          ,@ (mapcar (lambda (i)
                       `(,(kbd (format "s-%d" i)) .
                         (lambda ()
                           (interactive)
                           (exwm-workspace-switch-create ,i))))
                     (number-sequence 0 9))))

  (exwm-enable))


(provide 'init-exwm)
;;; init-exwm.el ends here

;;; Package: init-daemon.el --- Summary
;;; Commnentary:
;;; Code:

(pcase system-type
  ('gnu/linux "It's Linux")
  ('windows-nt "It's Windows")
  ('darwin "It's macOS"))


(defun efs/set-font-faces ()
  (message "Setting faces!")
  (set-face-attribute 'default nil
                      :font "UbuntuMono Nerd Font Mono"
                      :height 144)

  ;; Set the fixed pitch face
  (set-face-attribute 'fixed-pitch nil
                      :font "UbuntuMono Nerd Font Mono"
                      :height 144)

  ;; Set the variable pitch face
  (set-face-attribute 'variable-pitch nil
                      :font "Sarasa Mono SC"
                      :weight 'regular
                      :height 128))


(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (efs/set-font-faces))))
  (efs/set-font-faces))



(provide 'init-daemon)
;;; init-daemon.el ends here

;;; Package: init-font.el --- Summary
;;; Commnentary: Font setting
;;; Code:

;; 使用Mac Font
;; (set-face-attribute 'default nil :font "MesloLGSDZ Nerd Font Mono" :height 120)

;; ;; 使用Ubuntu Mono Font
;; (set-face-attribute 'default nil
;;                     :font "UbuntuMono Nerd Font Mono"
;;                     :height 144)

;; ;; Set the fixed pitch face
;; (set-face-attribute 'fixed-pitch nil
;;                     :font "UbuntuMono Nerd Font Mono"
;;                     :height 144)

;; ;; Set the variable pitch face
;; (set-face-attribute 'variable-pitch nil
;;                     :font "Sarasa Mono SC"
;;                     :weight 'regular
;;                     :height 128)


(defun efs/set-font-faces ()
  (message "Setting faces!")
  (set-face-attribute 'default nil
                      :font "MesloLGMDZ NFM"
                      :height 120)

  ;; Set the fixed pitch face
  (set-face-attribute 'fixed-pitch nil
                      :font "UbuntuMono Nerd Font Mono"
                      :height 144)

  ; ;; Set the variable pitch face
  ; (set-face-attribute 'variable-pitch nil
  ;                     :font "Sarasa Mono SC"
  ;                     :weight 'regular
  ;                     :height 128))

  ;; Set the variable pitch face
  (set-face-attribute 'variable-pitch nil
                      :font "Georgia"
                      :weight 'regular
                      :height 128))



(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (setq doom-modeline-icon t)
                (with-selected-frame frame
                  (efs/set-font-faces))))
  (efs/set-font-faces))




(provide 'init-font)
;;; init-font.el ends here

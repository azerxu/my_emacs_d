;;; Package: init-font.el --- Summary
;;; Commnentary: Font setting
;;; Code:

;; 使用Mac Font
;; (set-face-attribute 'default nil :font "MesloLGSDZ Nerd Font Mono" :height 120)

;; 使用Ubuntu Mono Font
(set-face-attribute 'default nil :font "UbuntuMono Nerd Font Mono" :height 144)

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "UbuntuMono Nerd Font Mono" :height 144)

;; Set the variable pitch face
;; (set-face-attribute 'variable-pitch nil :font "Cantarell" :height 192 :weight 'regular)
(set-face-attribute 'variable-pitch nil :font "Sarasa Mono SC" :height 128 :weight 'regular)


(provide 'init-font)
;;; init-font.el ends here

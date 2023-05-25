;;; Package: init-hydra.el --- Summary
;;; Commnentary:
;;; Code:

;;; Allows press a key as many times as you want
;;; to run a function without doing anything else
(use-package hydra
  :defer t)

;; (use-package mixed-pitch)

;; (defhydra hydra-variable-fonts (:pre (mixed-pitch-mode 0)
;;                                      :post (mixed-pitch-mode 1))
 
;; (defhydra hydra-variable-fonts 
;;   ("t" (set-face-attribute 'variable-pitch nil :family "Times New Roman" :height 120) "Times New Roman")
;;   ("c" (set-face-attribute 'variable-pitch nil :family "Courier New" :height 120 :weight 'noraml) "Courier New")
;;   ("h" (set-face-attribute 'variable-pitch nil :family "HanaMinB" :height 120 :weight 'noraml) "HanaMinB")
;;   ("u" (set-face-attribute 'variable-pitch nil :family "Unifont CSUR" :height 120 :weight 'noraml) "Unifont CSUR")
;;   ("v" (set-face-attribute 'variable-pitch nil :family "Verdana" :height 120 :weight 'noraml) "Verdana"))

(defun efs/load-theme (theme)
  "Enhance `load-theme' by first disabling enabled themes."
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme theme t))

(defhydra hydra-theme-switcher (:color red)
  "Switch theme:"
  ("1" (efs/load-theme 'doom-one) "doom-one")
  ("2" (efs/load-theme 'doom-one-light) "doom-one-light")
  ("m" (efs/load-theme 'doom-monokai-pro) "doom-monokai-pro")
  ("o" (efs/load-theme 'doom-old-hope) "doom-old-hope")
  ("t" (efs/load-theme 'tango-dark) "tango-dark")
  ("s" (efs/load-theme 'doom-snazzy) "doom-snazzy")
  ("v" (efs/load-theme 'modus-vivendi) "modus-vivendi")
  ("b" (efs/load-theme 'wombat) "wombat"))

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit 1))

(efs/leader-key-def
  "ts" '(hydra-text-scale/body :which-key "scale text"))


;;; All-in-one window management. Makes use of some custom functions,
;;; `ace-window' (for swapping), `windmove' (could probably be replaced
;;; by evil?) and `windresize'.
(defhydra efs/hydra-window (:hint nil)
  ;;  Movement           ^Split^         ^Switch^       ^Resize^
  ;; ----------------------------------------------------------------
  ;; _M-<left>_         _|_ vertical     _b_uffer      _<left>_    
  ;; _M-<right>_        _-_ horizontal   _f_ind        _<down>_    
  ;; _M-<up>_           _m_aximize       _s_wap        _<up>_      
  ;; _M-<down>_         _c_close         _[_backward   _<right>_   
  ;; _q-uit              _-_ horizontal   _]_forward    ^
  ;; ^                   ^                _K_ill        ^

  ;; Movement
  ("M-<left>" windmove-left)
  ("M-<right>" windmove-right)
  ("M-<down>" windmove-down)
  ("M-<up>" windmove-up)
  ("h" windmove-left)
  ("l" windmove-right)
  ("j" windmove-down)
  ("k" windmove-up)

  ;; resize window
  ("<" evil-window-decrease-width)
  (">" evil-window-increase-width)
  ("-" evil-window-decrease-height)
  ("+" evil-window-increase-height)
  ("=" balance-windows)
  
  ;; Split
  ("c" evil-window-delete)
  ("m" delete-other-windows)

  ;; Swith
  ("b" counsel-switch-buffer)
  ("f" counsel-find-file)
  ("P" projectile-find-file)
  ("s" evil-window-next)
  ("[" previous-buffer)
  ("]" next-buffer)
  ("x" nil :exit 1))

(general-define-key
 :states '(normal motion visual)
 :keymaps 'override
 :prefix "SPC"

 ;; hydra
 "h"  '(:ignore t :which-key "hydra")
 "hf" '(hydra-variable-fonts/body :which-key "switch font")
 "hs" '(hydra-text-scale/body :which-key "text scale")
 "ht" '(hydra-theme-switcher/body :which-key "theme switch")
 "hw" '(efs/hydra-window/body :which-key "window"))


(provide 'init-hydra)
;;; init-hydra.el ends here

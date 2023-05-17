;;; Package: init-git.el --- Summary
;;; Commentary: init git
;;; Code:

(use-package magit
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package forge)

;; Add a super-convenient global binding for magit-status since
(global-set-key (kbd "C-M-;") 'magit-status)

(dw/leader-key-def
 "g"    '(:ignore t :which-key "git")
 "gm"   'magit-commit
 "gs"   'magit-status
 "gd"   'magit-diff-unstaged
 "gc"   'magit-branch-or-checkout
 "gl"   '(:ignore t :which-key "log")
 "glc"  'magit-log-current
 "glf"  'magit-log-buffer-file
 "gb"   'magit-branch
 "gP"   'magit-push-current
 "gp"   'magit-push-branch
 "gf"   'magit-fetch
 "gF"   'magit-fetch-all
 "gr"   'magit-rebase)

(provide 'init-git)
;;; init-git ends here

;;; Package: init-git.el --- Summary
;;; Commentary: init git
;;; Code:

(use-package magit
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; (use-package forge)

;; Add a super-convenient global binding for magit-status since
(global-set-key (kbd "C-M-;") 'magit-status)

(efs/leader-key-def
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


;; (use-package git-gutter
;;   :hook (prog-mode . git-gutter-mode)
;;   :config
;;   (setq git-gutter:update-interval 0.1))

;; (use-package git-gutter-fringe
;;   :config
;;   (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
;;   (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
;;   (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))


(use-package diff-hl
  :hook
  (prog-mode . siren-turn-on-diff-hl-mode)
  (text-mode . siren-turn-on-diff-hl-mode)
  (dired-mode . diff-hl-dired-mode)
  (magit-pre-refresh . diff-hl-magit-pre-refresh)
  (magit-post-refresh . diff-hl-magit-post-refresh)
  (desktop-after-read . siren-diff-hl-set-render-mode)

  :custom
  (diff-hl-fringe-bmp-function 'siren-diff-hl-fringe-bmp-from-type)
  (diff-hl-fringe-face-function 'siren-diff-hl-fringe-face-from-type)
  (diff-hl-margin-symbols-alist
   '((insert . "┃")
     (delete . "┃")
     (change . "┃")
     (unknown . "?")
     (ignored . "i")))

  :preface
  (defun siren-turn-on-diff-hl-mode ()
    (turn-on-diff-hl-mode)
    (diff-hl-flydiff-mode 1))

  (defgroup siren-diff-hl nil
    "Siren specific tweaks to diff-hl."
    :group 'diff-hl)

  (defface siren-diff-hl-insert
    '((default :inherit diff-hl-insert))
    "Face used to highlight inserted lines."
    :group 'siren-diff-hl)

  (defface siren-diff-hl-delete
    '((default :inherit diff-hl-delete))
    "Face used to highlight deleted lines."
    :group 'siren-diff-hl)

  (defface siren-diff-hl-change
    '((default :inherit diff-hl-change))
    "Face used to highlight changed lines."
    :group 'siren-diff-hl)

  (defun siren-diff-hl-fringe-face-from-type (type _pos)
    (intern (format "siren-diff-hl-%s" type)))

  (defun siren-diff-hl-fringe-bmp-from-type(type _pos)
    (intern (format "siren-diff-hl-%s" type)))

  (defun siren-diff-hl-set-render-mode ()
    (diff-hl-margin-mode (if window-system -1 1)))

  :config
  (siren-diff-hl-set-render-mode)

  (define-fringe-bitmap 'siren-diff-hl-insert
    [#b00000011] nil nil '(center repeated))
  (define-fringe-bitmap 'siren-diff-hl-change
    [#b00000011] nil nil '(center repeated))
  (define-fringe-bitmap 'siren-diff-hl-delete
    [#b00000011] nil nil '(center repeated)))


(provide 'init-git)
;;; init-git ends here

;;; Package: init-org.el --- Summary
;;; Commnentary:
;;; Code:

  ;; (auto-fill-mode 0)

(defun efs/org-mode-setup ()
  (org-indent-mode 1)
  (variable-pitch-mode 1)
  (visual-line-mode 1)
  (setq evil-auto-indent nil))


(use-package org
  :hook (org-mode . efs/org-mode-setup)
  :config

  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)

  (setq org-agenda-files
	'("~/source/org/tips.org"
	  "~/source/org/habit.org"
	  "~/source/org/todo.org"))

  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-column 60)

  (setq org-todo-keywords
	'((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
	  (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANCLE(k@)")))

  (setq org-refile-targets
	'(("archive.org" :maxlevel . 1)
	  ("todo.org" :maxlevel . 1)))

  ;; Save Org Buffers after refiling!
  (advice-add 'org-refile :after 'org-save-all-org-buffers)

  (setq org-tag-alist
	'((:startgroup)
	; Put mutually exclusive tags here
	  (:endgroup)
	  ("@errand" . ?E)
	  ("@home" . ?H)
	  ("@work" . ?W)
	  ("agenda" . ?a)
	  ("planning" . ?p)
	  ("publish" . ?P)
	  ("batch" . ?b)
	  ("note" . ?n)
	  ("cancle" . ?C)
	  ("VIP" . ?I)			; Very Important
	  ("idea" . ?i)))

  ;; Configure custom agenda views
  (setq org-agenda-custom-commands
	'(("d" "Dashboard"
	   ((agenda "" ((org-deadline-warning-days 7)))
	    (todo "NEXT"
		  ((org-agenda-overriding-header "Next Tasks")))
	    (tags-todo "agenda/ACTIVE" ((org-agenda-overriding-header "Active Projects")))))

	  ("n" "Next Tasks"
	   ((todo "NEXT"
		  ((org-agenda-overriding-header "Next Tasks")))))

	  ("W" "Work Tasks" tags-todo "+work-email")

	  ;; Low-effort next actions
	  ("e" tags-todo "+TODO=\"NEXT\"+Effort<15&+Effort>0"
	   ((org-agenda-overriding-header "Low Effort Tasks")
	    (org-agenda-max-todos 20)
	    (org-agenda-files org-agenda-files)))

	  ("w" "Workflow Status"
	   ((todo "WAIT"
		  ((org-agenda-overriding-header "Waiting on External")
		   (org-agenda-files org-agenda-files)))
	    (todo "REVIEW"
		  ((org-agenda-overriding-header "In Review")
		   (org-agenda-files org-agenda-files)))
	    (todo "PLAN"
		  ((org-agenda-overriding-header "In Planning")
		   (org-agenda-todo-list-sublevels nil)
		   (org-agenda-files org-agenda-files)))
	    (todo "BACKLOG"
		  ((org-agenda-overriding-header "Project Backlog")
		   (org-agenda-todo-list-sublevels nil)
		   (org-agenda-files org-agenda-files)))
	    (todo "READY"
		  ((org-agenda-overriding-header "Ready for Work")
		   (org-agenda-files org-agenda-files)))
	    (todo "ACTIVE"
		  ((org-agenda-overriding-header "Active Projects")
		   (org-agenda-files org-agenda-files)))
	    (todo "COMPLETED"
		  ((org-agenda-overriding-header "Completed Projects")
		   (org-agenda-files org-agenda-files)))
	    (todo "CANCLE"
		  ((org-agenda-overriding-header "Cancelled Projects")
		   (org-agenda-files org-agenda-files)))))))

  (setq org-capture-templates
	`(("t" "Tasks / Projects")
	  ("tt" "Task" entry
	   (file "~/source/org/todo.org")
           "* TODO %?\n  %U\n" :empty-lines 1)
	  ("ti" "Tips" entry
	   (file "~/source/org/tips.org")
           "* %?\n  %U\n  %i" :empty-lines 1)


	  ("j" "Journal Entries")
	  ("jj" "Journal" entry
           (file+olp+datetree "~/source/org/Journal.org")
           "\n* %<%I:%M %p> - Journal :journal:\n\n%?\n\n"
           :clock-in :clock-resume
           :empty-lines 1)
	  ("jm" "Meeting" entry
           (file+olp+datetree "~/source/org/Journal.org")
           "* %<%I:%M %p> - %a :meetings:\n\n%?\n\n"
           :clock-in :clock-resume
           :empty-lines 1)

	  ("w" "Workflows")
	  ("we" "Checking Email" entry
	   (file+olp+datetree "~/source/org/Journal.org")
           "* Checking Email :email:\n\n%?" :clock-in :clock-resume :empty-lines 1)

	  ("m" "Metrics Capture")
	  ("mw" "Weight" table-line
	   (file+headline "~/source/org/Metrics.org" "Weight")
	   "| %U | %^{Weight} | %^{Notes} |" :kill-buffer t)))

  (define-key global-map (kbd "C-c t")
    (lambda () (interactive) (org-capture nil "tt")))

  (setq org-ellipsis " "
	org-hide-emphasis-markers t))


(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("" "" "" "" "" "" "" "" "◉" "●" "○")))


(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
	visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  ;; :defer t
  :hook (org-mode . efs/org-mode-visual-fill))

(with-eval-after-load 'org-faces
  (dolist (face '((org-level-1 . 1.2)
		  (org-level-2 . 1.1)
		  (org-level-3 . 1.05)
		  (org-level-4 . 1.0)
		  (org-level-5 . 1.0)
		  (org-level-6 . 1.0)
		  (org-level-7 . 1.0)
		  (org-level-8 . 1.0)))

    (set-face-attribute (car face) nil :font "Sarasa Mono SC" :weight 'regular :height (cdr face)))

  ;; Ensure that anything should be fixed-pitch in Org files appears
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil :inherit '(shadow fixed-pitch))
  ;; (set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))


(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)))

(setq org-confirm-babel-evaluate nil)

(push '("conf" . conf-unix) org-src-lang-modes)

(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))

(provide 'init-org)
;;; init-org.el ends here

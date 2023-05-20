;;; Package: init-present.el --- Summary
;;; Commnentary:
;;; Code:

(use-package visual-fill-column
  :custom
  (visual-fill-column-width 50)
  (visual-fill-column-center-text t))


(defun efs/org-present-start ()
  ;; Tweak font sizes
  (setq-local face-remapping-alist '((default (:height 1.5) variable-pitch)
                                     (header-line (:height 4.0) variable-pitch)
                                     (org-document-title (:height 1.75) org-document-title)
                                     (org-code (:height 1.55) org-code)
                                     (org-verbatim (:height 1.55) org-verbatim)
                                     (org-block (:height 1.25) org-block)
                                     (org-block-begin-line (:height 0.7) org-block)))

  ;; Set a black header line string to create black space at top
  (setq-local header-line-format " ")


  ;; Center the presentation and wrap lines
  (visual-fill-column-mode 1)
  (visual-line-mode 1))

(defun efs/org-present-end ()
  ;; Reset font customizations
  (setq-local face-remapping-alist '((default variable-pitch default)))

  ;; Stop centering the document
  ;; (visual-fill-column-mode 0)
  ;; (visual-line-mode 0)

  (setq-local header-line-format nil))

(defun efs/org-present-prepare-slide (buffer-name heading)
  ;; Show only top-level headlines
  (org-overview)

  ;; Unfold the current entry
  (org-show-entry)

  ;; Show only direct subheadings of the slide but don't expand them
  (org-show-children))


(use-package org-present)

;; Register hooks with org-present
(add-hook 'org-present-mode-hook 'efs/org-present-start)
(add-hook 'org-present-mode-quit-hook 'efs/org-present-end)
(add-hook 'org-present-after-navigate-functions 'efs/org-present-prepare-slide)


(provide 'init-present)
;;; init-present.el ends here

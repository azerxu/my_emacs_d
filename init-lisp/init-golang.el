;;; Package: init-golang.el --- Summary
;;; Commnentary:
;;; Code:


;; ************************************************************
;; golang setting
;; ************************************************************
(setenv "GOPATH" "/home/azer/source/gopath")
(setenv "GOROOT" "/home/azer/source/go")

(defun go-run-buffer()
  (interactive)
  (shell-command (concat "/home/azer/source/go/bin/go run " (buffer-name))))


(use-package go-mode
  :hook ((go-mode . lsp-deferred))
  :bind (:map go-mode-map
              ("C-c C-c" . go-run-buffer)
              ("C-c C-j" . godef-jump)
			  ("C-c C-d" . godoc)
              ("<f6>" . gofmt))
  :config
  ;; auto gofmt
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'before-save-hook 'go-remove-unused-imports)
  (require 'lsp-go)
  (setq lsp-go-analyses
        '((fieldalignment . t)
          (nilness        . t)
          (unusedwrite    . t)
          (unusedparam    . t)))
  (add-to-list 'exec-path "/home/azer/source/gopath/bin")
  (add-to-list 'exec-path "/home/azer/source/go/bin")
  (setq gofmt-command "goimports")
  (setq tab-width 4)
  (setq indent-tabs-mode 1))


;; install init-go
;; (use-package go-autocomplete)
;; (require 'go-autocomplete)


;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/ac-dict")
;; (add-to-list 'ac-modes 'go-mode)
;; (ac-config-default)

;; go-guru setting
;; (require 'go-guru)
;; (add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)

;; (add-hook 'go-mode-hook 'go-eldoc-setup)

;; (add-hook 'go-mode-hook (lambda ()
;;                           (set (make-local-variable 'company-backends) '(company-go))
;;                           (company-mode)))

;; (add-hook
;;  'go-mode-hook
;;  (lambda ()
;;    ;; Outline mode
;;    (make-local-variable 'outline-regexp)
;;    (setq outline-regexp "//\\.\\|//[^\r\n\f][^\r\n\f]\\|pack\\|func\\|impo\\|cons\\|var.\\|type\\|\t\t*....")
;;    (local-set-key (kbd "C-c C-g") 'go-goto-imports)

;;    ;;; (load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")

;;    ;; Use goimports instead of go-fmt
;;    (setq gofmt-command "goimports")

;;    ;; Customize compile command to run go build
;;    (if (not (string-match "go" compile-command))
;;        (set (make-local-variable 'compile-command)
;;             "go generate && go build -v && go test -v && go vet"))

;;    ;; auto gofmt
;;    (add-hook 'before-save-hook 'gofmt-before-save)
;;    ;; (add-hook 'before-save-hook 'go-remove-unused-imports)
;;    (setq tab-width 4)
;;    (setq indent-tabs-mode 1)))

;; godef setting
; (defun my-go-mode-hook ()
;   ; Call Gofmt before saving
;   (add-hook 'before-save-hook 'gofmt-before-save)
;   ; Godef jump key binding
;   (local-set-key (kbd "M-.") 'godef-jump))
;  (add-hook 'go-mode-hook 'my-go-mode-hook)

(provide 'init-golang)
;;; init-golang.el ends here

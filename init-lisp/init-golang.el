;;; Package: init-golang.el --- Summary
;;; Commnentary:
;;; Code:


;; ************************************************************
;; golang setting
;; ************************************************************
(setenv "GOPATH" "/home/azer/source/gopath")
(setenv "GOROOT" "/home/azer/source/go")
(setq exec-path (cons "/home/azer/source/go/bin" exec-path))
(setq exec-path (cons "/home/azer/source/gopath/bin" exec-path))
(add-to-list 'exec-path "/home/azer/source/gopath/bin")

;; install init-go
(require 'go-autocomplete)

(use-package go-autocomple)


(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/ac-dict")
(add-to-list 'ac-modes 'go-mode)
(ac-config-default)

;; go-guru setting
(require 'go-guru)
(add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)

(add-hook 'go-mode-hook 'go-eldoc-setup)

(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

(defun go-run-buffer()
 (interactive)
 (shell-command (concat "/home/azer/source/go/bin/go run " (buffer-name))))


(add-hook
 'go-mode-hook
 (lambda ()
   ;; Outline mode
   (make-local-variable 'outline-regexp)
   (setq outline-regexp "//\\.\\|//[^\r\n\f][^\r\n\f]\\|pack\\|func\\|impo\\|cons\\|var.\\|type\\|\t\t*....")
   (local-set-key (kbd "C-c C-g") 'go-goto-imports)

   ;;; (load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")

   ;; Use goimports instead of go-fmt
   (setq gofmt-command "goimports")

   ;; Customize compile command to run go build
   (if (not (string-match "go" compile-command))
       (set (make-local-variable 'compile-command)
            "go generate && go build -v && go test -v && go vet"))

   ;; auto gofmt
   (add-hook 'before-save-hook 'gofmt-before-save)
   ;; (add-hook 'before-save-hook 'go-remove-unused-imports)
   (setq tab-width 4)
   (setq indent-tabs-mode 1)))


(eval-after-load 'go-mode
  '(define-key go-mode-map (kbd "C-c C-c") 'go-run-buffer))

(eval-after-load 'go-mode
  '(define-key go-mode-map (kbd "C-c C-d") 'godoc))


;; godef setting
(defun my-go-mode-hook ()
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)

(provide 'init-golang)
;;; init-golang.el ends here

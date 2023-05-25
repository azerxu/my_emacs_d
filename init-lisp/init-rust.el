;;; Package: init-rust.el --- Summary
;;; Commnentary:
;;; Code:

(use-package rustic
  :bind (:map rustic-mode-map
              ("<f6>" . rustic-format-buffer))
  :config
  (require 'lsp-rust)
  (add-to-list 'exec-path "/home/azer/.cargo/bin")
  (setq lsp-rust-analyzer-completion-add-call-parenthesis nil))



(provide 'init-rust)
;;; init-rust.el ends here

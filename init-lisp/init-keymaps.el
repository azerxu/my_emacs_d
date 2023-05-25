;;; Package: init-keymaps.el --- Summary
;;; Commnentary:
;;; Code:

(general-define-key
 :states '(normal motion visual)
 :keymaps 'override
 :prefix "SPC"

 ;; Top level functions
 "/" '(projectile-ripgrep :which-key "ripgrep")
 "q" '(save-buffers-kill-terminal :which-key "quit emacs")
 "r" '(jump-to-register :which-key "register")

 ;; org-mode
 "o"  '(:ignore t :which-key "org")
 "oa" '(org-agenda :which-key "org-agenda")
 "oc" '(org-capture :which-key "org-capture")
 
 ;; browser and buffer
 "b"  '(nil :which-key "browser/buffer")
 ;; browser
 "bf" '(browse-url-firefox :which-key "firefox")
 "bc" '(browse-url-chrome :which-key "google-chrome")

 "bb" '(counsel-switch-buffer :which-key "switch buffer")
 "bd" '(evil-delete-buffer :which-key "delete buffer")
 "be" '(eval-buffer :which-key "eval buffer")
 "bn" '(evil-buffer-new :which-key "new buffer")
 "bo" '(delete-other-windows :which-key "close other window")
 "br" '(revert-buffer :which-key "revert buffer")
 "bw" '(evil-window-next :which-key "switch next window")

 ;; Files
 "f"  '(nil :which-key "files")
 "fb" '(counsel-bookmark :which-key "bookmarks")
 "ff" '(counsel-find-file :which-key "find-file")
 "fn" '(evil-buffer-new :which-key "new file")
 "fr" '(counsel-recentf :which-key "recent files")
 "fR" '(rename-file :which-key "rename file")
 "fs" '(save-buffer :which-key "save buffer")
 "fS" '(evil-write-all :which-key "save all buffer")
 
 ;; Window
 "w"  '(:ignore t :which-key "window")
 "w|" '(split-window-horizontally :which-key "split window horizon")
 "w-" '(split-window-vertically :which-key "split window vertically")
 "wl" '(evil-window-right :which-key "window right")
 "wh" '(evil-window-left :which-key "window left")
 "wj" '(evil-window-down :which-key "window down")
 "wk" '(evil-window-up :which-key "window up")
 "wz" '(zoom-window-zoom :which-key "zoom window")

 ;; Toggles
 "t"  '(:ignore t :which-key "toggles")
 "tt" '(counsel-load-theme :which-key "choose theme")
 "tl" '(toggle-truncate-lines :which-key "truncate line")
 "tc" '(visual-fill-column-mode :which-key "fill column")
 "tR" '(read-only-mode :which-key "read only")
 
 ;; Diagnos
 "x"  '(:ignore t :which-key "diagnose")
 "xx" '(lsp-treemacs-errors-list :which-key "erros"))

(provide 'init-keymaps)
;;; init-keymaps.el ends here

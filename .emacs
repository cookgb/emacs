(setq load-path (append (list "~cookgb/public/emacs") load-path))

(load "my-font-lock")
(load "keymap")
(load "comment")
(load "modes")

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'latex-mode-hook 'turn-on-reftex)

(global-font-lock-mode t)
 
(setq tex-dvi-view-command "xdvi")
(setq tex-dvi-print-command "dviprint")
 
;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

;; Eval-expression
(put 'eval-expression 'disabled nil)

;; Disable new Menu bar
(tool-bar-mode nil)     

;;(setq font-lock-display-type "grayscale")

(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(c-basic-offset 2)
 '(c-offsets-alist nil)
 '(f90-do-indent 2)
 '(f90-if-indent 2)
 '(f90-type-indent 2)
 '(fortran-blink-matching-if t)
 '(fortran-continuation-string ".")
 '(fortran-do-indent 2)
 '(fortran-if-indent 2)
 '(fortran-structure-indent 2)
 '(scroll-bar-mode (quote right)))
(custom-set-faces)

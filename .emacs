(setq load-path (append (list "~cookgb/public/emacs") load-path))
(load "my-font-lock")
(load "keymap")
(load "comment")
(load "modes")

;; Enable wheelmouse support by default
(cond (window-system
       (mwheel-install)
))

;; Turn on font-lock mode for Emacs
(defvar running-xemacs (string-match "XEmacs\\|Lucid" emacs-version))
(cond ((not running-xemacs)
       (global-font-lock-mode t)
))

;; have reftex added when in LaTeX mode
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'latex-mode-hook 'turn-on-reftex)
(setq reftex-ref-macro-prompt nil)
                                                                                
(setq tex-dvi-view-command "xdvi")
(setq tex-dvi-print-command "dviprint")

;; Old commands that I don't know if we need any more...
;;
;;(global-set-key [delete] 'delete-char)
;;(global-set-key [kp-delete] 'delete-char)
;;
;; Eval-expression
;;(put 'eval-expression 'disabled nil)
;;
;;(setq font-lock-display-type "grayscale")
;;
;; Stop at the end of the file, not just add lines
;;(setq next-line-add-newlines nil)


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
 '(require-final-newline t)
 '(scroll-bar-mode (quote right))
 '(tool-bar-mode nil nil (tool-bar)))
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 )

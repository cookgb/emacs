;; $Id: modes.el,v 1.2 2002-07-16 16:15:27 cookgb Exp $
;;-----------------------------------------------------------------------------

;; Load cc-mode instead of c-mode & cplus-md
;; Does a better job of auto-formatting
(autoload 'c++-mode "cc-mode" "C++ Editing Mode" t)
(autoload 'c-mode   "cc-mode" "C Editing Mode" t)
(autoload 'f90-mode "f90" "FORTRAN-90 Editing Mode" t)

;; Load html mode
(autoload 'html-mode "html-mode" "HTML Editing Mode" t)

;; The following tells emacs that --
;;          .F files are to be edited in fortran mode.
;;          .C.m4 or .h.m4 files are to be edited in C++ mode.
;;          .pl, .ph, or .pm files are to be edited in perl mode.
;;          .dtx, .cls, .sty, or .fd files are to be edited in latex mode.
;;          .html files are to be edited in html mode.
;;          Makefile or makefile files are to be edited in makefile mode.
(setq auto-mode-alist (append (list
			       (cons "\\.F$" 'fortran-mode)
			       (cons "\\.f$" 'f90-mode)
			       (cons "\\.f90$" 'f90-mode)
			       (cons "\\.f9$" 'f90-mode)
			       (cons "\\.C.m4$" 'c++-mode)
			       (cons "\\.h.m4$" 'c++-mode)
                               (cons "\\.pl$" 'perl-mode)
                               (cons "\\.ph$" 'perl-mode)
                               (cons "\\.pm$" 'perl-mode)
                               (cons "\\.dtx$" 'latex-mode)
                               (cons "\\.cls$" 'latex-mode)
                               (cons "\\.sty$" 'latex-mode)
                               (cons "\\.fd$" 'latex-mode)
                               (cons "\\.html$" 'html-mode)
			       (cons "/?\\(m\\|M\\)akefile$" 'makefile-mode))
			      auto-mode-alist))

;; Set up hooks
(setq fortran-mode-hook '(lambda ()
			   (define-key fortran-mode-map "\C-c:"
			     (lambda (b e)
			       "Uncomments region."
			       (interactive "*r")
			       (general-comment-region b e "c$$$" t)))
			   (define-key fortran-mode-map "\C-c;"
			     (lambda (b e)
			       "Comments region."
			       (interactive "*r")
			       (general-comment-region b e "c$$$" nil)))))

(setq f90-mode-hook '(lambda ()
		       (define-key f90-mode-map "\C-c:"
			 (lambda (b e)
			   "Uncomments region."
			   (interactive "*r")
			   (general-comment-region b e "!$$$" t)))
		       (define-key f90-mode-map "\C-c;"
			 (lambda (b e)
			   "Comments region."
			   (interactive "*r")
			   (general-comment-region b e "!$$$" nil)))
		       ;; Add f90-font-lock-keywords-5 to defaults list
		       ;; This adds better highlighing
		       (setq font-lock-defaults 
			     '((f90-font-lock-keywords f90-font-lock-keywords-1
						       f90-font-lock-keywords-2
						       f90-font-lock-keywords-3
						       f90-font-lock-keywords-4
						       f90-font-lock-keywords-5)
			       nil t))))

(setq c-mode-common-hook '(lambda ()
			    (turn-on-font-lock)))

(setq c-mode-hook 'nil)

(setq c++-mode-hook '(lambda ()
		       (define-key c++-mode-map "\C-c:"
			 (lambda (b e)
			   "Uncomments region."
			   (interactive "*r")
			   (general-comment-region b e "//##" t)))
		       (define-key c++-mode-map "\C-c;"
			 (lambda (b e)
			   "Comments region."
			   (interactive "*r")
			   (general-comment-region b e "//##" nil)))))

(setq tex-mode-hook '(lambda ()
		       (define-key tex-mode-map "\C-c:"
			 (lambda (b e)
			   "Uncomments region."
			   (interactive "*r")
			   (general-comment-region b e "%###" t)))
		       (define-key tex-mode-map "\C-c;"
			 (lambda (b e)
			   "Comments region."
			   (interactive "*r")
			   (general-comment-region b e "%###" nil)))))

;;;; Seems there is no latex-mode-map, just tex-mode-map...
;;(setq latex-mode-hook '(lambda ()
;;			 (define-key latex-mode-map "\C-c:"
;;			   (lambda (b e)
;;			     "Uncomments region."
;;			     (interactive "*r")
;;			     (general-comment-region b e "%###" t)))
;;			 (define-key latex-mode-map "\C-c;"
;;			   (lambda (b e)
;;			     "Uncomments region."
;;			     (interactive "*r")
;;			     (general-comment-region b e "%###" nil)))))

(setq perl-mode-hook '(lambda ()
			(define-key perl-mode-map "\C-c:"
			  (lambda (b e)
			    "Uncomments region."
			    (interactive "*r")
			    (general-comment-region b e "#%%%" t)))
			(define-key perl-mode-map "\C-c;"
			  (lambda (b e)
			    "Comments region."
			    (interactive "*r")
			    (general-comment-region b e "#%%%" nil)))))

(setq makefile-mode-hook '(lambda ()
			    (define-key makefile-mode-map "\C-c:"
			      (lambda (b e)
				"Uncomments region."
				(interactive "*r")
				(general-comment-region b e "#%%%" t)))
			    (define-key makefile-mode-map "\C-c;"
			      (lambda (b e)
				"Comments region."
				(interactive "*r")
				(general-comment-region b e "#%%%" nil)))))

(setq emacs-lisp-mode-hook '(lambda ()
			      (define-key emacs-lisp-mode-map "\C-c:"
				(lambda (b e)
				  "Uncomments region."
				  (interactive "*r")
				  (general-comment-region b e ";;" t)))
			      (define-key emacs-lisp-mode-map "\C-c;"
				(lambda (b e)
				  "Comments region."
				  (interactive "*r")
				  (general-comment-region b e ";;" nil)))))



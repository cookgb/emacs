;; $Id: modes.el,v 1.4 2002-07-18 19:12:10 cookgb Exp $
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
			   (setq fortran-comment-region "c-:")
			   (define-key fortran-mode-map "\C-c:"
			     (lambda (b e)
			       "Uncomments region."
			       (interactive "*r")
			       (fortran-comment-region b e 1)))))

(setq f90-mode-hook '(lambda ()
		       (setq f90-comment-region "!-:")
		       (setq general-comment-region "!-:")
		       (define-key f90-mode-map "\C-c;" 
			 'general-comment-region)
		       (define-key f90-mode-map "\C-c:" 
			 'general-uncomment-region)
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

(setq c-mode-hook '(lambda ()
		       (setq comment-padding " ")
		       (define-key c-mode-map "\C-c;" 'comment-region)
		       (define-key c-mode-map "\C-c:" 'uncomment-region)))

(setq c++-mode-hook '(lambda ()
		       (setq comment-start "//")
		       (setq comment-padding "-:")
		       (setq general-comment-region "//-:")
		       (define-key c++-mode-map "\C-c;" 
			 'general-comment-region)
		       (define-key c++-mode-map "\C-c:" 
			 'general-uncomment-region)))

(setq tex-mode-hook '(lambda ()
		       (setq general-comment-region "%-:")
		       (define-key tex-mode-map "\C-c;" 
			 'general-comment-region)
		       (define-key tex-mode-map "\C-c:" 
			 'general-uncomment-region)))

(setq perl-mode-hook '(lambda ()
			(setq general-comment-region "#-:")
			(define-key perl-mode-map "\C-c;" 
			  'general-comment-region)
			(define-key perl-mode-map "\C-c:" 
			  'general-uncomment-region)))

(setq makefile-mode-hook '(lambda ()
			    (setq general-comment-region "#-:")
			    (define-key makefile-mode-map "\C-c;" 
			      'general-comment-region)
			    (define-key makefile-mode-map "\C-c:" 
			      'general-uncomment-region)))

(setq emacs-lisp-mode-hook '(lambda ()
		       (setq comment-start ";;")
		       (setq comment-padding "-:")
			      (setq general-comment-region ";;-:")
			      (define-key emacs-lisp-mode-map "\C-c;" 
				'general-comment-region)
			      (define-key emacs-lisp-mode-map "\C-c:" 
				'general-uncomment-region)))

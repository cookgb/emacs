;; $Id: my-f90-font-lock.el,v 1.1 2001-08-23 19:53:55 cookgb Exp $
;;----------------------------------------------------------------
(defvar my-f90-font-lock-keywords-default
  (if (string-match "XEmacs" emacs-version)
      (list				; XEmacs  (NOTE: This XEMacs version is not tested!!!!)
       ;; Variable declarations (avoid the real function call)
       '("^[ \t0-9]*\\(\\(real\\|integer\\|c\\(haracter\\|omplex\\)\\|logical\\)\\(\\*[0-9]+\\)?\\|double[ \t]+precision\\|type[ \t]*(\\sw+)\\)"
	 1 font-lock-type-face)
       '("^[ \t0-9]*\\(\\(real\\|integer\\|c\\(haracter\\|omplex\\)\\|logical\\)\\(\\*[0-9]+\\)?\\|double[ \t]+precision\\|type[ \t]*(\\sw+)\\)\\(.*::\\|[ \t]*(.*)\\)?\\(.*\\)"
	 6 font-lock-doc-string-face)
       ;; do and forall constructs
       '("\\<\\(end[ \t]*do\\)\\>"
	 1 font-lock-loop-face)
       '("\\<\\(end[ \t]*do\\)\\>\\([ \t]+\\(\\sw+\\)\\)"
	 3 font-lock-doc-string-face)
       '("^[ \t0-9]*\\(\\(\\sw+\\)[ \t]*:[ \t]*\\)\\(\\(do\\([ \t]*while\\)?\\)\\)\\>"
	 2 font-lock-doc-string-face)
       '("^[ \t0-9]*\\(\\(\\sw+\\)[ \t]*:[ \t]*\\)?\\(\\(do\\([ \t]*while\\)?\\)\\)\\>"
	 3 font-lock-loop-face)
       '("\\<\\(forall\\)[ \t]*("
	 1 font-lock-loop-face)
       '("\\<\\(end[ \t]*forall\\)\\>\\([ \t]+\\(\\sw+\\)\\)?"
	 1 font-lock-loop-face)
       '("\\<\\(end[ \t]*forall\\)\\>\\([ \t]+\\(\\sw+\\)\\)?"
	 3 font-lock-reference-face)
       ;; if and select constructs
       '("\\<\\(end[ \t]*\\(if\\|select\\)\\)\\>"
	 1 font-lock-conditional-face)
       '("\\<\\(end[ \t]*\\(if\\|select\\)\\)\\>\\([ \t]+\\(\\sw+\\)\\)"
	 3 font-lock-doc-string-face)
       '("^[ \t0-9]*\\(\\(\\sw+\\)[ \t]*:[ \t]*\\)?if\\([ \t]*(.*)[ \t]*\\)\\<\\(then\\)\\>"
	 4 font-lock-conditional-face)
       '("\\<\\(else\\)\\([ \t]*if\\)?"
	 1 font-lock-conditional-face)
       '("\\<\\(else\\)[ \t]*\\(if\\)[ \t]*(.*)[ \t]*\\(then\\)\\>"
	 2 font-lock-conditional-face)
       '("\\<\\(else\\)[ \t]*\\(if\\)[ \t]*(.*)[ \t]*\\(then\\)\\>"
	 3 font-lock-conditional-face)
       '("^[ \t0-9]*\\(\\(\\sw+\\)[ \t]*:[ \t]*\\)\\(if\\|select[ \t]*case\\)\\>"
	 2 font-lock-doc-string-face)
       '("^[ \t0-9]*\\(\\(\\sw+\\)[ \t]*:[ \t]*\\)?\\(if\\|select[ \t]*case\\)\\>"
	 3 font-lock-conditional-face)
      ;; implicit declaration
       '("\\<\\(implicit\\)[ \t]*\\(rea\\(l[ \t]*\\*[ \t]*[0-9]+\\|l\\)\\|integer\\|c\\(haracter\\|omplex\\)\\|logical\\|double[ \t]+precision\\|type[ \t]*(\\sw+)\\|none\\)\\>"
	 1 font-lock-keyword-face)
       '("\\<\\(implicit\\)[ \t]*\\(rea\\(l[ \t]*\\*[ \t]*[0-9]+\\|l\\)\\|integer\\|c\\(haracter\\|omplex\\)\\|logical\\|double[ \t]+precision\\|type[ \t]*(\\sw+)\\|none\\)\\>"
	 2 font-lock-type-face)
       '("\\<\\(namelist\\|common\\)[ \t]*\/\\(\\sw+\\)?\/"
	 1 font-lock-keyword-face)
       '("\\<\\(namelist\\|common\\)[ \t]*\/\\(\\sw+\\)\/"
	 2 font-lock-doc-string-face nil t)
       '("\\<\\(where\\)[ \t]*(" (1 font-lock-conditional-face))
       '("\\<\\(forall\\)[ \t]*(" (1 font-lock-loop-face))
       '("\\<\\(e\\(lse\\|nd[ \t]*\\)where\\)\\>"
	 1 font-lock-conditional-face)
       "\\<\\(continue\\|format\\|include\\|stop\\|return\\)\\>"
       '("\\<\\(exit\\|cycle\\)\\>" 
	 1 font-lock-loop-face)
       '("\\<\\(exit\\|cycle\\)[ \t]*\\(\\sw+\\)2\\>" 
	 2 font-lock-doc-string-face)
       '("\\<\\(case\\)[ \t]*\\(default\\|(\\)"
	 1 font-lock-conditional-face)
       '("\\<\\(do\\|go *to\\)\\>[ \t]*\\([0-9]+\\)"
	 1 font-lock-loop-face)
       '("\\<\\(do\\|go *to\\)\\>[ \t]*\\([0-9]+\\)"
	 2 font-lock-doc-string-face)
       '("^[ \t]*\\([0-9]+\\)" 1 font-lock-doc-string-face t)
       '("\\<\\(end[ \t]*\\(program\\|module\\|function\\|subroutine\\|type\\)\\)\\>"
	 1 font-lock-keyword-face)
       '("\\<\\(end[ \t]*\\(program\\|module\\|function\\|subroutine\\|type\\)\\)\\>[ \t]*\\(\\sw+\\)"
	 3 font-lock-function-name-face)
       '("\\<\\(program\\|call\\|module\\|subroutine\\|function\\|use\\)\\>"
	 1 font-lock-keyword-face)
       '("\\<\\(program\\|call\\|module\\|subroutine\\|function\\|use\\)\\>[ \t]*\\(\\sw+\\)"
	 2 font-lock-function-name-face nil t)
       ;; Special highlighting of "module procedure foo-list"
       '("\\<\\(module[ \t]*procedure\\)\\>" 1 font-lock-keyword-face t)
       ;; Highlight definition of new type
       '("\\<\\(type\\)[ \t]*\\(,.*::[ \t]*\\|[ \t]+\\)\\(\\sw+\\)"
	 1 font-lock-keyword-face)
       '("\\<\\(type\\)[ \t]*\\(,.*::[ \t]*\\|[ \t]+\\)\\(\\sw+\\)"
	 3 font-lock-function-name-face)
       "\\<\\(\\(end[ \t]*\\)?\\(interface\\|block[ \t]*data\\)\\|contains\\)\\>")
    (list				; Emacs
       ;; Variable declarations (avoid the real function call)
       '("^[ \t0-9]*\\(\\(real\\|integer\\|c\\(haracter\\|omplex\\)\\|logical\\)\\(\\*[0-9]+\\)?\\|double[ \t]+precision\\|type[ \t]*(\\sw+)\\)\\(.*::\\|[ \t]*(.*)\\)?\\(.*\\)"
	 (1 font-lock-type-face) (6 font-lock-variable-name-face))
       ;; do and forall constructs
       '("\\<\\(end[ \t]*do\\)\\>\\([ \t]+\\(\\sw+\\)\\)?"
	 (1 font-lock-loop-face) (3 font-lock-reference-face nil t))
       '("^[ \t0-9]*\\(\\(\\sw+\\)[ \t]*:[ \t]*\\)?\\(\\(do\\([ \t]*while\\)?\\)\\)\\>"
	 (2 font-lock-reference-face nil t) (3 font-lock-loop-face))
       '("\\<\\(forall\\)[ \t]*(" (1 font-lock-loop-face))
       '("\\<\\(end[ \t]*forall\\)\\>\\([ \t]+\\(\\sw+\\)\\)?"
	 (1 font-lock-loop-face) (3 font-lock-reference-face nil t))
       ;; if and select constructs
       '("\\<\\(end[ \t]*\\(if\\|select\\)\\)\\>\\([ \t]+\\(\\sw+\\)\\)?"
	 (1 font-lock-conditional-face) (3 font-lock-reference-face nil t))
       '("^[ \t0-9]*\\(\\(\\sw+\\)[ \t]*:[ \t]*\\)?\\(if\\)\\(\\([ \t]*(.*)[ \t]*\\)\\<\\(then\\)\\)?\\>"
	 (2 font-lock-reference-face nil t) (3 font-lock-conditional-face) (6 font-lock-conditional-face nil t))
       '("\\<\\(else\\)\\([ \t]*\\(if\\)[ \t]*(.*)[ \t]*\\(then\\)\\)?\\>"
	 (1 font-lock-conditional-face) (3 font-lock-conditional-face nil t) (4 font-lock-conditional-face nil t))
       '("^[ \t0-9]*\\(\\(\\sw+\\)[ \t]*:[ \t]*\\)?\\(select[ \t]*case\\)\\>"
	 (2 font-lock-reference-face nil t) (3 font-lock-conditional-face))
       ;; implicit declaration
       '("\\<\\(implicit\\)[ \t]*\\(rea\\(l[ \t]*\\*[ \t]*[0-9]+\\|l\\)\\|integer\\|c\\(haracter\\|omplex\\)\\|logical\\|double[ \t]+precision\\|type[ \t]*(\\sw+)\\|none\\)\\>" (1 font-lock-keyword-face) (2 font-lock-type-face))
       '("\\<\\(namelist\\|common\\)[ \t]*\/\\(\\sw+\\)?\/" (1 font-lock-keyword-face) (2 font-lock-reference-face nil t))
       '("\\<\\(where\\)[ \t]*(" (1 font-lock-conditional-face))
       '("\\<\\(e\\(lse\\|nd[ \t]*\\)where\\)\\>" (1 font-lock-conditional-face))
       "\\<\\(continue\\|format\\|include\\|stop\\|return\\)\\>"
       '("\\<\\(exit\\|cycle\\)[ \t]*\\(\\sw+\\)?\\>" 
	 (1 font-lock-loop-face) (2 font-lock-reference-face nil t))
       '("\\<\\(case\\)[ \t]*\\(default\\|(\\)" (1 font-lock-conditional-face))
       '("\\<\\(do\\|go *to\\)\\>[ \t]*\\([0-9]+\\)"
	 (1 font-lock-loop-face) (2 font-lock-reference-face))
       '("^[ \t]*\\([0-9]+\\)" (1 font-lock-reference-face t))
     '("\\<\\(end[ \t]*\\(program\\|module\\|function\\|subroutine\\|type\\)\\)\\>[ \t]*\\(\\sw+\\)?"
       (1 font-lock-keyword-face) (3 font-lock-function-name-face nil t))
     '("\\<\\(program\\|call\\|module\\|subroutine\\|function\\|use\\)\\>[ \t]*\\(\\sw+\\)?"
       (1 font-lock-keyword-face) (2 font-lock-function-name-face nil t))
     ;; Special highlighting of "module procedure foo-list"
     '("\\<\\(module[ \t]*procedure\\)\\>" (1 font-lock-keyword-face t))
     ;; Highlight definition of new type
     '("\\<\\(type\\)[ \t]*\\(,.*::[ \t]*\\|[ \t]+\\)\\(\\sw+\\)"
       (1 font-lock-keyword-face) (3 font-lock-function-name-face))
     "\\<\\(\\(end[ \t]*\\)?\\(interface\\|block[ \t]*data\\)\\|contains\\)\\>"))
  "This does fairly good highlighting of FORTRAN 90.")


(defvar my-f90-font-lock-keywords-default-2
  (append my-f90-font-lock-keywords-default
	  (list
	   f90-keywords-level-3-re
	   f90-operators-re
	   (if (string-match "XEmacs" emacs-version)
	       (append (list f90-procedures-re) '(1 font-lock-keyword-face))
	     (list f90-procedures-re '(1 font-lock-keyword-face)))
	   "\\<real\\>"			; Avoid overwriting real defs.
	   ))
  "Highlights all F90 keywords and intrinsic procedures.")

;;(defvar my-f90-font-lock-keywords
(defvar f90-font-lock-keywords-5
  (append my-f90-font-lock-keywords-default-2
	  (list f90-hpf-keywords-re))
  "Highlights all F90 and HPF keywords.")

;; $Id: my-font-lock.el,v 1.1.1.1 2001-07-02 18:35:13 cookgb Exp $
;;----------------------------------------------------------------

;; Define 2 new font-lock variables for enhanced F90 coloring.
(defvar font-lock-loop-face 'font-lock-loop-face "Face to use for loops.")
(defvar font-lock-conditional-face 'font-lock-conditional-face "Face to use for conditional statements.")

(defface font-lock-comment-face
  '((((class grayscale) (background light))
     (:foreground "Gray50" :italic t))
    (((class grayscale) (background dark))
     (:foreground "LightGray" :italic t))
    (((class color) (background light)) (:foreground "Sienna"))
    (((class color) (background dark)) (:foreground "Moccasin"))
    (t (:italic t)))
  "Font Lock mode face used to highlight comments."
  :group 'font-lock-highlighting-faces)

(defface font-lock-string-face
  '((((class grayscale) (background light)) (:foreground "Gray50" :italic t))
    (((class grayscale) (background dark)) (:foreground "LightGray" :italic t))
    (((class color) (background light)) (:foreground "Coral"))
    (((class color) (background dark)) (:foreground "Goldenrod"))
    (t (:italic t)))
  "Font Lock mode face used to highlight strings."
  :group 'font-lock-highlighting-faces)

(defface font-lock-keyword-face
  '((((class grayscale) (background light)) (:foreground "DimGray" :bold t))
    (((class grayscale) (background dark)) (:foreground "LightGray" :bold t))
    (((class color) (background light)) (:foreground "SlateBlue"))
    (((class color) (background dark)) (:foreground "Cyan"))
    (t (:bold t)))
  "Font Lock mode face used to highlight keywords."
  :group 'font-lock-highlighting-faces)

(defface font-lock-builtin-face
  '((((class grayscale) (background light)) (:foreground "LightGray" :bold t))
    (((class grayscale) (background dark)) (:foreground "DimGray" :bold t))
    (((class color) (background light)) (:foreground "Orchid"))
    (((class color) (background dark)) (:foreground "LightSteelBlue"))
    (t (:bold t)))
  "Font Lock mode face used to highlight builtins."
  :group 'font-lock-highlighting-faces)

(defface font-lock-function-name-face
  '((((class color) (background light)) (:foreground "Magenta"))
    (((class color) (background dark)) (:foreground "Tomato" :bold t))
    (t (:bold t :underline t)))
  "Font Lock mode face used to highlight function names."
  :group 'font-lock-highlighting-faces)

(defface font-lock-variable-name-face
  '((((class grayscale) (background light)) (:foreground nil))
    (((class grayscale) (background dark)) (:foreground nil))
    (((class color) (background light)) (:foreground nil))
    (((class color) (background dark)) (:foreground nil))
    (t ()))
  "Font Lock mode face used to highlight variable names."
  :group 'font-lock-highlighting-faces)

(defface font-lock-type-face
  '((((class grayscale) (background light))
     (:foreground "Gray50" :underline t))
    (((class grayscale) (background dark))
     (:foreground "LightGray" :underline t))
    (((class color) (background light)) (:foreground "MediumOrchid"))
    (((class color) (background dark)) (:foreground "Plum"))
    (t (:underline t)))
  "Font Lock mode face used to highlight types."
  :group 'font-lock-highlighting-faces)

(defface font-lock-reference-face
  '((((class grayscale) (background light)) (:foreground "Gray70"))
    (((class grayscale) (background dark)) (:foreground "Gray60"))
    (((class color) (background light)) (:foreground "DarkTurquoise"))
    (((class color) (background dark)) (:foreground "Yellow"))
    (t (:underline t)))
  "Font Lock mode face used to highlight references."
  :group 'font-lock-highlighting-faces)

(defface font-lock-warning-face
  '((((class color) (background light)) (:foreground "Red" :bold t))
    (((class color) (background dark)) (:foreground "Pink" :bold t))
    (t (:inverse-video t :bold t)))
  "Font Lock mode face used to highlight warnings."
  :group 'font-lock-highlighting-faces)

;; Set 2 new font-lock variables for enhanced F90 coloring.
(defface font-lock-loop-face
  '((((class grayscale) (background light))
     (:foreground "DimGray" :bold t))
    (((class grayscale) (background dark))
     (:foreground "LightGray" :bold t))
    (((class color) (background light)) (:foreground "LimeGreen"))
    (((class color) (background dark)) (:foreground "Green"))
    (t (:bold t)))
  "Font Lock mode face used to highlight F90 loops."
  :group 'font-lock-highlighting-faces)

(defface font-lock-conditional-face
  '((((class grayscale) (background light))
     (:foreground "DimGray" :bold t))
    (((class grayscale) (background dark))
     (:foreground "LightGray" :bold t))
    (((class color) (background light)) (:foreground "OrangeRed"))
    (((class color) (background dark)) (:foreground "Orange"))
    (t (:bold t)))
  "Font Lock mode face used to highlight F90 conditionals."
  :group 'font-lock-highlighting-faces)

;;(setq font-lock-support-mode 'lazy-lock-mode)
(eval-after-load "f90" '(load "my-f90-font-lock"))
(setq font-lock-maximum-decoration t)

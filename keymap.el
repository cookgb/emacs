;; $Id: keymap.el,v 1.1.1.1 2001-07-02 18:35:13 cookgb Exp $
;; Change key mappings

;; enable arrow keys
(global-unset-key "\M-[")
(global-unset-key "\C-z")
(global-unset-key "\C-x\C-z")
(global-set-key "\M-[B" 'next-line)
(global-set-key "\M-OB" 'next-line)
(global-set-key         "\e[221z"       'next-line)
(global-set-key "\M-[A" 'previous-line)
(global-set-key "\M-OA" 'previous-line)
(global-set-key         "\e[215z"       'previous-line)
(global-set-key "\M-[C" 'forward-char)
(global-set-key "\M-OC" 'forward-char)
(global-set-key         "\e[219z"       'forward-char)
(global-set-key         "\e[217z"       'backward-char)
(global-set-key "\M-[D" 'backward-char)
(global-set-key "\M-OD" 'backward-char)
(global-unset-key "\M-[2")
(global-set-key "\M-[216z" 'scroll-down)
(global-set-key "\M-[5~" 'scroll-down)
(global-set-key "\M-[222z" 'scroll-up)
(global-set-key "\M-[6~" 'scroll-up)
(global-set-key "\M-[218z" 'previous-line)

;; change other mappings
(global-unset-key "\M-g")
(global-set-key "\M-g" 'goto-line)

;; I hate typing backspace and getting into 'help'.
;; Make backspace do something sensible.
(global-set-key "\M-?" 'help-for-help)
(global-set-key "\C-h" 'backward-delete-char-untabify)

;; Make replaces by regexp by default
(global-set-key "\M-\C-r" 'replace-regexp)
(global-set-key "\M-r" 'query-replace-regexp)

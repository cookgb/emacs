;; $Id: comment.el,v 1.1.1.1 2001-07-02 18:35:13 cookgb Exp $
;; Borrowed most of this code from fortran-comment-region in fortran.el
;;-----------------------------------------------------------------------
(defun general-comment-region (beg-region end-region comment-string arg)
  "Comments every line in the region.
Puts COMMENT-STRING at the beginning of every line in the region. 
BEG-REGION and END-REGION are args which specify the region boundaries. 
With non-nil ARG, uncomments the region."
  (let ((end-region-mark (make-marker)) (save-point (point-marker)))
    (set-marker end-region-mark end-region)
    (goto-char beg-region)
    (beginning-of-line)
    (if (not arg)                       ;comment the region
        (progn (insert comment-string)
               (while (and  (= (forward-line 1) 0)
                            (< (point) end-region-mark))
                 (insert comment-string)))
      (let ((com (regexp-quote comment-string))) ;uncomment the region
        (if (looking-at com)
            (delete-region (point) (match-end 0)))
        (while (and  (= (forward-line 1) 0)
                     (< (point) end-region-mark))
          (if (looking-at com)
              (delete-region (point) (match-end 0))))))
    (goto-char save-point)
    (set-marker end-region-mark nil)
    (set-marker save-point nil)))

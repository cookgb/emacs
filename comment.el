;; $Id: comment.el,v 1.2 2002-07-18 19:12:10 cookgb Exp $
;; Borrowed most of this code from fortran-comment-region in fortran.el
;;-----------------------------------------------------------------------
(defun general-comment-region (beg-region end-region)
  "Comments every line in the region.
Puts `general-comment-region' at the beginning of every line in the region.
BEG-REGION and END-REGION are args which specify the region boundaries."
  (interactive "*r")
  (let ((end-region-mark (copy-marker end-region))
	(save-point (point-marker)))
    (goto-char beg-region)
    (beginning-of-line)
    (progn (insert general-comment-region)
	   (while (and  (= (forward-line 1) 0)
			(< (point) end-region-mark))
	     (insert general-comment-region)))
    (goto-char save-point)
    (set-marker end-region-mark nil)
    (set-marker save-point nil)))

(defun general-uncomment-region (beg-region end-region)
  "Comments every line in the region.
Removes `general-comment-region' at the beginning of every line in the region.
BEG-REGION and END-REGION are args which specify the region boundaries."
  (interactive "*r")
  (let ((end-region-mark (copy-marker end-region))
	(save-point (point-marker)))
    (goto-char beg-region)
    (beginning-of-line)
    (let ((com (regexp-quote general-comment-region))) ;uncomment the region
      (if (looking-at com)
	  (delete-region (point) (match-end 0)))
      (while (and  (= (forward-line 1) 0)
		   (< (point) end-region-mark))
	(if (looking-at com)
	    (delete-region (point) (match-end 0)))))
    (goto-char save-point)
    (set-marker end-region-mark nil)
    (set-marker save-point nil)))

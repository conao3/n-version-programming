;;; qsort-clisp.lisp

(defun split-str-1 (string &optional (separator " ") (r nil))
  (let ((n (position separator string
		     :from-end t
		     :test (lambda (x y) (find y x :test #'string=)))))
    (if n
	(split-str-1 (subseq string 0 n) separator (cons (subseq string (1+ n)) r))
      (cons string r))))

(defun split-str (string &optional (separator " "))
  (split-str-1 string separator))

(defun get-data ()
  (let ((str (read-line)))
    (mapcar #'parse-integer (split-str str))))

(defun qsort-swap (lst left right)
  "Swap LEFT and RIGHT element of LST."
  (let ((tmp (nth left lst)))
    (setf (nth left lst) (nth right lst))
    (setf (nth right lst) tmp)))

(defun qsort-1 (lst left right)
  "Quicksort LST from LEFT to RIGHT."
  (let ((pivot (nth right lst))
        (i left)
        (j left))
    (loop
     :while (< j right)
     :do
     (when (< (nth j lst) pivot)
       (qsort-swap lst i j)
       (incf i))
     (incf j))
    (qsort-swap lst i right)
    i))

(defun qsort (lst &optional (left 0) (right (- (length lst) 1)))
  "Quicksort LST from LEFT to RIGHT."
  (when (< left right)
    (let ((pivot (qsort-1 lst left right)))
      (qsort lst left (1- pivot))
      (qsort lst (1+ pivot) right)))
  lst)

(let ((lst (get-data)))
  (dolist (elm (qsort lst))
    (format t "~D " elm)))

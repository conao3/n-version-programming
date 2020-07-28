;;; qsort-one-function.el --- Quicksort  -*- lexical-binding: t; -*-

;;; Commentary:

;; Quicksort.

;;; Code:

(require 'cl-lib)
(require 'subr-x)

(defun qsort-get-data-from-stdin ()
  "Get space separated int data from stdin."
  (let ((str (read-string "")))
    (mapcar #'string-to-number (split-string str " " 'omit-null))))

(defsubst qsort-swap (lst left right)
  "Swap LEFT and RIGHT element of LST."
  (let ((tmp (nth left lst)))
    (setf (nth left lst) (nth right lst))
    (setf (nth right lst) tmp)))

(cl-defun qsort (lst &optional (left 0) (right (- (length lst) 1)))
  "Quicksort LST from LEFT to RIGHT."
  (when (< left right)
    (let ((i left)
          (j right)
          (pivot (nth left lst)))
      (catch 'break
        (while t
          (while (< (nth i lst) pivot) (cl-incf i))
          (while (< pivot (nth j lst)) (cl-decf j))
          (unless (< i j) (throw 'break nil))
          (qsort-swap lst i j)
          (cl-incf i) (cl-decf j)))
      (qsort lst left (1- i))
      (qsort lst (1+ j) right)))
  lst)

(let ((lst (qsort-get-data-from-stdin)))
  (princ
   (format "%s \n" (mapconcat #'number-to-string (qsort lst) " "))))

;;; qsort-one-function.el ends here

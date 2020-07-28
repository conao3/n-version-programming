#!/usr/bin/emacs --script
;;; qsort.el --- Quicksort  -*- lexical-binding: t; -*-

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

(defun qsort-1 (lst left right)
  "Quicksort LST from LEFT to RIGHT."
  (let ((pivot (nth right lst))
        (i left)
        (j left))
    (while (< j right)
      (when (< (nth j lst) pivot)
        (qsort-swap lst i j)
        (cl-incf i))
      (cl-incf j))
    (qsort-swap lst i right)
    i))

(cl-defun qsort (lst &optional (left 0) (right (- (length lst) 1)))
  "Quicksort LST from LEFT to RIGHT."
  (when (< left right)
    (let ((pivot (qsort-1 lst left right)))
      (qsort lst left (1- pivot))
      (qsort lst (1+ pivot) right)))
  lst)

(let ((lst (qsort-get-data-from-stdin)))
  (princ
   (format "%s \n" (mapconcat #'number-to-string (qsort lst) " "))))

;;; qsort.el ends here

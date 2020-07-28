#!/usr/bin/emacs --script
;;; qsort-sort.el --- Quicksort  -*- lexical-binding: t; -*-

;;; Commentary:

;; Quicksort using `sort'.

;;; Code:

(princ
 (format
  "%s\n"
  (mapconcat
   #'number-to-string
   (sort (mapcar #'string-to-number (split-string (read-string "") " " 'omit-null)) #'<)
   " ")))

;;; qsort-sort.el ends here

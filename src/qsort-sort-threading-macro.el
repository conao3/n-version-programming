#!/usr/bin/emacs --script
;;; qsort-sort-threading-macro.el --- Quicksort  -*- lexical-binding: t; -*-

;;; Commentary:

;; Quicksort using `sort' and threading macro.

;;; Code:

(require 'subr-x)

(thread-last (read-string "")
  (funcall (lambda (elm) (split-string elm " " 'omit-null)))
  (mapcar #'string-to-number)
  (funcall (lambda (elm) (sort elm #'<)))
  (funcall (lambda (elm) (mapconcat #'number-to-string elm " ")))
  (format "%s\n")
  (princ))

;;; qsort-sort-threading-macro.el ends here

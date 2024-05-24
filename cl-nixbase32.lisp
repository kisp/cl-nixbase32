;;; -*- Mode:Lisp; Syntax:ANSI-Common-Lisp; Coding:utf-8 -*-

(in-package :cl-nixbase32)

(defvar *alphabet* "0123456789abcdfghijklmnpqrsvwxyz")

(defun byte-to-bits (byte)
  "Convert a byte to a list of its bits."
  (loop for i from 7 downto 0
        collect (ldb (byte 1 i) byte)))

(defun bits-to-int (bits)
  "Convert a list of bits to an integer."
  (reduce (lambda (acc bit) (+ (* 2 acc) bit)) bits))

(defun pad-in-front (list)
  (ecase (mod (length list) 5)
    (0 list)
    (1 (append '(0 0 0 0) list))))

(defun group-by-5 (list)
  (when list
    (cons (subseq list 0 5)
          (group-by-5 (nthcdr 5 list)))))

(defun lookup-alphabet (list)
  (map 'string (lambda (x) (aref *alphabet* x)) list))

(defun bytes-to-nixbase32 (vector)
  ;; Maybe I'll implement this more efficiently at some point.  For
  ;; now, this works.
  (arrow-macros:->> vector
   (map 'list #'identity)
   reverse
   (map 'list #'byte-to-bits)
   alexandria:flatten
   pad-in-front
   group-by-5
   (mapcar #'bits-to-int)
   lookup-alphabet))

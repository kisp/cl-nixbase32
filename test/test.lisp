;;; -*- Mode:Lisp; Syntax:ANSI-Common-Lisp; Coding:utf-8 -*-

(in-package :cl-nixbase32-test)

(defsuite* :cl-nixbase32-test)

(deftest bytes-to-nixbase32.1
  (is (equal "04000000000000000000000000000000"
             (bytes-to-nixbase32
              (ironclad:hex-string-to-byte-array
               "0000000000000000000000000000000000000001"))))
  (is (equal "08000000000000000000000000000000"
             (bytes-to-nixbase32
              (ironclad:hex-string-to-byte-array
               "0000000000000000000000000000000000000002"))))
  (is (equal "nvd61k9nalji1zl9rrdfmsmvyyjqpzg4"
             (bytes-to-nixbase32
              (ironclad:hex-string-to-byte-array
               "e4fd8ba5f7bbeaea5ace89fe10255536cd60dab6")))))

(deftest bytes-to-nixbase32.2
  (is (equal "0080000000000000000000000000000000000000000000000000"
             (bytes-to-nixbase32
              (ironclad:hex-string-to-byte-array
               "0000000000000000000000000000000000000000000000000000000000000001"))))
  (is (equal "00h0000000000000000000000000000000000000000000000000"
             (bytes-to-nixbase32
              (ironclad:hex-string-to-byte-array
               "0000000000000000000000000000000000000000000000000000000000000002"))))
  (is (equal "1ak0qjw1r1idnv0847fvyj3jsd3m7z8674c41p76hr36d98n9wk2"
             (bytes-to-nixbase32
              (ironclad:hex-string-to-byte-array
               "62f264516a666468ce0d849163d03f75342d87f4db1d82c0b62d861cb8c460aa")))))

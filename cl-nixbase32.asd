;;; -*- Mode:Lisp; Syntax:ANSI-Common-Lisp; Coding:utf-8 -*-

(defsystem :cl-nixbase32
  :name "cl-nixbase32"
  :description "cl-nixbase32 implements the slightly odd 'base32' encoding that's used in Nix"
  :author "Kilian Sprotte <kilian.sprotte@gmail.com>"
  :version #.(with-open-file
                 (vers (merge-pathnames "version.lisp-expr" *load-truename*))
               (read vers))
  :components ((:static-file "version" :pathname #p"version.lisp-expr")
               (:file "package")
               (:file "cl-nixbase32" :depends-on ("package"))
               )
  :depends-on (:alexandria)
  :in-order-to ((test-op (test-op :cl-nixbase32-test))))

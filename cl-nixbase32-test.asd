;;; -*- Mode:Lisp; Syntax:ANSI-Common-Lisp; Coding:utf-8 -*-

(defsystem :cl-nixbase32-test
  :name "cl-nixbase32-test"
  :description "Tests for cl-nixbase32"
  :components ((:module "test"
                :components ((:file "package")
                             (:file "test" :depends-on ("package")))))
  :depends-on (:cl-nixbase32 :myam :alexandria))

(defmethod perform ((op test-op)
                    (system (eql (find-system :cl-nixbase32-test))))
  (funcall (intern "RUN!" "MYAM") :cl-nixbase32-test))

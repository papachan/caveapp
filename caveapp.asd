(in-package :cl-user)
(defpackage caveapp-asd
  (:use :cl :asdf))
(in-package :caveapp-asd)

(defsystem caveapp
  :version "0.1"
  :author "@papachan"
  :license ""
  :depends-on (:clack
               :caveman2
               :envy
               :cl-ppcre

               ;; HTML Template
               :cl-emb

               ;; for CL-DBI
               :datafly
               :sxql)
  :components ((:module "src"
                :components
                ((:file "main" :depends-on ("config" "view" "db"))
                 (:file "web" :depends-on ("view"))
                 (:file "view" :depends-on ("config"))
                 (:file "db" :depends-on ("config"))
                 (:file "config"))))
  :description "A simple commonlisp project with caveman2"
  :in-order-to ((test-op (load-op caveapp-test))))

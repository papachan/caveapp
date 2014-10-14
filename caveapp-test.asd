(in-package :cl-user)
(defpackage caveapp-test-asd
  (:use :cl :asdf))
(in-package :caveapp-test-asd)

(defsystem caveapp-test
  :author "@papachan"
  :license ""
  :depends-on (:caveapp
               :cl-test-more)
  :components ((:module "t"
                :components
                ((:file "caveapp"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))

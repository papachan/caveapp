(in-package :cl-user)
(defpackage caveapp.web
  (:use :cl
        :caveman2
        :caveapp.config
        :caveapp.view
        :caveapp.db
        :datafly
        :sxql)
  (:export :*web*))
(in-package :caveapp.web)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

(defroute "/" ()
  (with-layout (:title "Welcome to Caveman2")
    (render #P"index.tmpl")))

(defroute "/prueba" ()
  (with-layout (:title "sas")
    (render #P"index.tmpl")))

;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))

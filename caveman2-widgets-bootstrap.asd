#|
  This file is a part of caveman2-widgets-bootstrap project.
  Copyright (c) 2016 Richard Paul Bäck (richard.baeck@free-your-pc.com)
|#

#|
  Author: Richard Paul Bäck (richard.baeck@free-your-pc.com)
|#

(in-package :cl-user)
(defpackage caveman2-widgets-bootstrap-asd
  (:use :cl :asdf))
(in-package :caveman2-widgets-bootstrap-asd)

(defsystem caveman2-widgets-bootstrap
  :version "0.2"
  :author "Richard Paul Bäck"
  :license "LLGPL"
  :depends-on (:caveman2-widgets)
  :serial t
  :components ((:module "src"
                        :components
                        ((:file "widget")
                         (:file "callback-widgets")
                         (:file "document")
                         (:file "navigation")
                         (:file "caveman2-widgets-bootstrap"))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op caveman2-widgets-bootstrap-test))))

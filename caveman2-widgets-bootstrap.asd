#|
  This file is a part of caveman2-widgets-bootstrap project.
  Copyright (c) 2016 Richard Paul Bäck (richard.baeck@free-your-pc.com)
|#

#|
  Author: Richard Paul Bäck (richard.baeck@free-your-pc.com)
|#

(defsystem "caveman2-widgets-bootstrap"
  :version "0.2"
  :author "Richard Paul Bäck"
  :license "LLGPL"
  :depends-on ("caveman2" "caveman2-widgets")
  :serial t
  :components ((:module "src"
                        :components
                        ((:file "widget")
                         (:file "callback-widgets")
                         (:file "document")
                         (:file "navigation")
                         (:file "caveman2-widgets-bootstrap"))))
  :description "An extension to caveman2-widgets which enables the simple usage of Twitter Bootstrap."
  ;; :long-description #.(read-file-string (subpathname *load-pathname* "README.org"))
  :in-order-to ((test-op (test-op "caveman2-widgets-bootstrap-test"))))

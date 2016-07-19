;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This file is a part of the caveman2-widgets-bootstrap project.
;;
;; Copyright (c) 2016 Richard Paul Bäck (richard.baeck@free-your-pc.com)
;; LICENSE: LLGPLv3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(in-package :cl-user)
(defpackage caveman2-widgets-bootstrap.document
  (:use :cl
        :caveman2-widgets)
  (:export
   :*bootstrap-js*
   :*bootstrap-css*

   :<bootstrap-header-widget>))
(in-package :caveman2-widgets-bootstrap.document)

(defvar *bootstrap-js*
  (make-instance '<js-file>
                 :path "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
                 :integrity "sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
                 :crossorigin "anonymous"))
(defvar *bootstrap-css*
  (make-instance '<css-file>
                 :path "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
                 :integrity "sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
                 :crossorigin "anonymous"))

(defclass <bootstrap-header-widget> (<header-widget>)
  ())

(defmethod initialize-instance :after ((this <bootstrap-header-widget>) &key)
  (append-item this
               *bootstrap-js*)
  (append-item this
               *bootstrap-css*))

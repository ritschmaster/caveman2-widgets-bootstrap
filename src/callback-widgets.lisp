;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This file is a part of the caveman2-widgets-bootstrap project.
;;
;; Copyright (c) 2016 Richard Paul Bäck (richard.baeck@free-your-pc.com)
;; LICENSE: LLGPLv3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(in-package :cl-user)
(defpackage caveman2-widgets-bootstrap.callback-widgets
  (:use :cl
        :caveman2-widgets
        :caveman2-widgets-bootstrap.widget)
  (:export
   :<bootstrap-button-widget>
   :kind))
(in-package :caveman2-widgets-bootstrap.callback-widgets)

(defparameter *default-button-class* "btn")

(defclass <bootstrap-button-widget> (<button-widget>)
  ((kind
    :initform :default
    :initarg :kind
    :accessor kind
    :documentation "The button kind. Available keywords:
- :default
- :primary
- :success
- :info
- :warning
- :danger")))

(defmethod initialize-instance :after ((this <bootstrap-button-widget>) &key)
  (setf (kind this)
        (slot-value this 'kind)))

(defmethod (setf kind) (value (this <bootstrap-button-widget>))
  (setf (classes this)
        (concatenate 'string
                     *default-button-class*
                     " "
                     *default-button-class*
                     "-"
                     (string-downcase
                      (symbol-name value)))))

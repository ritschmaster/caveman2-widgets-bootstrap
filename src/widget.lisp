;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This file is a part of the caveman2-widgets-bootstrap project.
;;
;; Copyright (c) 2016 Richard Paul Bäck (richard.baeck@free-your-pc.com)
;; LICENSE: LLGPLv3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(in-package :cl-user)
(defpackage caveman2-widgets-bootstrap.widget
  (:use :cl)
  (:export
   :*application-root*
   :*static-directory*
   :*js-directory*
   :*widgets-js-filename*))
(in-package :caveman2-widgets-bootstrap.widget)

(defparameter *application-root* (asdf:system-source-directory :caveman2-widgets-bootstrap))
(defparameter *static-directory* (merge-pathnames #P"static/" *application-root*))
(defparameter *js-directory* (merge-pathnames #P"js/" *static-directory*))
(defparameter *widgets-js-filename* "bootstrap-widgets.js"
  "The filename of the JavaScript file which manages all bootstrap widget
functionality.")

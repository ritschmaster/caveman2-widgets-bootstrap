;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This file is a part of the caveman2-widgets-bootstrap project.
;;
;; Copyright (c) 2016 Richard Paul Bäck (richard.baeck@free-your-pc.com)
;; LICENSE: LLGPLv3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(in-package :cl-user)
(defpackage caveman2-widgets-bootstrap
  (:use :cl
        :caveman2-widgets
        :caveman2-widgets-bootstrap.widget
        :caveman2-widgets-bootstrap.callback-widgets
        :caveman2-widgets-bootstrap.document
        :caveman2-widgets-bootstrap.navigation)
  (:export
   ;; From caveman2-widgets-bootstrap.callback-widgets
   :<bootstrap-button-widget>
   :kind

   ;; From caveman2-widgets-bootstrap.document
   :*bootstrap-js*
   :*bootstrap-css*

   :<bootstrap-header-widget>

   ;; From :caveman2-widgets-bootstrap.navigation
   :<bootstrap-menu-navigation-widget>))
(in-package :caveman2-widgets-bootstrap)

(setf *init-widgets-hooks*
      (append
       *init-widgets-hooks*
       (list
        #'(lambda ()
            (defroute-static
                (concatenate 'string
                             caveman2-widgets::*javascript-path*
                             "/"
                             *widgets-js-filename*)
                (merge-pathnames #P"bootstrap-widgets.js" *js-directory*)
              caveman2-widgets::*web*
              "text/javascript; charset=utf-8")))))

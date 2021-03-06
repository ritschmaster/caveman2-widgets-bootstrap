;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This file is a part of the caveman2-widgets-bootstrap project.
;;
;; Copyright (c) 2016 Richard Paul Bäck (richard.baeck@free-your-pc.com)
;; LICENSE: LLGPLv3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(in-package :cl-user)
(defpackage caveman2-widgets-bootstrap.navigation
  (:use :cl
        :caveman2
        :caveman2-widgets
        :caveman2-widgets.util)
  (:export
   :<bootstrap-menu-navigation-widget>
   :render-widget-header
   :brand-text
   :navbar-fixed))
(in-package :caveman2-widgets-bootstrap.navigation)

(defclass <bootstrap-menu-navigation-widget> (<menu-navigation-widget>)
  ((brand-text
    :initarg :brand-text
    :initform ""
    :accessor brand-text
    :documentation "This can be HTML too.")
   (navbar-fixed
    :initarg :navbar-fixed
    :initform nil
    :accessor navbar-fixed)))

(defgeneric render-widget-header (this args))
(defmethod render-widget-header ((this <bootstrap-menu-navigation-widget>)
                                 (args (eql :left)))
  (with-output-to-string (ret-val)
    (format ret-val "<ul class=\"nav navbar-nav navigation-widget-links\">")
    (dolist (page (caveman2-widgets.navigation::pages this))
      (when (not (find :hidden page))
        (format ret-val "<li>
<a href=\"~a\">~a</a>
<input type=\"hidden\" value=\"~a\" />
</li>"
                (let ((link
                       (make-widget
                        :session '<link-widget>
                        :label (first page)
                        :callback
                        #'(lambda (args)
                            (setf (current-page this) (second page))
                            (concatenate
                             'string
                             (subseq
                              (base-path this) 1)
                             (if (has-trailing-slash
                                  (base-path this))
                                 ""
                                 "/")
                             (second page))))))
                  (concatenate 'string
                               (uri-path link)))
                (funcall caveman2-widgets.util::+translate+
                         (first page))
                (second page))))
    (format ret-val "</ul>")))

(defmethod render-widget-header ((this <bootstrap-menu-navigation-widget>)
                                 (args (eql :middle)))
  "")

(defmethod render-widget-header ((this <bootstrap-menu-navigation-widget>)
                                 (args (eql :right)))
  "")

(defmethod render-widget ((this <bootstrap-menu-navigation-widget>))
  (with-output-to-string (ret-val)
    (format ret-val "<nav class=\"navbar navbar-default~a>
<div class=\"container-fluid\">"
            (if (navbar-fixed this)
                " navbar-static-top\" style=\"position:fixed;width:100%\""
                "\""))
    (format ret-val "<div class=\"navbar-header\">
  <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\" aria-expanded=\"false\">
    <span class=\"sr-only\">Toggle navigation</span>
    <span class=\"icon-bar\"></span>
    <span class=\"icon-bar\"></span>
    <span class=\"icon-bar\"></span>
  </button>"
            (brand-text this))
    (when (brand-text this)
      (format ret-val
              "<div class=\"navbar-brand\">~a</div>"
              (brand-text this)))
    (format ret-val "</div>
<div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">")
    (format ret-val (render-widget-header this :left))
    (format ret-val (render-widget-header this :middle))
    (format ret-val (render-widget-header this :right))
    (format ret-val "</div><!-- /.navbar-collapse -->")
    (format ret-val "</div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->")

    (format ret-val (render-widget (caveman2-widgets.navigation::composite this)))))

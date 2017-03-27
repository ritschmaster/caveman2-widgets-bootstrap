#|
  This file is a part of caveman2-widgets-bootstrap project.
  Copyright (c) 2016 Richard Paul Bäck (richard.baeck@free-your-pc.com)
|#

(defsystem "caveman2-widgets-bootstrap-test"
  :author "Richard Paul Bäck"
  :license "LLGPL"
  :depends-on ("caveman2-widgets-bootstrap" "prove")
  :components ((:module "t"
                :components
                ((:test-file "caveman2-widgets-bootstrap"))))
  :description "Test system for caveman2-widgets-bootstrap"
  :defsystem-depends-on ("prove-asdf")
  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))

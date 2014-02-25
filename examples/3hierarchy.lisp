

(defpackage cl-tui.examples
  (:use :cl :cl-tui))

(in-package cl-tui.examples)

(init-screen)

(define-frame callback (callback-frame) :on :root)

(defun main-render2 ()
  (destructuring-bind (x y)
      (frame-size 'callback)
    (put-char 'callback 2 2 #\+)
    (put-char 'callback 2 (- x 3) #\+)
    (put-char 'callback (- y 3) 2 #\+)
    (put-char 'callback (- y 3) (- x 3) #\+)))
(define-frame callback2 (callback-frame :render 'main-render2) :on callback)

(refresh)

(read-key)

(destroy-screen)
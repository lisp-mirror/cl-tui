
(defpackage cl-tui.examples
  (:use :cl :cl-tui))

(in-package cl-tui.examples)

(defun render-scene (&key frame)
  (put-text frame 0 0 "Push 1, 2, 3, 4 to switch between frames ")
  (put-text frame 1 0 "Space to show all frames tiled")
  (put-text frame 2 0 "q to quit")
  (when (eq frame 'scene-4)
    (put-text frame 3 0 "This frame is not a part of :root frame"))
  (put-text frame 4 4 "Current frame: ~A" frame))

(define-frame scene-1 (callback-frame :render #'render-scene) :on :root)
(define-frame scene-2 (callback-frame :render #'render-scene) :on :root)
(define-frame scene-3 (callback-frame :render #'render-scene) :on :root)
(define-frame scene-4 (callback-frame :render #'render-scene))

(defun scenes ()
  (with-screen ()
    (display 'scene-1)
    (loop (case (read-key)
            (#\q (return))
            (#\Space (display :root))
            (#\1 (display 'scene-1))
            (#\2 (display 'scene-2))
            (#\3 (display 'scene-3))
            (#\4 (display 'scene-4))))))

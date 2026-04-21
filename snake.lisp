;;;; Snake Game - Windows Compatible
;;;; Run: sbcl --script snake.lisp
;;;; Type a letter and press ENTER each turn

(defparameter *width* 20)
(defparameter *height* 15)
(defparameter *snake* nil)
(defparameter *dir* (cons 1 0))
(defparameter *food* nil)
(defparameter *score* 0)
(defparameter *running* t)

(defun pos= (a b)
  (and (= (car a) (car b)) (= (cdr a) (cdr b))))

(defun on-snake (pos)
  (some #'(lambda (s) (pos= s pos)) *snake*))

(defun place-food ()
  (loop for p = (cons (random *width*) (random *height*))
        until (not (on-snake p))
        finally (setf *food* p)))

(defun draw ()
  (dotimes (i 40) (format t "~%"))
  (format t "+~A+~%" (make-string *width* :initial-element #\-))
  (dotimes (y *height*)
    (write-char #\|)
    (dotimes (x *width*)
      (let ((p (cons x y)))
        (cond ((pos= p (car *snake*)) (write-char #\@))
              ((on-snake p)           (write-char #\o))
              ((pos= p *food*)        (write-char #\*))
              (t                      (write-char #\space)))))
    (format t "|~%"))
  (format t "+~A+~%" (make-string *width* :initial-element #\-))
  (format t "Score: ~A~%" *score*)
  (format t "Move (w/a/s/d + enter): ")
  (finish-output))

(defun update-dir (ch)
  (case ch
    (#\w (unless (= (cdr *dir*)  1) (setf *dir* (cons  0 -1))))
    (#\s (unless (= (cdr *dir*) -1) (setf *dir* (cons  0  1))))
    (#\a (unless (= (car *dir*)  1) (setf *dir* (cons -1  0))))
    (#\d (unless (= (car *dir*) -1) (setf *dir* (cons  1  0))))
    (#\q (setf *running* nil))))

(defun step-game ()
  (let* ((hx (car (car *snake*)))
         (hy (cdr (car *snake*)))
         (nx (mod (+ hx (car *dir*)) *width*))
         (ny (mod (+ hy (cdr *dir*)) *height*))
         (new-head (cons nx ny)))
    (when (on-snake new-head)
      (setf *running* nil)
      (return-from step-game))
    (push new-head *snake*)
    (if (pos= new-head *food*)
        (progn (incf *score*) (place-food))
        (setf *snake* (butlast *snake*)))))

;; Init
(setf *snake* (list (cons 10 7) (cons 9 7) (cons 8 7)))
(place-food)

;; Game loop
(loop while *running* do
  (draw)
  (let* ((line (read-line))
         (ch (if (> (length line) 0)
                 (char-downcase (char line 0))
                 #\space)))
    (update-dir ch))
  (when *running* (step-game)))

(format t "~%GAME OVER! Score: ~A~%" *score*)
(finish-output)

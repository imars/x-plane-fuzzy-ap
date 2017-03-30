#|
(defun my-make-vector (dim init-fn)
  (let ((vec (make-array dim :initial-element 0.0 :element-type 'float)))
    (dotimes (i dim)
      (setf (aref vec i) (funcall init-fn i)))
    vec))

(defun my-make-matrix (dim1 dim2 init-fn)
  (let ((mat (make-array (list dim1 dim2) :initial-element 0.0 :element-type 'float)))
    (dotimes (x dim1)
      (dotimes (y dim2)
	(setf (aref mat x y) (funcall init-fn x y))))
    mat))

(defun my-make-bar-graph-data (rows cols)
  (let ((data (make-array (list rows cols) :initial-element 0.0 :element-type 'float)))
    (dotimes (i rows)
      (dotimes (j cols)
	(setf (aref data i j) (+ i j))))
    data))
|#

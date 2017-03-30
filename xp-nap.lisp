;;;; xp-nap.lisp
;;;;
;;;; Copyright (c) 2016 Ian Marshall 

(in-package #:xp-nap)
(declaim (sb-ext:muffle-conditions sb-ext:compiler-note))

(defparameter xplane-path "/Applications/X-Plane\ 10\/X-Plane.app")
(defparameter xplane-pgrep "X-Plane")

;; Data
(defparameter save-data nil)
(defparameter trace-data nil)
(defparameter print-data nil)
(defparameter data-speed 20)
(declaim (type integer data-speed))

;; Control
(defvar startx nil)
(defvar stopx nil)
(defvar updatex nil)
(defvar sendx nil)
(defparameter dt 0.0d0)

;; Thrust
(defparameter frontleft 0.0d0)
(defparameter frontright 0.0d0)
(defparameter rearleft 0.0d0)
(defparameter rearright 0.0d0)
(declaim (type double-float frontleft frontright rearleft rearright))

;; Setpoints
(defparameter heading 196.0d0) ;;196.0d0
(defparameter height 2.0d0)
;;(defparameter longitude 0.0d0)
;;(defparameter latitude 0.0d0)
(defparameter pos-x 0.0d0)
(defparameter pos-z 0.0d0)

;; Errors
(defparameter lat-e 0.0d0)
(defparameter lon-e 0.0d0)
(defparameter agl-e 0.0d0)

;; debug
(defparameter y-dot 0.0d0)

(defun find-running-app (name)
  (let ((str (make-array '(0) :element-type 'base-char
			 :fill-pointer 0 :adjustable t)))
    (with-output-to-string (s str) 
      (sb-ext:run-program 
       "/usr/bin/pgrep" `(,name) 
       :output s))
    str))

(defun start (&optional (ip nil))
  (reset-mfsets roll rollr rolla pitch pitchr pitcha
		yaw yawr yawa dir lat lon agl vvol vaccel
		thrustfl thrustfr thrustrl thrustrr)
  (reset-pos)
  (accel :reset t)
  ;(if (null startx)
  ;    (build-ap))
  (if (and (string-equal (find-running-app xplane-pgrep) "") (null ip))
      (progn
	(sb-ext:run-program "/usr/bin/open" `(,xplane-path))
	(unwind-protect
	     (sb-ext:run-program "/bin/sleep" '("60"))
	  (funcall startx)))
      (funcall startx)))

;; osascript -e 'quit app "APPLICATIONNAME"'
(defun stop (&optional (sim t))
  (if sim
      (unwind-protect
	   (sb-ext:run-program "/usr/bin/pkill" `(,xplane-pgrep))
	(funcall stopx))
      (funcall stopx))
  (if save-data
      (save-fuzzy-data
       ;;'(members-latx members-lony members-direction
       ;; "front left" "front right" "rear left" "rear right"
       ;; "Latitude" "Longitude")
       ;;'(members-latx members-direction members-thrust "Latitude" "Longitude")
       ;; Pitch
       ;;'(members-theta members-p-r members-p-a
       ;; members-thrust members-thrust "pitch")
       ;; AGL
       '(members-y-agl members-vh-ind members-dvh-ind
	 "Front left" "Front right" "Rear left" "Rear right" "Alt error"
	 members-thrust)
       "~/dev/lisp/xp-nap/data/mfset-run.txt")))

(defun alt (a)
  (setq height a))

(let ((times 1))
  (defun reset-pos (&optional (rep 1))
    (setq times rep))
  (defun record-pos (&key x z (reset nil))
    (if reset
	(setq times reset)
	(if (< 0 times)
	    (progn
	      (setq pos-x x)
	      (setq pos-z z)
	      (print (list "x" pos-x "z" pos-z))
	      (if (< 0 times) (decf times)))))))

(let ((t1 nil)
      (t2 nil)
      (delta nil))
  (defun deltat ()
    (cond ((null t1)
	   (setq t1 (get-internal-real-time))
	   0.0d0)
	  (t
	   (setq t2 (get-internal-real-time))
	   (setq delta (coerce (/ (- t2 t1)
				  internal-time-units-per-second) 'double-float))
	   (setq t1 t2)
	   delta))))

(let ((v1 nil)
      (dv nil))
  (defun accel (&key v dt reset)
    (if reset (progn
		(setq v1 nil
		      dv nil)))
    ;(print (list v1 dv))
    (cond ((null v1)
	   (setq v1 v)
	   0.0d0)
	  (t
	   (setq dv (if (< 0.0d0 dt)
			(/ (- v v1) dt)
			0.0d0))
	   (setq v1 v)
	   dv))))

;(defun build-ap ()
(eval-when (:compile-toplevel :execute)
  (multiple-value-bind (start stop update send)
      (with-xplane-refs
	  (:rrefs
	   (;;("sim/flightmodel/position/latitude" data-speed)
	    ;;("sim/flightmodel/position/longitude" data-speed)
	    ("sim/flightmodel/position/local_x" 30)
	    ("sim/flightmodel/position/local_z" 30)
	    ("sim/flightmodel/position/local_vx" 30)
	    ("sim/flightmodel/position/local_vz" 30)
	    ("sim/flightmodel/position/y_agl" 30)
	    ("sim/flightmodel/position/vh_ind" 30)
	    ("sim/flightmodel/position/local_ay" 30)
	    ("sim/flightmodel/position/phi" 30)
	    ("sim/flightmodel/position/theta" 30)
	    ("sim/flightmodel/position/psi" 30)
	    ("sim/flightmodel/position/R" 30)
	    ("sim/flightmodel/position/P" 30)
	    ("sim/flightmodel/position/Q" 30)
	    ("sim/flightmodel/position/R_dot" 30)
	    ("sim/flightmodel/position/P_dot" 30)
	    ("sim/flightmodel/position/Q_dot" 30))
	   :drefs ("sim/flightmodel/engine/ENGN_thro[0]"
		   "sim/flightmodel/engine/ENGN_thro[1]"
		   "sim/flightmodel/engine/ENGN_thro[2]"
		   "sim/flightmodel/engine/ENGN_thro[3]")
	   :onsend
	   ((setq engine/engn_thro[0] frontleft
		  engine/engn_thro[1] frontright
		  engine/engn_thro[2] rearright
		  engine/engn_thro[3] rearleft))
	   :onrecieve
	   ((setq dt (deltat))
	    (record-pos :x position/local_x
			:z position/local_z)

	    ;; Calculate vertical acceleration from velocity
	    ;;(setq y-dot (accel :v position/vh_ind :dt dt))
	    ;;(print (list position/vh_ind dt y-dot))
	    ;;(print position/local_ay)

	    ;; Calculate errors
	    (setq lat-e (- position/local_x pos-x))
	    (setq lon-e (- position/local_z pos-z))
	    (setq agl-e (- position/y_agl height))
	    
	    ;; ====== Fuzzification ======

	    (fuzzify-y-agl agl-e agl)
	    (fuzzify-vh-ind position/vh_ind vvol)
	    (fuzzify-dvh-ind position/local_ay vaccel)
	    (fuzzify-psi (- 180 (abs (- (- 180.0d0 position/psi)
					(- 180.0d0 heading)))) yaw)
	    (fuzzify-q-r position/q yawr)
	    (fuzzify-q-a position/Q_dot yawa)
	    (fuzzify-phi position/phi roll)
	    (fuzzify-theta position/theta pitch)
	    (fuzzify-r-r position/r rollr)
	    (fuzzify-p-r position/p pitchr)
	    (fuzzify-r-a position/R_dot rolla)
	    (fuzzify-p-a position/P_dot pitcha)
	    
	    ;;(fuzzify-latx (- position/latitude latitude) lat)
	    ;;(fuzzify-lony (- position/longitude longitude) lon)
	    (fuzzify-latx lat-e lat)
	    (fuzzify-lony lon-e lon)
	    (fuzzify-local_vx position/local_vx latv)
	    (fuzzify-local_vz position/local_vz lonv)
	    
	    (fuzzify-direction (if (> position/psi 180)
				   (- position/psi 360)
				   position/psi) dir)
	    
	    ;; ====== Rules ======
	    
	    ;; Altitude
	    (altitude)

	    ;; Attitude
	    (pitch)
	    (roll)

	    ;; Location
	    ;;(latitude)
	    ;;(latitudev)
	    ;;(longitude)
	    ;;(longitudev)

	    ;; Heading
	    ;;(heading)   


	    
	    ;; ====== Defuzzification ======
	    
	    (if trace-data (trace-graph :minu -3.0 :maxu 3.0
					:chars '(#\t #\v #\a #\y)
					:values
					`(,(* frontleft 100.0d0)
					   ,position/vh_ind
					   ,y-dot
					   ,agl-e)))

	    ;; Altitude
	    (if save-data (stream-fuzzy-data
			   agl vvol vaccel
			   (* 5.0d0 frontleft) (* 5.0d0 frontright)
			   (* 5.0d0 rearleft) (* 5.0d0 rearright)
			   (/ agl-e 5.0d0)
			   thrustfl))

	    #|
	    ;; Location
	    (if save-data
		(stream-fuzzy-data lat lon dir
				   frontleft frontright
				   rearleft rearright
				   lat-e
				   lon-e))
	    (if save-data
	    (stream-fuzzy-data lat dir
	    thrustfl
	    (- position/local_x pos-x)
	    (- position/local_z pos-z)))
	    |#
	    ;; Pitch
	    ;;(if save-data (stream-fuzzy-data pitch pitchr pitcha
	    ;;				 thrustfl thrustrl position/theta))


	    #|
	    (setq tl1 (defuzzify-thrust thrustfl)
	    tr1 (defuzzify-thrust thrustfr)
	    tl2 (defuzzify-thrust thrustrr)
	    tr2 (defuzzify-thrust thrustrl))
	    |#

	    (setq frontleft (defuzzify-thrust thrustfl)
		  frontright (defuzzify-thrust thrustfr)
		  rearleft (defuzzify-thrust thrustrl)
		  rearright (defuzzify-thrust thrustrr))

	    (if print-data
		(print (list "dir lat-e vx lon-e vz"
			     (if (> position/psi 180)
				 (- position/psi 360)
				 position/psi)
			     lat-e
			     position/local_vx
			     lon-e
			     position/local_vz)))			 

	    ;; Send threaded data to x-plane
	    (funcall sendx))))
    (setq startx start)
    (setq stopx stop)
    (setq updatex update)
    (setq sendx send)))






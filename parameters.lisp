(in-package :xp-nap)

;; Define membership function sets

(defmfset phi
    (tri way-left nil -45.0d0 -10.0d0)
  (tri left -45.0d0 -6.3d0 10.0d0)
  (tri bit-left -10.0d0 -2.50d0 0.50d0)
  (tri zero -0.50d0 0.0d0 0.50d0)
  (tri bit-right -0.50d0 2.50d0 10.0d0)
  (tri right -10.0d0 6.3d0 45.0d0)
  (tri way-right 10.0d0 45.0d0 nil))

(defmfset r-r
    (tri left nil -6.00d0 -1.0d0)
  (tri bit-left -6.0d0 -0.6d0 1.0d0)
  (tri zero -1.0d0 0.0d0 1.0d0)
  (tri bit-right -1.0d0 0.6d0 6.0d0)
  (tri right 1.0d0 6.00d0 nil))

(defmfset r-a
    (tri decel nil -1.0d0 0.30d0)
  (tri zero -0.30d0 0.0d0 0.30d0)
  (tri accel -0.30d0 1.0d0 nil))

(defmfset theta
    (tri way-front nil -45.0d0 -10.0d0)
  (tri front -45.0d0 -6.3d0 10.0d0)
  (tri bit-front -10.0d0 -2.50d0 0.50d0)
  (tri zero -0.50d0 0.0d0 0.50d0)
  (tri bit-back -0.50d0 2.50d0 10.0d0)
  (tri back -10.0d0 6.3d0 45.0d0)
  (tri way-back 10.0d0 45.0d0 nil))

(defmfset p-r
    (tri front nil -6.00d0 -1.0d0)
  (tri bit-front -6.0d0 -0.6d0 1.0d0)
  (tri zero -1.0d0 0.0d0 1.0d0)
  (tri bit-back -1.0d0 0.6d0 6.0d0)
  (tri back 1.0d0 6.00d0 nil))

(defmfset p-a
    (tri decel nil -1.0d0 0.30d0)
  (tri zero -0.3d0 0.0d0 0.30d0)
  (tri accel -0.30d0 1.0d0 nil))

(defmfset psi
    (tri way-left nil -90.0d0 -45.0d0)
  (tri left -90.0d0 -23.0d0 15.0d0)
  (tri bit-left -45.0d0 -9.00d0 15.0d0)
  (tri zero -15.0d0 0.0d0 15.0d0)
  (tri bit-right -15.0d0 9.0d0 45.0d0)
  (tri right -15.0d0 23.0d0 90.0d0)
  (tri way-right 45.0d0 90.0d0 nil))

(defmfset q-r
    (tri left nil -10.0d0 -3.00d0)
  (tri bit-left -10.0d0 -1.5d0 3.0d0)
  (tri zero -3.0d0 0.0d0 3.0d0)
  (tri bit-right -3.0d0 1.50d0 10.0d0)
  (tri right 3.00d0 10.0d0 nil))

(defmfset q-a
    (tri left nil -10.0d0 -2.50d0)
  (tri bit-left -10.0d0 -1.50d0 2.50d0)
  (tri zero -2.50d0 0.0d0 2.50d0)
  (tri bit-right -2.50d0 1.50d0 10.0d0)
  (tri right 2.50d0 10.0d0 nil))

(defmfset direction
    (tri S nil -179.0d0 -134.0d0)	   
  (tri SW -179.0d0 -134.0d0 -89.0d0)
  (tri W -134.0d0 -89.0d0 -44.0d0)
  (tri NW -89.0d0 -44.0d0 0.0d0)
  (tri N -44.0d0 0.0d0 45.0d0)
  (tri NE 0.0d0 45.0d0 90.0d0)
  (tri E 45.0d0 90.0d0 135.0d0)
  (tri SE 90.0d0 135.0d0 180.0d0)
  (tri SS 135.0d0 180.0d0 nil))
#|
(tri S nil -180.0d0 -135.0d0)	   
(tri SW -180.0d0 -135.0d0 -90.0d0)
(tri W -135.0d0 -90.0d0 -45.0d0)
(tri NW -90.0d0 -45.0d0 0.0d0)
(tri N -45.0d0 0.0d0 45.0d0)
(tri NE 0.0d0 45.0d0 90.0d0)
(tri E 45.0d0 90.0d0 135.0d0)
(tri SE 90.0d0 135.0d0 180.0d0)
(tri SS 135.0d0 180.0d0 nil))
|#
(defmfset latx
    (tri way-left nil -5.5d0 -1.50d0)	 	 
  (tri left -5.5d0 -0.75d0 1.50d0)	 
  (tri bit-left -1.5d0 -0.25d0 0.5d0)	 
  (tri zero -0.5d0 0.0d0 0.5d0)
  (tri bit-right -0.5d0 0.25d0 1.5d0)
  (tri right -1.50d0 0.75d0 5.5d0)
  (tri way-right 1.50d0 5.5d0 nil))	 	 

(defmfset local_vx 
    (tri left nil -3.00d0 3.0d0)
  (tri bit-left -3.00d0 -0.3d0 0.3d0)
  (tri zero -0.3d0 0.0d0 0.3d0)
  (tri bit-right -0.3d0 0.d0 3.0d0)
  (tri right -3.0d0 3.00d0 nil))

(defmfset lony
    (tri way-front nil -5.5d0 -1.50d0)	 	 
  (tri front -5.5d0 -0.75d0 1.50d0)	 
  (tri bit-front -1.5d0 -0.25d0 0.5d0)	 
  (tri zero -0.5d0 0.0d0 0.5d0)
  (tri bit-back -0.5d0 0.25d0 1.5d0)
  (tri back -1.50d0 0.75d0 5.5d0)
  (tri way-back 1.50d0 5.5d0 nil))

(defmfset local_vz 
    (tri front nil -3.00d0 3.0d0)
  (tri bit-front -3.00d0 -0.3d0 0.3d0)
  (tri zero -0.3d0 0.0d0 0.3d0)
  (tri bit-back -0.3d0 0.3d0 3.00d0)
  (tri back -3.0d0 3.00d0 nil))

(defmfset y-agl
    (tri way-below nil -25.0d0 -9.0d0)
  (tri below -25.00d0 -9.0d0 9.0d0)
  (tri bit-below -9.0d0 -3.00d0 3.00d0)
  (tri zero -3.0d0 0.0d0 3.0d0)
  (tri bit-above -3.00d0 3.00 9.00d0)
  (tri above -9.00d0 9.00d0 25.00d0)
  (tri way-above 9.00d0 25.0d0 nil))

(defmfset vh-ind 
    (tri down nil -10.0d0 -3.0d0)
  (tri bit-down -10.0d0 -3.0d0 3.0d0)
  (tri zero -3.0d0 0.0d0 3.00d0)
  (tri bit-up -3.0d0 3.0d0 10.0d0)
  (tri up 3.0d0 10.0d0 nil))
#|
(tri down nil -3.0d0 -0.50d0)
(tri bit-down -3.0d0 -0.50d0 0.50d0)
(tri zero -0.50d0 0.0d0 0.50d0)
(tri bit-up -0.50d0 0.50d0 3.0d0)
(tri up 0.50d0 3.00d0 nil))

(tri down nil -2.0d0 -0.50d0)
(tri bit-down -2.0d0 -0.50d0 0.50d0)
(tri zero -0.50d0 0.0d0 0.50d0)
(tri bit-up -0.50d0 0.50d0 2.0d0)
(tri up 0.50d0 2.00d0 nil))
|#

(defmfset dvh-ind
    (tri decel nil -0.6d0 0.60d0)
  (tri zero -0.6d0 0.0d0 0.6d0)
  (tri accel -0.60d0 0.6d0 nil))

(defmfset thrust

  #|
  (tri strong+2 0.129d0 0.147d0 0.165d0)
  (tri strong+3 0.138d0 0.156d0 0.174d0)
  (tri strong+4 0.147d0 0.165d0 0.183d0)
  (tri strong+5 0.156d0 0.174d0 0.192d0)
  (tri strong+6 0.165d0 0.183d0 0.201d0)
  (tri strong+7 0.174d0 0.192d0 0.210d0)
  |#
    
  (tri zero -0.018d0 0.000d0 0.018d0)
  (tri weak- -0.008d0 0.009d0 0.027d0)
  (tri weak 0.001d0 0.019d0 0.037d0)
  (tri less- 0.010d0 0.028d0 0.046d0)
  (tri less 0.020d0 0.038d0 0.056d0)
  (tri bit-less- 0.030d0 0.048d0 0.066d0)
  (tri bit-less 0.039d0 0.057d0 0.075d0)
  (tri tad-less 0.049d0 0.067d0 0.085d0)

  (tri hover 0.058d0 0.076d0 0.094d0)
  
  (tri tad-more 0.067d0 0.085d0 0.103d0)
  (tri bit-more 0.077d0 0.095d0 0.113d0)
  (tri bit-more+ 0.086d0 0.104d0 0.122d0)	 
  (tri more 0.096d0 0.114d0 0.132d0)
  (tri more+ 0.105d0 0.123d0 0.141d0)
  (tri strong 0.115d0 0.133d0 0.151d0)	 
  (tri strong+ 0.124d0 0.142d0 0.160d0)
  (tri strong+1 0.134d0 0.152d0 0.170d0)
    
  (tri strong+2 0.129d0 0.147d0 0.165d0)
  (tri strong+3 0.138d0 0.156d0 0.174d0)
  (tri strong+4 0.147d0 0.165d0 0.183d0)
  (tri strong+5 0.156d0 0.174d0 0.192d0)
  (tri strong+6 0.165d0 0.183d0 0.201d0)
  (tri strong+7 0.174d0 0.192d0 0.210d0)

  (tri full 0.489d0 0.5959d0 0.70d0)
)

;; Instances of membership function sets

(defparameter roll (make-phi))
(defparameter rollr (make-r-r))
(defparameter rolla (make-r-a))
(defparameter pitch (make-theta))
(defparameter pitchr (make-p-r))
(defparameter pitcha (make-p-a))
(defparameter yaw (make-psi))
(defparameter yawr (make-q-r))
(defparameter yawa (make-q-a))
(defparameter dir (make-direction))
(defparameter lat (make-latx))
(defparameter latv (make-local_vx))
(defparameter lon (make-lony))
(defparameter lonv (make-local_vz))
(defparameter agl (make-y-agl))       
(defparameter vvol (make-vh-ind))
(defparameter vaccel (make-dvh-ind))
(defparameter thrustfl (make-thrust))
(defparameter thrustfr (make-thrust))
(defparameter thrustrl (make-thrust))
(defparameter thrustrr (make-thrust))

(sb-ext:gc)


  #|
    ;; (tri rev-5 -0.216d0 -0.18d0 -0.144d0 )
    ;; (tri rev-4  -0.18d0 -0.144d0 -0.108d0)
    ;; (tri rev-3 -0.144d0 -0.108d0 -0.072d0)
    ;; (tri rev-2  -0.108d0 -0.072d0 -0.036d0)
    ;; (tri rev-1 -0.072d0 -0.036d0 0.0d0)


  (tri zero -0.018d0 0.00d0 0.018d0)
  
  (tri weak- 0.00d0 0.0105d0 0.021d0)
  (tri weak 0.00d0 0.021d0 0.039d0)
  (tri less- 0.0105d0 0.0315d0 0.048d0)
    (tri less 0.021d0 0.039d0 0.057d0)
   (tri bit-less- 0.03d0 0.048d0 0.066d0)
  (tri bit-less 0.039d0 0.057d0 0.075d0)
  
  (tri tad-less 0.048d0 0.066d0 0.084d0)
  (tri hover 0.057d0 0.075d0 0.093d0)	   
  (tri tad-more 0.066d0 0.084d0 0.102d0)
  
  (tri bit-more 0.075d0 0.093d0 0.111d0)
  
(tri bit-more+ 0.084d0 0.102d0 0.12d0)	 
(tri more 0.093d0 0.111d0 0.129d0)
(tri more+ 0.102d0 0.120d0 0.138d0)
(tri strong 0.111d0 0.129d0 0.147d0)	 
(tri strong+ 0.120d0 0.138d0 0.156d0)  
(tri strong+1 0.129d0 0.165d0 0.201d0)
  
(tri strong+2 0.165d0 0.201d0 0.237d0)
  (tri strong+3 0.201d0 0.237d0 0.273d0)
  (tri strong+4 0.237d0 0.273d0 0.309d0)
  (tri strong+5 0.273d0 0.309d0 0.345d0)
  (tri strong+6 0.309d0 0.345d0 0.381d0)
  |#
  #|
  (tri strong+7 0.345d0 0.381d0 0.417d0)
  (tri strong+8 0.381d0 0.417d0 0.453d0)
  (tri strong+9 0.417d0 0.4529d0 0.489d0)
  (tri strong+10 0.4529d0 0.489d0 0.5249d0)
  |#
  #|
  (tri strong+1 0.129d0 0.147d0 0.165d0)
  (tri strong+2 0.138d0 0.156d0 0.174d0)
  (tri strong+3 0.147d0 0.165d0 0.183d0)
  (tri strong+4 0.156d0 0.174d0 0.192d0)
  (tri strong+6 0.165d0 0.183d0 0.201d0)
  (tri strong+7 0.174d0 0.192d0 0.210d0)
  |#

#|
;; === GPS ===
(defparameter lat
  (mfset latx
	 (tri way-left nil -1.5d-4 -3.5d-5)
	 (tri left -1.5d-4 -3.5d-5 3.5d-5)	 
	 (tri bit-left -3.5d-5 -1.0d-5 6.5d-6)
	 (tri zero -6.5d-6 0.0d0 6.5d-6)
	 (tri bit-right -6.5d-6 1.0d-5 3.5d-5)
	 (tri right -3.5d-5 3.5d-5 1.5d-4)
	 (tri way-right 3.5d-5 1.5d-4 nil)))
(defparameter lon
  (mfset lony
	 (tri way-back nil -1.5d-4 -3.5d-5)
	 (tri back -1.5d-4 -3.5d-5 3.5d-5)	 
	 (tri bit-back -3.5d-5 -1.0d-5 6.5d-6)
	 (tri zero -6.5d-6 0.0d0 6.5d-6)
	 (tri bit-front -6.5d-6 1.0d-5 3.5d-5)
	 (tri front -3.5d-5 3.5d-5 1.5d-4)
	 (tri way-front 3.5d-5 1.5d-4 nil)))

;; === OpenGL ===
(defparameter lat
  (mfset latx
	 (tri way-left nil -6.0d0 -2.0d0)
	 (tri left -6.00d0 -1.5d0 2.0d0)	 
	 (tri bit-left -2.0d0 -0.5d0 0.5d0)	 
	 (tri zero -0.5d0 0.0d0 0.5d0)
	 (tri bit-right -0.5d0 0.5d0 2.0d0)
	 (tri right -2.0d0 1.5d0 6.0d0)
	 (tri way-right 2.0d0 6.0d0 nil)))
(defparameter lon
  (mfset lony
	 (tri way-back nil -6.0d0 -2.0d0)
	 (tri back -6.00d0 -1.5d0 2.0d0)	 
	 (tri bit-back -2.0d0 -0.5d0 0.5d0)	 
	 (tri zero -0.5d0 0.0d0 0.5d0)
	 (tri bit-front -0.5d0 0.5d0 2.0d0)
	 (tri front -2.0d0 1.5d0 6.0d0)
	 (tri way-front 2.0d0 6.0d0 nil)))

|#


#|         
;; y-agl history

(tri way-below nil -20.0d0 -5.5d0)
(tri below -20.00d0 -5.5d0 5.5d0)
(tri bit-below -5.5d0 -1.50d0 1.50d0)
(tri zero -1.5d0 0.0d0 1.5d0)
(tri bit-above -1.50d0 1.5d0 5.50d0)
(tri above -5.50d0 5.50d0 20.00d0)
(tri way-above 5.50d0 20.0d0 nil))

(tri way-below nil -10.0d0 -3.5d0)
(tri below -10.00d0 -3.5d0 -0.6d0)
(tri bit-below -3.5d0 -0.60d0 0.60d0)
(tri zero -0.6d0 0.0d0 0.6d0)
(tri bit-above -0.60d0 0.6d0 3.50d0)
(tri above 0.60d0 3.50d0 10.00d0)
(tri way-above 3.50d0 10.0d0 nil))

(tri way-below nil -5.5d0 -0.80d0)
(tri below -5.50d0 -0.80d0 -0.15d0)
(tri bit-below -0.80d0 -0.150d0 0.9d0)
(tri zero -0.15d0 0.0d0 0.9d0)
(tri bit-above 0.0d0 0.9d0 2.50d0)
(tri above 0.9d0 2.50d0 5.50d0)
(tri way-above 2.50d0 5.5d0 nil))

(tri way-below nil -5.5d0 -1.3d0)
(tri below -5.00d0 -1.30d0 0.50d0)
(tri bit-below -1.30d0 -0.4d0 0.5d0)
(tri zero -0.5d0 0.0d0 0.5d0)
(tri bit-above -0.5d0 0.5d0 2.00d0)
(tri above 0.50d0 2.00d0 5.50d0)
(tri way-above 2.00d0 5.5d0 nil))
|#

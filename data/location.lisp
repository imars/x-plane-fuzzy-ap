(in-package #:xp-nap)

(with-mfsets ((lat latx)
	      (lon lony)
	      (latv local_vx)
	      (lonv local_vz)
	      (dir direction)
	      (thrustfl thrust)
	      (thrustfr thrust)
	      (thrustrl thrust)
	      (thrustrr thrust))
  (defun location (&optional
		     position/longitude
		     position/latitude 
		     position/psi)
    (declare (ignorable position/longitude
			position/latitude 
			position/psi))
    (->

     ;; ====== Position: Latitude ======

     ;; Left
  
     (& lat.left dir.N)
     (thrustfl.more thrustrl.more
		    thrustfr.less thrustrr.less)	       
     (& lat.left dir.NE)
     (thrustfl.hover thrustrl.more
		     thrustfr.less thrustrr.hover)	       
     (& lat.left dir.E)
     (thrustfl.less thrustrl.more
		    thrustfr.less thrustrr.more)	       
     (& lat.left dir.SE)
     (thrustfl.less thrustrl.hover
		    thrustfr.hover thrustrr.more)	       
     (v (& lat.left dir.S)(& lat.left dir.SS))
     (thrustfl.less thrustrl.less
		    thrustfr.more thrustrr.more)	       
     (& lat.left dir.SW)
     (thrustfl.hover thrustrl.less
		     thrustfr.more thrustrr.hover)	       
     (& lat.left dir.W)
     (thrustfl.more thrustrl.less
		    thrustfr.more thrustrr.less)	       
     (& lat.left dir.NW)
     (thrustfl.more thrustrl.hover
		    thrustfr.hover thrustrr.less)	       

     (& lat.bit-left dir.N)
     (thrustfl.bit-more thrustrl.bit-more
			thrustfr.bit-less thrustrr.bit-less)	       
     (& lat.bit-left dir.NE)
     (thrustfl.hover thrustrl.bit-more
		     thrustfr.bit-less thrustrr.hover)	       
     (& lat.bit-left dir.E)
     (thrustfl.bit-less thrustrl.bit-more
			thrustfr.bit-less thrustrr.bit-more)	       
     (& lat.bit-left dir.SE)
     (thrustfl.bit-less thrustrl.hover
			thrustfr.hover thrustrr.bit-more)	       
     (v (& lat.bit-left dir.S)(& lat.bit-left dir.SS))
     (thrustfl.bit-less thrustrl.bit-less
			thrustfr.bit-more thrustrr.bit-more)	       
     (& lat.bit-left dir.SW)
     (thrustfl.hover thrustrl.bit-less
		     thrustfr.bit-more thrustrr.hover)	       
     (& lat.bit-left dir.W)
     (thrustfl.bit-less thrustrl.bit-more
			thrustfr.bit-less thrustrr.bit-more)	       
     (& lat.bit-left dir.NW)
     (thrustfl.bit-less thrustrl.hover
			thrustfr.hover thrustrr.bit-more)

     ;; --- Zero ---
     lat.zero (thrustfl.hover thrustrl.hover
			      thrustfr.hover thrustrr.hover)
     
     ;; Right
     
     (& lat.bit-right dir.N)
     (thrustfl.bit-less thrustrl.bit-less
			thrustfr.bit-more thrustrr.bit-more)	       
     (& lat.bit-right dir.NE)
     (thrustfl.hover thrustrl.bit-less
		     thrustfr.bit-more thrustrr.hover)	       
     (& lat.bit-right dir.E)
     (thrustfl.bit-more thrustrl.bit-less
			thrustfr.bit-more thrustrr.bit-less)	       
     (& lat.bit-right dir.SE)
     (thrustfl.bit-more thrustrl.hover
			thrustfr.hover thrustrr.bit-less)	       
     (v (& lat.bit-right dir.S)(& lat.bit-right dir.SS))
     (thrustfl.bit-more thrustrl.bit-more
			thrustfr.bit-less thrustrr.bit-less)	       
     (& lat.bit-right dir.SW)
     (thrustfl.hover thrustrl.bit-more
		     thrustfr.bit-less thrustrr.hover)	       
     (& lat.bit-right dir.W)
     (thrustfl.bit-less thrustrl.bit-more
			thrustfr.bit-less thrustrr.bit-more)	       
     (& lat.bit-right dir.NW)
     (thrustfl.bit-less thrustrl.hover
			thrustfr.hover thrustrr.bit-more)

     (& lat.right dir.N)
     (thrustfl.less thrustrl.less
		    thrustfr.more thrustrr.more)	       
     (& lat.right dir.NE)
     (thrustfl.hover thrustrl.less
		     thrustfr.more thrustrr.hover)	       
     (& lat.right dir.E)
     (thrustfl.more thrustrl.less
		    thrustfr.more thrustrr.less)	       
     (& lat.right dir.SE)
     (thrustfl.more thrustrl.hover
		    thrustfr.hover thrustrr.less)	       
     (v (& lat.right dir.S)(& lat.right dir.SS))
     (thrustfl.more thrustrl.more
		    thrustfr.less thrustrr.less)	       
     (& lat.right dir.SW)
     (thrustfl.hover thrustrl.more
		     thrustfr.less thrustrr.hover)	       
     (& lat.right dir.W)
     (thrustfl.less thrustrl.more
		    thrustfr.less thrustrr.more)	       
     (& lat.right dir.NW)
     (thrustfl.less thrustrl.hover
		    thrustfr.hover thrustrr.more)
     
     ;; ======= Position: Longitude =======

     ;; Front
     
     (& lon.front dir.N)
     (thrustfl.more thrustrl.less
		    thrustfr.more thrustrr.less)
     (& lon.front dir.NE)
     (thrustfl.hover thrustrl.less
		     thrustfr.more thrustrr.hover)
     (& lon.front dir.E)
     (thrustfl.more thrustrl.more
		    thrustfr.less thrustrr.less)	    	       
     (& lon.front dir.SE)
     (thrustfl.hover thrustrl.more
		     thrustfr.less thrustrr.hover)	       
     (v (& lon.front dir.S)(& lon.front dir.SS))
     (thrustfl.less thrustrl.more
		    thrustfr.less thrustrr.more)	       
     (& lon.front dir.SW)
     (thrustfl.less thrustrl.hover
		    thrustfr.hover thrustrr.more)	       
     (& lon.front dir.W)
     (thrustfl.less thrustrl.less
		    thrustfr.more thrustrr.more)	       
     (& lon.front dir.NW)
     (thrustfl.hover thrustrl.less
		     thrustfr.more thrustrr.hover)	       
     
     (& lon.bit-front dir.N)
     (thrustfl.bit-more thrustrl.bit-less
			thrustfr.bit-more thrustrr.bit-less)	       
     (& lon.bit-front dir.NE)
     (thrustfl.hover thrustrr.bit-more
		     thrustfl.bit-less thrustrl.hover)
     (& lon.bit-front dir.E)
     (thrustfl.bit-more thrustrl.bit-more
			thrustfr.bit-less thrustrr.bit-less)	    	       
     (& lon.bit-front dir.SE)
     (thrustfl.hover thrustrl.bit-more
		     thrustfr.bit-less thrustrr.hover)	       
     (v (& lon.bit-front dir.S)(& lon.bit-front dir.SS))
     (thrustfl.bit-less thrustrl.bit-more
			thrustfr.bit-less thrustrr.bit-more)	       
     (& lon.bit-front dir.SW)
     (thrustfl.bit-less thrustrl.hover
			thrustfr.hover thrustrr.bit-more)	       
     (& lon.bit-front dir.W)
     (thrustfl.bit-less thrustrl.bit-less
			thrustfr.bit-more thrustrr.bit-more)	       
     (& lon.bit-front dir.NW)
     (thrustfl.hover thrustrl.bit-less
		     thrustfr.bit-more thrustrr.hover)

     ;; --- Zero ---
     lon.zero (thrustfl.hover thrustrl.hover
			      thrustfr.hover thrustrr.hover)

     ;; Back

     (& lon.bit-back dir.N)
     (thrustfl.bit-less thrustrl.bit-more
			thrustfr.bit-less thrustrr.bit-more)
     (& lon.bit-back dir.NE)
     (thrustfl.hover thrustrl.bit-more
		     thrustfr.bit-less thrustrr.hover)
     (& lon.bit-back dir.E)
     (thrustfl.bit-less thrustrl.bit-less
			thrustfr.bit-more thrustrr.bit-more)	    	       
     (& lon.bit-back dir.SE)
     (thrustfl.hover thrustrl.bit-less
		     thrustfr.bit-more thrustrr.hover)	       
     (v (& lon.bit-back dir.S)(& lon.bit-back dir.SS))
     (thrustfl.bit-more thrustrl.bit-less
			thrustfr.bit-more thrustrr.bit-less)	       
     (& lon.bit-back dir.SW)
     (thrustfl.bit-more thrustrl.hover
			thrustfr.hover thrustrr.bit-less)	       
     (& lon.bit-back dir.W)
     (thrustfl.bit-more thrustrl.bit-more
			thrustfr.bit-less thrustrr.bit-less)	       
     (& lon.bit-back dir.NW)
     (thrustfl.hover thrustrl.bit-more
		     thrustfr.bit-less thrustrr.hover)

     (& lon.back dir.N)
     (thrustfl.less thrustrl.more
		    thrustfr.less thrustrr.more)
     (& lon.back dir.NE)
     (thrustfl.hover thrustrl.more
		     thrustfr.less thrustrr.hover)
     (& lon.back dir.E)
     (thrustfl.less thrustrl.less
		    thrustfr.more thrustrr.more)	    	       
     (& lon.back dir.SE)
     (thrustfl.hover thrustrl.less
		     thrustfr.more thrustrr.hover)	       
     (v (& lon.back dir.S)(& lon.back dir.SS))
     (thrustfl.more thrustrl.less
		    thrustfr.more thrustrr.less)	       
     (& lon.back dir.SW)
     (thrustfl.more thrustrl.hover
		    thrustfr.hover thrustrr.less)	       
     (& lon.back dir.W)
     (thrustfl.more thrustrl.more
		    thrustfr.less thrustrr.less)	       
     (& lon.back dir.NW)
     (thrustfl.hover thrustrl.more
		     thrustfr.less thrustrr.hover)

     

     ;; ====== Velocity: Latitude ======

     ;; Left
     
     (& lat.bit-left latv.left dir.N)
     (thrustfl.strong thrustrl.strong
		    thrustfr.descend thrustrr.descend)	       
     (& lat.bit-left latv.left dir.NE)
     (thrustfl.hover thrustrl.strong
		     thrustfr.descend thrustrr.hover)	       
     (& lat.bit-left latv.left dir.E)
     (thrustfl.descend thrustrl.strong
		    thrustfr.descend thrustrr.strong)	       
     (& lat.bit-left latv.left dir.SE)
     (thrustfl.descend thrustrl.hover
		    thrustfr.hover thrustrr.strong)	       
     (v (& lat.bit-left latv.left dir.S)
	(& lat.bit-left latv.left dir.SS))
     (thrustfl.descend thrustrl.descend
		    thrustfr.more thrustrr.more)	       
     (& lat.bit-left latv.left dir.SW)
     (thrustfl.hover thrustrl.descend
		     thrustfr.strong thrustrr.hover)	       
     (& lat.bit-left latv.left dir.W)
     (thrustfl.strong thrustrl.descend
		    thrustfr.strong thrustrr.strong)	       
     (& lat.bit-left latv.left dir.NW)
     (thrustfl.strong thrustrl.hover
		    thrustfr.hover thrustrr.descend)

     (& lat.bit-left latv.bit-left dir.N)
     (thrustfl.more thrustrl.more
			thrustfr.less thrustrr.less)	       
     (& lat.bit-left latv.bit-left dir.NE)
     (thrustfl.hover thrustrl.more
		     thrustfr.less thrustrr.hover)	       
     (& lat.bit-left latv.bit-left dir.E)
     (thrustfl.less thrustrl.more
			thrustfr.less thrustrr.more)	       
     (& lat.bit-left latv.bit-left dir.SE)
     (thrustfl.less thrustrl.hover
			thrustfr.hover thrustrr.more)	       
     (v (& lat.bit-left latv.bit-left dir.S)
	(& lat.bit-left latv.bit-left dir.SS))
     (thrustfl.less thrustrl.less
			thrustfr.more thrustrr.more)	       
     (& lat.bit-left latv.bit-left dir.SW)
     (thrustfl.hover thrustrl.less
		     thrustfr.more thrustrr.hover)	       
     (& lat.bit-left latv.bit-left dir.W)
     (thrustfl.less thrustrl.more
			thrustfr.less thrustrr.more)	       
     (& lat.bit-left latv.bit-left dir.NW)
     (thrustfl.less thrustrl.hover
			thrustfr.hover thrustrr.more)

     ;; Zero - Left
     
     (& lat.zero latv.left dir.N)
     (thrustfl.more thrustrl.more
		    thrustfr.less thrustrr.less)	       
     (& lat.zero latv.left dir.NE)
     (thrustfl.hover thrustrl.more
		     thrustfr.less thrustrr.hover)	       
     (& lat.zero latv.left dir.E)
     (thrustfl.less thrustrl.more
		    thrustfr.less thrustrr.more)	       
     (& lat.zero latv.left dir.SE)
     (thrustfl.less thrustrl.hover
		    thrustfr.hover thrustrr.more)	       
     (v (& lat.zero latv.left dir.S)(& lat.zero latv.left dir.SS))
     (thrustfl.less thrustrl.less
		    thrustfr.more thrustrr.more)	       
     (& lat.zero latv.left dir.SW)
     (thrustfl.hover thrustrl.less
		     thrustfr.more thrustrr.hover)	       
     (& lat.zero latv.left dir.W)
     (thrustfl.more thrustrl.less
		    thrustfr.more thrustrr.less)	       
     (& lat.zero latv.left dir.NW)
     (thrustfl.more thrustrl.hover
		    thrustfr.hover thrustrr.less)

     (& lat.zero latv.bit-left dir.N)
     (thrustfl.bit-more thrustrl.bit-more
			thrustfr.bit-less thrustrr.bit-less)	       
     (& lat.zero latv.bit-left dir.NE)
     (thrustfl.hover thrustrl.bit-more
		     thrustfr.bit-less thrustrr.hover)	       
     (& lat.zero latv.bit-left dir.E)
     (thrustfl.bit-less thrustrl.bit-more
			thrustfr.bit-less thrustrr.bit-more)	       
     (& lat.zero latv.bit-left dir.SE)
     (thrustfl.bit-less thrustrl.hover
			thrustfr.hover thrustrr.bit-more)	       
     (v (& lat.zero latv.bit-left dir.S)(& lat.zero latv.bit-left dir.SS))
     (thrustfl.bit-less thrustrl.bit-less
			thrustfr.bit-more thrustrr.bit-more)	       
     (& lat.zero latv.bit-left dir.SW)
     (thrustfl.hover thrustrl.bit-less
		     thrustfr.bit-more thrustrr.hover)	       
     (& lat.zero latv.bit-left dir.W)
     (thrustfl.bit-less thrustrl.bit-more
			thrustfr.bit-less thrustrr.bit-more)	       
     (& lat.zero latv.bit-left dir.NW)
     (thrustfl.bit-less thrustrl.hover
			thrustfr.hover thrustrr.bit-more)

     ;; Zero - Right
     
     (& lat.zero latv.bit-right dir.N)
     (thrustfl.less thrustrl.less
		    thrustfr.more thrustrr.more)
     (& lat.zero latv.bit-right dir.NE)
     (thrustfl.hover thrustrl.less
		     thrustfr.more thrustrr.hover)
     (& lat.zero latv.bit-right dir.E)
     (thrustfl.more thrustrl.less
		    thrustfr.more thrustrr.less)	       
     (& lat.zero latv.bit-right dir.SE)
     (thrustfl.more thrustrl.hover
		    thrustfr.hover thrustrr.less)	       
     (v (& lat.zero latv.bit-right dir.S)
	(& lat.zero latv.bit-right dir.SS))
     (thrustfl.more thrustrl.more
		    thrustfr.less thrustrr.less)	       
     (& lat.zero latv.bit-right dir.SW)
     (thrustfl.hover thrustrl.more
		     thrustfr.less thrustrr.hover)	       
     (& lat.zero latv.bit-right dir.W)
     (thrustfl.less thrustrl.more
		    thrustfr.less thrustrr.more)	       
     (& lat.zero latv.bit-right dir.NW)
     (thrustfl.less thrustrl.hover
		    thrustfr.hover thrustrr.more)

     (& lat.zero latv.right dir.N)
     (thrustfl.descend.5 thrustrl.descend.5
			 thrustfr.more.5 thrustrr.more.5)	       
     (& lat.zero latv.right dir.NE)
     (thrustfl.hover thrustrl.descend.5
		     thrustfr.more.5 thrustrr.hover)	       
     (& lat.zero latv.right dir.E)
     (thrustfl.more.5 thrustrl.descend.5
		      thrustfr.more.5 thrustrr.descend.5)	       
     (& lat.zero latv.right dir.SE)
     (thrustfl.more.5 thrustrl.hover
		      thrustfr.hover thrustrr.descend.5)	       
     (v (& lat.zero latv.right dir.S)
	(& lat.zero latv.right dir.SS))
     (thrustfl.more.5 thrustrl.more.5
		      thrustfr.descend.5 thrustrr.descend.5)	       
     (& lat.zero latv.right dir.SW)
     (thrustfl.hover thrustrl.more.5
		     thrustfr.descend.5 thrustrr.hover)	       
     (& lat.zero latv.right dir.W)
     (thrustfl.descend.5 thrustrl.more.5
			 thrustfr.descend.5 thrustrr.more.5)	       
     (& lat.zero latv.right dir.NW)
     (thrustfl.descend.5 thrustrl.hover
			 thrustfr.hover thrustrr.more.5)

     ;; Right

     (& lat.bit-right latv.bit-right dir.N)
     (thrustfl.less thrustrl.less
		    thrustfr.more thrustrr.more)
     (& lat.bit-right latv.bit-right dir.NE)
     (thrustfl.hover thrustrl.less
		     thrustfr.more thrustrr.hover)
     (& lat.bit-right latv.bit-right dir.E)
     (thrustfl.more thrustrl.less
		    thrustfr.more thrustrr.less)	       
     (& lat.bit-right latv.bit-right dir.SE)
     (thrustfl.more thrustrl.hover
		    thrustfr.hover thrustrr.less)	       
     (v (& lat.bit-right latv.bit-right dir.S)
	(& lat.bit-right latv.bit-right dir.SS))
     (thrustfl.more thrustrl.more
		    thrustfr.less thrustrr.less)	       
     (& lat.bit-right latv.bit-right dir.SW)
     (thrustfl.hover thrustrl.more
		     thrustfr.less thrustrr.hover)	       
     (& lat.bit-right latv.bit-right dir.W)
     (thrustfl.less thrustrl.more
		    thrustfr.less thrustrr.more)	       
     (& lat.bit-right latv.bit-right dir.NW)
     (thrustfl.less thrustrl.hover
		    thrustfr.hover thrustrr.more)

     (& lat.bit-right latv.right dir.N)
     (thrustfl.descend.5 thrustrl.descend.5
			 thrustfr.more.5 thrustrr.more.5)	       
     (& lat.bit-right latv.right dir.NE)
     (thrustfl.hover thrustrl.descend.5
		     thrustfr.more.5 thrustrr.hover)	       
     (& lat.bit-right latv.right dir.E)
     (thrustfl.more.5 thrustrl.descend.5
		      thrustfr.more.5 thrustrr.descend.5)	       
     (& lat.bit-right latv.right dir.SE)
     (thrustfl.more.5 thrustrl.hover
		      thrustfr.hover thrustrr.descend.5)	       
     (v (& lat.bit-right latv.right dir.S)
	(& lat.bit-right latv.right dir.SS))
     (thrustfl.more.5 thrustrl.more.5
		      thrustfr.descend.5 thrustrr.descend.5)	       
     (& lat.bit-right latv.right dir.SW)
     (thrustfl.hover thrustrl.more.5
		     thrustfr.descend.5 thrustrr.hover)	       
     (& lat.bit-right latv.right dir.W)
     (thrustfl.descend.5 thrustrl.more.5
			 thrustfr.descend.5 thrustrr.more.5)	       
     (& lat.bit-right latv.right dir.NW)
     (thrustfl.descend.5 thrustrl.hover
			 thrustfr.hover thrustrr.more.5)

     

     ;; ====== Velocity: Longitude ======

     ;; Zero - Front

     (& lon.zero lonv.front dir.N)
     (thrustfl.more.5 thrustrl.descend.5
		    thrustfr.more.5 thrustrr.descend.5)
     (& lon.zero lonv.front dir.NE)
     (thrustfl.hover thrustrl.descend.5
		     thrustfr.more.5 thrustrr.hover)
     (& lon.zero lonv.front dir.E)
     (thrustfl.more.5 thrustrl.more.5
		    thrustfr.descend.5 thrustrr.descend.5)	    	       
     (& lon.zero lonv.front dir.SE)
     (thrustfl.hover thrustrl.more.5
		     thrustfr.descend.5 thrustrr.hover)	       
     (v (& lon.zero lonv.front dir.S)(& lon.zero lonv.front dir.SS))
     (thrustfl.descend.5 thrustrl.more.5
		    thrustfr.descend.5 thrustrr.more.5)	       
     (& lon.zero lonv.front dir.SW)
     (thrustfl.descend.5 thrustrl.hover
		    thrustfr.hover thrustrr.more.5)	       
     (& lon.zero lonv.front dir.W)
     (thrustfl.descend.5 thrustrl.descend.5
		    thrustfr.more.5 thrustrr.more.5)	       
     (& lon.zero lonv.front dir.NW)
     (thrustfl.hover thrustrl.descend.5
		     thrustfr.more.5 thrustrr.hover)	       
     
     (& lon.zero lonv.bit-front dir.N)
     (thrustfl.more thrustrl.less
			thrustfr.more thrustrr.less)	       
     (& lon.zero lonv.bit-front dir.NE)
     (thrustfl.hover thrustrr.more
		     thrustfl.less thrustrl.hover)
     (& lon.zero lonv.bit-front dir.E)
     (thrustfl.more thrustrl.more
			thrustfr.less thrustrr.less)	    	       
     (& lon.zero lonv.bit-front dir.SE)
     (thrustfl.hover thrustrl.more
		     thrustfr.less thrustrr.hover)	       
     (v (& lon.zero lonv.bit-front dir.S)(& lon.zero lonv.bit-front dir.SS))
     (thrustfl.less thrustrl.more
			thrustfr.less thrustrr.more)	       
     (& lon.zero lonv.bit-front dir.SW)
     (thrustfl.less thrustrl.hover
			thrustfr.hover thrustrr.more)	       
     (& lon.zero lonv.bit-front dir.W)
     (thrustfl.less thrustrl.less
			thrustfr.more thrustrr.more)	       
     (& lon.zero lonv.bit-front dir.NW)
     (thrustfl.hover thrustrl.less
		     thrustfr.more thrustrr.hover)

     ;; Zero - Back

     (& lon.zero lonv.bit-back dir.N)
     (thrustfl.less thrustrl.more
			thrustfr.less thrustrr.more)
     (& lon.zero lonv.bit-back dir.NE)
     (thrustfl.hover thrustrl.more
		     thrustfr.less thrustrr.hover)
     (& lon.zero lonv.bit-back dir.E)
     (thrustfl.less thrustrl.less
			thrustfr.more thrustrr.more)	    	       
     (& lon.zero lonv.bit-back dir.SE)
     (thrustfl.hover thrustrl.less
		     thrustfr.more thrustrr.hover)	       
     (v (& lon.zero lonv.bit-back dir.S)(& lonv.bit-back dir.SS))
     (thrustfl.more thrustrl.less
			thrustfr.more thrustrr.less)	       
     (& lon.zero lonv.bit-back dir.SW)
     (thrustfl.more thrustrl.hover
			thrustfr.hover thrustrr.less)	       
     (& lon.zero lonv.bit-back dir.W)
     (thrustfl.more thrustrl.more
			thrustfr.less thrustrr.less)	       
     (& lon.zero lonv.bit-back dir.NW)
     (thrustfl.hover thrustrl.more
		     thrustfr.less thrustrr.hover)

     (& lon.zero lonv.back dir.N)
     (thrustfl.descend.5 thrustrl.more.5
		    thrustfr.descend.5 thrustrr.more.5)
     (& lon.zero lonv.back dir.NE)
     (thrustfl.hover thrustrl.more.5
		     thrustfr.descend.5 thrustrr.hover)
     (& lon.zero lonv.back dir.E)
     (thrustfl.descend.5 thrustrl.descend.5
		    thrustfr.more.5 thrustrr.more.5)	    	       
     (& lon.zero lonv.back dir.SE)
     (thrustfl.hover thrustrl.descend.5
		     thrustfr.more.5 thrustrr.hover)	       
     (v (& lon.zero lonv.back dir.S)(& lon.zero lonv.back dir.SS))
     (thrustfl.more.5 thrustrl.descend.5
		    thrustfr.more.5 thrustrr.descend.5)	       
     (& lon.zero lonv.back dir.SW)
     (thrustfl.more.5 thrustrl.hover
		    thrustfr.hover thrustrr.descend.5)	       
     (& lon.zero lonv.back dir.W)
     (thrustfl.more.5 thrustrl.more.5
		    thrustfr.descend.5 thrustrr.descend.5)	       
     (& lon.zero lonv.back dir.NW)
     (thrustfl.hover thrustrl.more.5
		     thrustfr.descend.5 thrustrr.hover)
     
     )))





     
     
 













     
     
     ;; ======= Longitude =======
     


















     
     #|
     (& lat.left dir.N)
     (thrustfl.more thrustrl.more
		    thrustfr.less thrustrr.less)	       
     (& lat.left dir.NE)
     (thrustfl.hover thrustrl.more
		     thrustfr.less thrustrr.hover)	       
     (& lat.left dir.E)
     (thrustfl.less thrustrl.more
		    thrustfr.less thrustrr.more)	       
     (& lat.left dir.SE)
     (thrustfl.less thrustrl.hover
		    thrustfr.hover thrustrr.more)	       
     (v (& lat.left dir.S)(& lat.left dir.SS))
     (thrustfl.less thrustrl.less
		    thrustfr.more thrustrr.more)	       
     (& lat.left dir.SW)
     (thrustfl.hover thrustrl.less
		     thrustfr.more thrustrr.hover)	       
     (& lat.left dir.W)
     (thrustfl.more thrustrl.less
		    thrustfr.more thrustrr.less)	       
     (& lat.left dir.NW)
     (thrustfl.more thrustrl.hover
		    thrustfr.hover thrustrr.less)	       

     (& lat.right dir.N)
     (thrustfl.less thrustrl.less
		    thrustfr.more thrustrr.more)	       
     (& lat.right dir.NE)
     (thrustfl.hover thrustrl.less
		     thrustfr.more thrustrr.hover)	       
     (& lat.right dir.E)
     (thrustfl.more thrustrl.less
		    thrustfr.more thrustrr.less)	       
     (& lat.right dir.SE)
     (thrustfl.more thrustrl.hover
		    thrustfr.hover thrustrr.less)	       
     (v (& lat.right dir.S)(& lat.bit-right dir.SS))
     (thrustfl.more thrustrl.more
		    thrustfr.less thrustrr.less)	       
     (& lat.right dir.SW)
     (thrustfl.hover thrustrl.more
		     thrustfr.less thrustrr.hover)	       
     (& lat.right dir.W)
     (thrustfl.less thrustrl.more
		    thrustfr.less thrustrr.more)	       
     (& lat.right dir.NW)
     (thrustfl.less thrustrl.hover
		    thrustfr.hover thrustrr.more)
     
     (& lat.bit-left dir.N)
     (thrustfl.bit-more thrustrl.bit-more
			thrustfr.hover thrustrr.hover)	       
     (& lat.bit-left dir.NE)
     (thrustfl.hover thrustrl.bit-more
		     thrustfr.bit-less thrustrr.hover)	       
     (& lat.bit-left dir.E)
     (thrustfl.hover thrustrl.bit-more
			thrustfr.hover thrustrr.bit-more)	       
     (& lat.bit-left dir.SE)
     (thrustfl.bit-less thrustrl.hover
			thrustfr.hover thrustrr.bit-more)	       
     (v (& lat.bit-left dir.S)(& lat.bit-left dir.SS))
     (thrustfl.hover thrustrl.hover
			thrustfr.bit-more thrustrr.bit-more)	       
     (& lat.bit-left dir.SW)
     (thrustfl.hover thrustrl.bit-less
		     thrustfr.bit-more thrustrr.hover)	       
     (& lat.bit-left dir.W)
     (thrustfl.hover thrustrl.bit-more
			thrustfr.hover thrustrr.bit-more)	       
     (& lat.bit-left dir.NW)
     (thrustfl.bit-less thrustrl.hover
			thrustfr.hover thrustrr.bit-more)

     (& lat.bit-right dir.N)
     (thrustfl.hover thrustrl.hover
			thrustfr.bit-more thrustrr.bit-more)	       
     (& lat.bit-right dir.NE)
     (thrustfl.hover thrustrl.bit-less
		     thrustfr.bit-more thrustrr.hover)	       
     (& lat.bit-right dir.E)
     (thrustfl.bit-more thrustrl.hover
			thrustfr.bit-more thrustrr.hover)	       
     (& lat.bit-right dir.SE)
     (thrustfl.bit-more thrustrl.hover
		     thrustfr.hover thrustrr.bit-less)	       
     (v (& lat.bit-right dir.S)(& lat.bit-right dir.SS))
     (thrustfl.bit-more thrustrl.bit-more
			thrustfr.hover thrustrr.hover)	       
     (& lat.bit-right dir.SW)
     (thrustfl.hover thrustrl.bit-more
		     thrustfr.bit-less thrustrr.hover)	       
     (& lat.bit-right dir.W)
     (thrustfl.hover thrustrl.bit-more
			thrustfr.hover thrustrr.bit-more)	       
     (& lat.bit-right dir.NW)
     (thrustfl.bit-less thrustrl.hover
			thrustfr.hover thrustrr.bit-more)

     ;; Zero
     
     lat.zero (thrustfl.hover thrustrl.hover
			      thrustfr.hover thrustrr.hover)
     lon.zero (thrustfl.hover thrustrl.hover
			      thrustfr.hover thrustrr.hover)
     
     ;; ======= Longitude =======
     
     (& lon.bit-front dir.N)
     (thrustfr.bit-more thrustrr.hover
			thrustfl.bit-more thrustrl.hover)	       
     (& lon.bit-front dir.NE)
     (thrustfr.hover thrustrr.bit-more
		     thrustfl.bit-less thrustrl.hover)
     (& lon.bit-front dir.E)
     (thrustfl.bit-more thrustrl.bit-more
			thrustfr.hover thrustrr.hover)	    	       
     (& lon.bit-front dir.SE)
     (thrustfl.hover thrustrl.bit-more
		     thrustfr.bit-less thrustrr.hover)	       
     (v (& lon.bit-front dir.S)(& lon.bit-front dir.SS))
     (thrustfl.hover thrustrl.bit-more
			thrustfr.hover thrustrr.bit-more)	       
     (& lon.bit-front dir.SW)
     (thrustfl.bit-less thrustrl.hover
			thrustfr.hover thrustrr.bit-more)	       
     (& lon.bit-front dir.W)
     (thrustfl.hover thrustrl.hover
			thrustfr.bit-more thrustrr.bit-more)	       
     (& lon.bit-front dir.NW)
     (thrustfl.hover thrustrl.bit-less
		     thrustfr.bit-more thrustrr.hover)	       

     (& lon.bit-back dir.N)
     (thrustfr.hover thrustrr.bit-more
			thrustfl.hover thrustrl.bit-more)
     (& lon.bit-back dir.NE)
     (thrustfr.hover thrustrr.bit-more
		     thrustfl.bit-less thrustrl.hover)
     (& lon.bit-back dir.E)
     (thrustfl.hover thrustrl.hover
			thrustfr.bit-more thrustrr.bit-more)	    	       
     (& lon.bit-back dir.SE)
     (thrustfl.hover thrustrl.bit-less
			thrustfr.bit-more thrustrr.hover)	       
     (v (& lon.bit-back dir.S)(& lon.bit-back dir.SS))
     (thrustfl.bit-more thrustrl.hover
			thrustfr.bit-more thrustrr.hover)	       
     (& lon.bit-back dir.SW)
     (thrustfl.bit-more thrustrl.hover
			thrustfr.hover thrustrr.bit-less)	       
     (& lon.bit-back dir.W)
     (thrustfl.bit-more thrustrl.bit-more
			thrustfr.hover thrustrr.hover)	       
     (& lon.bit-back dir.NW)
     (thrustfl.hover thrustrl.bit-more
		     thrustfr.bit-less thrustrr.hover)

     (& lon.front dir.N)
     (thrustfr.more thrustrr.less
		    thrustfl.more thrustrl.less)
     (& lon.front dir.NE)
     (thrustfr.hover thrustrr.less
		     thrustfl.more thrustrl.hover)
     (& lon.front dir.E)
     (thrustfl.more thrustrl.more
		    thrustfr.less thrustrr.less)	    	       
     (& lon.front dir.SE)
     (thrustfl.hover thrustrl.more
		     thrustfr.less thrustrr.hover)	       
     (v (& lon.front dir.S)(& lon.front dir.SS))
     (thrustfl.less thrustrl.more
		    thrustfr.less thrustrr.more)	       
     (& lon.front dir.SW)
     (thrustfl.less thrustrl.hover
		    thrustfr.hover thrustrr.more)	       
     (& lon.front dir.W)
     (thrustfl.less thrustrl.less
		    thrustfr.more thrustrr.more)	       
     (& lon.front dir.NW)
     (thrustfl.hover thrustrl.less
		     thrustfr.more thrustrr.hover)	       

     (& lon.back dir.N)
     (thrustfr.less thrustrr.more
		    thrustfl.less thrustrl.more)
     (& lon.back dir.NE)
     (thrustfr.hover thrustrr.more
		     thrustfl.less thrustrl.hover)
     (& lon.back dir.E)
     (thrustfl.less thrustrl.less
		    thrustfr.more thrustrr.more)	    	       
     (& lon.back dir.SE)
     (thrustfl.hover thrustrl.less
		    thrustfr.more thrustrr.hover)	       
     (v (& lon.back dir.S)(& lon.back dir.SS))
     (thrustfl.more thrustrl.less
		    thrustfr.more thrustrr.less)	       
     (& lon.back dir.SW)
     (thrustfl.more thrustrl.hover
		    thrustfr.hover thrustrr.less)	       
     (& lon.back dir.W)
     (thrustfl.more thrustrl.more
		    thrustfr.less thrustrr.less)	       
     (& lon.back dir.NW)
     (thrustfl.hover thrustrl.more
		     thrustfr.less thrustrr.hover)
     |#

     ;; ======= Latitude =======
     #|
     (& lat.way-left dir.N)
     (thrustfl.strong thrustrl.strong
		    thrustfr.descend.5 thrustrr.descend.5)	       
     (& lat.way-left dir.NE)
     (thrustfl.hover thrustrl.strong
		     thrustfr.descend.5 thrustrr.hover)	       
     (& lat.way-left dir.E)
     (thrustfl.descend.5 thrustrl.strong
		    thrustfr.descend.5 thrustrr.strong)	       
     (& lat.way-left dir.SE)
     (thrustfl.descend.5 thrustrl.hover
		    thrustfr.hover thrustrr.strong)	       
     (v (& lat.way-left dir.S)(& lat.left dir.SS))
     (thrustfl.descend.5 thrustrl.descend.5
		    thrustfr.strong thrustrr.strong)	       
     (& lat.way-left dir.SW)
     (thrustfl.hover thrustrl.descend.5
		     thrustfr.strong thrustrr.hover)	       
     (& lat.way-left dir.W)
     (thrustfl.strong thrustrl.descend.5
		    thrustfr.strong thrustrr.descend.5)	       
     (& lat.way-left dir.NW)
     (thrustfl.strong thrustrl.hover
		    thrustfr.hover thrustrr.descend.5)	       

     (& lat.way-right dir.N)
     (thrustfl.descend.5 thrustrl.descend.5
		    thrustfr.strong thrustrr.strong)	       
     (& lat.way-right dir.NE)
     (thrustfl.hover thrustrl.descend.5
		     thrustfr.strong thrustrr.hover)	       
     (& lat.way-right dir.E)
     (thrustfl.strong thrustrl.descend.5
		    thrustfr.strong thrustrr.descend.5)	       
     (& lat.way-right dir.SE)
     (thrustfl.strong thrustrl.hover
		    thrustfr.hover thrustrr.descend.5)	       
     (v (& lat.way-right dir.S)(& lat.bit-right dir.SS))
     (thrustfl.strong thrustrl.strong
		    thrustfr.descend.5 thrustrr.descend.5)	       
     (& lat.way-right dir.SW)
     (thrustfl.hover thrustrl.strong
		     thrustfr.descend.5 thrustrr.hover)	       
     (& lat.way-right dir.W)
     (thrustfl.descend.5 thrustrl.strong
		    thrustfr.descend.5 thrustrr.strong)	       
     (& lat.way-right dir.NW)
     (thrustfl.descend.5 thrustrl.hover
		    thrustfr.hover thrustrr.strong)
     |#

     #|

     (& lat.left dir.N)
     (thrustfl.more thrustrl.more
		    thrustfr.less thrustrr.less)	       
     (& lat.left dir.NE)
     (thrustfl.hover thrustrl.more
		     thrustfr.less thrustrr.hover)	       
     (& lat.left dir.E)
     (thrustfl.less thrustrl.more
		    thrustfr.less thrustrr.more)	       
     (& lat.left dir.SE)
     (thrustfl.less thrustrl.hover
		    thrustfr.hover thrustrr.more)	       
     (v (& lat.left dir.S)(& lat.left dir.SS))
     (thrustfl.less thrustrl.less
		    thrustfr.more thrustrr.more)	       
     (& lat.left dir.SW)
     (thrustfl.hover thrustrl.less
		     thrustfr.more thrustrr.hover)	       
     (& lat.left dir.W)
     (thrustfl.more thrustrl.less
		    thrustfr.more thrustrr.less)	       
     (& lat.left dir.NW)
     (thrustfl.more thrustrl.hover
		    thrustfr.hover thrustrr.less)	       

     (& lat.right dir.N)
     (thrustfl.less thrustrl.less
		    thrustfr.more thrustrr.more)	       
     (& lat.right dir.NE)
     (thrustfl.hover thrustrl.less
		     thrustfr.more thrustrr.hover)	       
     (& lat.right dir.E)
     (thrustfl.more thrustrl.less
		    thrustfr.more thrustrr.less)	       
     (& lat.right dir.SE)
     (thrustfl.more thrustrl.hover
		    thrustfr.hover thrustrr.less)	       
     (v (& lat.right dir.S)(& lat.bit-right dir.SS))
     (thrustfl.more thrustrl.more
		    thrustfr.less thrustrr.less)	       
     (& lat.right dir.SW)
     (thrustfl.hover thrustrl.more
		     thrustfr.less thrustrr.hover)	       
     (& lat.right dir.W)
     (thrustfl.less thrustrl.more
		    thrustfr.less thrustrr.more)	       
     (& lat.right dir.NW)
     (thrustfl.less thrustrl.hover
		    thrustfr.hover thrustrr.more)
     
     (& lat.bit-left dir.N)
     (thrustfl.bit-more thrustrl.bit-more
			thrustfr.bit-less thrustrr.bit-less)	       
     (& lat.bit-left dir.NE)
     (thrustfl.hover thrustrl.bit-more
		     thrustfr.bit-less thrustrr.hover)	       
     (& lat.bit-left dir.E)
     (thrustfl.bit-less thrustrl.bit-more
			thrustfr.bit-less thrustrr.bit-more)	       
     (& lat.bit-left dir.SE)
     (thrustfl.bit-less thrustrl.hover
			thrustfr.hover thrustrr.bit-more)	       
     (v (& lat.bit-left dir.S)(& lat.bit-left dir.SS))
     (thrustfl.bit-less thrustrl.bit-less
			thrustfr.bit-more thrustrr.bit-more)	       
     (& lat.bit-left dir.SW)
     (thrustfl.hover thrustrl.bit-less
		     thrustfr.bit-more thrustrr.hover)	       
     (& lat.bit-left dir.W)
     (thrustfl.bit-less thrustrl.bit-more
			thrustfr.bit-less thrustrr.bit-more)	       
     (& lat.bit-left dir.NW)
     (thrustfl.bit-less thrustrl.hover
			thrustfr.hover thrustrr.bit-more)

     (& lat.bit-right dir.N)
     (thrustfl.bit-less thrustrl.bit-less
			thrustfr.bit-more thrustrr.bit-more)	       
     (& lat.bit-right dir.NE)
     (thrustfl.hover thrustrl.bit-less
		     thrustfr.bit-more thrustrr.hover)	       
     (& lat.bit-right dir.E)
     (thrustfl.bit-more thrustrl.bit-less
			thrustfr.bit-more thrustrr.bit-less)	       
     (& lat.bit-right dir.SE)
     (thrustfl.bit-more thrustrl.hover
		     thrustfr.hover thrustrr.bit-less)	       
     (v (& lat.bit-right dir.S)(& lat.bit-right dir.SS))
     (thrustfl.bit-more thrustrl.bit-more
			thrustfr.bit-less thrustrr.bit-less)	       
     (& lat.bit-right dir.SW)
     (thrustfl.hover thrustrl.bit-more
		     thrustfr.bit-less thrustrr.hover)	       
     (& lat.bit-right dir.W)
     (thrustfl.bit-less thrustrl.bit-more
			thrustfr.bit-less thrustrr.bit-more)	       
     (& lat.bit-right dir.NW)
     (thrustfl.bit-less thrustrl.hover
			thrustfr.hover thrustrr.bit-more)

     ;; Zero
     
     lat.zero (thrustfl.hover thrustrl.hover
			      thrustfr.hover thrustrr.hover)
     lon.zero (thrustfl.hover thrustrl.hover
			      thrustfr.hover thrustrr.hover)
     
     ;; ======= Longitude =======
     
     (& lon.bit-front dir.N)
     (thrustfr.bit-more thrustrr.bit-less
			thrustfl.bit-more thrustrl.bit-less)	       
     (& lon.bit-front dir.NE)
     (thrustfr.hover thrustrr.bit-more
		     thrustfl.bit-less thrustrl.hover)
     (& lon.bit-front dir.E)
     (thrustfl.bit-more thrustrl.bit-more
			thrustfr.bit-less thrustrr.bit-less)	    	       
     (& lon.bit-front dir.SE)
     (thrustfl.hover thrustrl.bit-more
		     thrustfr.bit-less thrustrr.hover)	       
     (v (& lon.bit-front dir.S)(& lon.bit-front dir.SS))
     (thrustfl.bit-less thrustrl.bit-more
			thrustfr.bit-less thrustrr.bit-more)	       
     (& lon.bit-front dir.SW)
     (thrustfl.bit-less thrustrl.hover
			thrustfr.hover thrustrr.bit-more)	       
     (& lon.bit-front dir.W)
     (thrustfl.bit-less thrustrl.bit-less
			thrustfr.bit-more thrustrr.bit-more)	       
     (& lon.bit-front dir.NW)
     (thrustfl.hover thrustrl.bit-less
		     thrustfr.bit-more thrustrr.hover)	       

     (& lon.bit-back dir.N)
     (thrustfr.bit-less thrustrr.bit-more
			thrustfl.bit-less thrustrl.bit-more)
     (& lon.bit-back dir.NE)
     (thrustfr.hover thrustrr.bit-more
		     thrustfl.bit-less thrustrl.hover)
     (& lon.bit-back dir.E)
     (thrustfl.bit-less thrustrl.bit-less
			thrustfr.bit-more thrustrr.bit-more)	    	       
     (& lon.bit-back dir.SE)
     (thrustfl.hover thrustrl.bit-less
			thrustfr.bit-more thrustrr.hover)	       
     (v (& lon.bit-back dir.S)(& lon.bit-back dir.SS))
     (thrustfl.bit-more thrustrl.bit-less
			thrustfr.bit-more thrustrr.bit-less)	       
     (& lon.bit-back dir.SW)
     (thrustfl.bit-more thrustrl.hover
			thrustfr.hover thrustrr.bit-less)	       
     (& lon.bit-back dir.W)
     (thrustfl.bit-more thrustrl.bit-more
			thrustfr.bit-less thrustrr.bit-less)	       
     (& lon.bit-back dir.NW)
     (thrustfl.hover thrustrl.bit-more
		     thrustfr.bit-less thrustrr.hover)

     (& lon.front dir.N)
     (thrustfr.more thrustrr.less
		    thrustfl.more thrustrl.less)
     (& lon.front dir.NE)
     (thrustfr.hover thrustrr.less
		     thrustfl.more thrustrl.hover)
     (& lon.front dir.E)
     (thrustfl.more thrustrl.more
		    thrustfr.less thrustrr.less)	    	       
     (& lon.front dir.SE)
     (thrustfl.hover thrustrl.more
		     thrustfr.less thrustrr.hover)	       
     (v (& lon.front dir.S)(& lon.front dir.SS))
     (thrustfl.less thrustrl.more
		    thrustfr.less thrustrr.more)	       
     (& lon.front dir.SW)
     (thrustfl.less thrustrl.hover
		    thrustfr.hover thrustrr.more)	       
     (& lon.front dir.W)
     (thrustfl.less thrustrl.less
		    thrustfr.more thrustrr.more)	       
     (& lon.front dir.NW)
     (thrustfl.hover thrustrl.less
		     thrustfr.more thrustrr.hover)	       

     (& lon.back dir.N)
     (thrustfr.less thrustrr.more
		    thrustfl.less thrustrl.more)
     (& lon.back dir.NE)
     (thrustfr.hover thrustrr.more
		     thrustfl.less thrustrl.hover)
     (& lon.back dir.E)
     (thrustfl.less thrustrl.less
		    thrustfr.more thrustrr.more)	    	       
     (& lon.back dir.SE)
     (thrustfl.hover thrustrl.less
		    thrustfr.more thrustrr.hover)	       
     (v (& lon.back dir.S)(& lon.back dir.SS))
     (thrustfl.more thrustrl.less
		    thrustfr.more thrustrr.less)	       
     (& lon.back dir.SW)
     (thrustfl.more thrustrl.hover
		    thrustfr.hover thrustrr.less)	       
     (& lon.back dir.W)
     (thrustfl.more thrustrl.more
		    thrustfr.less thrustrr.less)	       
     (& lon.back dir.NW)
     (thrustfl.hover thrustrl.more
		     thrustfr.less thrustrr.hover)

     |#

     #|
     (& lon.way-front dir.N)
     (thrustfr.strong thrustrr.descend.5
		    thrustfl.strong thrustrl.descend.5)
     (& lon.way-front dir.NE)
     (thrustfr.hover thrustrr.descend.5
		     thrustfl.strong thrustrl.hover)
     (& lon.way-front dir.E)
     (thrustfl.strong thrustrl.strong
		    thrustfr.descend.5 thrustrr.descend.5)	    	       
     (& lon.way-front dir.SE)
     (thrustfl.hover thrustrl.strong
		     thrustfr.descend.5 thrustrr.hover)	       
     (v (& lon.front dir.S)(& lon.front dir.SS))
     (thrustfl.descend.5 thrustrl.strong
		    thrustfr.descend.5 thrustrr.strong)	       
     (& lon.front dir.SW)
     (thrustfl.descend.5 thrustrl.hover
		    thrustfr.hover thrustrr.strong)	       
     (& lon.front dir.W)
     (thrustfl.descend.5 thrustrl.descend.5
		    thrustfr.strong thrustrr.strong)	       
     (& lon.front dir.NW)
     (thrustfl.hover thrustrl.descend.5
		     thrustfr.strong thrustrr.hover)	       

     (& lon.way-back dir.N)
     (thrustfr.descend.5 thrustrr.strong
		    thrustfl.descend.5 thrustrl.strong)
     (& lon.way-back dir.NE)
     (thrustfr.hover thrustrr.strong
		     thrustfl.descend.5 thrustrl.hover)
     (& lon.way-back dir.E)
     (thrustfl.descend.5 thrustrl.descend.5
		    thrustfr.strong thrustrr.strong)	    	       
     (& lon.way-back dir.SE)
     (thrustfl.hover thrustrl.descend.5
		    thrustfr.strong thrustrr.hover)	       
     (v (& lon.way-back dir.S)(& lon.back dir.SS))
     (thrustfl.strong thrustrl.descend.5
		    thrustfr.strong thrustrr.descend.5)	       
     (& lon.way-back dir.SW)
     (thrustfl.strong thrustrl.hover
		    thrustfr.hover thrustrr.descend.5)	       
     (& lon.way-back dir.W)
     (thrustfl.strong thrustrl.strong
		    thrustfr.descend.5 thrustrr.descend.5)	       
     (& lon.way-back dir.NW)
     (thrustfl.hover thrustrl.strong
		     thrustfr.descend.5 thrustrr.hover)
     |#


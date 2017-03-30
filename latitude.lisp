(in-package #:xp-nap)

(defrules latitude
    ((lat latx)
     (dir direction)
     (thrustfl thrust)
     (thrustfr thrust)
     (thrustrl thrust)
     (thrustrr thrust))

  ;; ====== Position: Latitude ======

  ;; Left
  
  (& lat.way-left dir.N)
  (thrustfl.more+ thrustrl.more+
		  thrustfr.less- thrustrr.less-)	       
  (& lat.way-left dir.NE)
  (thrustfl.hover thrustrl.more+
		  thrustfr.less- thrustrr.hover)	       
  (& lat.left dir.E)
  (thrustfl.less- thrustrl.more+
		  thrustfr.less- thrustrr.more+)	       
  (& lat.way-left dir.SE)
  (thrustfl.less- thrustrl.hover
		  thrustfr.hover thrustrr.more+)	       
  (v (& lat.way-left dir.S)
     (& lat.way-left dir.SS))
  (thrustfl.less- thrustrl.less-
		  thrustfr.more+ thrustrr.more+)	       
  (& lat.way-left dir.SW)
  (thrustfl.hover thrustrl.less-
		  thrustfr.more+ thrustrr.hover)	       
  (& lat.way-left dir.W)
  (thrustfl.more+ thrustrl.less-
		  thrustfr.more+ thrustrr.less-)	       
  (& lat.way-left dir.NW)
  (thrustfl.more+ thrustrl.hover
		  thrustfr.hover thrustrr.less-)	       

  (& lat.left dir.N)
  (thrustfl.bit-more thrustrl.bit-more
		     thrustfr.bit-less thrustrr.bit-less)	       
  (& lat.left dir.NE)
  (thrustfl.hover thrustrl.bit-more
		  thrustfr.bit-less thrustrr.hover)	       
  (& lat.left dir.E)
  (thrustfl.bit-less thrustrl.bit-more
		     thrustfr.bit-less thrustrr.bit-more)	       
  (& lat.left dir.SE)
  (thrustfl.bit-less thrustrl.hover
		     thrustfr.hover thrustrr.bit-more)	       
  (v (& lat.left dir.S)
     (& lat.left dir.SS))
  (thrustfl.bit-less thrustrl.bit-less
		     thrustfr.bit-more thrustrr.bit-more)	       
  (& lat.left dir.SW)
  (thrustfl.hover thrustrl.bit-less
		  thrustfr.bit-more thrustrr.hover)	       
  (& lat.left dir.W)
  (thrustfl.bit-more thrustrl.bit-less
		     thrustfr.bit-more thrustrr.bit-less)	       
  (& lat.left dir.NW)
  (thrustfl.bit-more thrustrl.hover
		     thrustfr.hover thrustrr.bit-less)	       

  (& lat.bit-left dir.N)
  (thrustfl.tad-more thrustrl.tad-more
		     thrustfr.tad-less thrustrr.tad-less)	       
  (& lat.left dir.NE)
  (thrustfl.hover thrustrl.tad-more
		  thrustfr.tad-less thrustrr.hover)	       
  (& lat.bit-left dir.E)
  (thrustfl.tad-less thrustrl.tad-more
		     thrustfr.tad-less thrustrr.tad-more)	       
  (& lat.bit-left dir.SE)
  (thrustfl.tad-less thrustrl.hover
		     thrustfr.hover thrustrr.tad-more)	       
  (v (& lat.bit-left dir.S)
     (& lat.bit-left dir.SS))
  (thrustfl.tad-less thrustrl.tad-less
		     thrustfr.tad-more thrustrr.tad-more)	       
  (& lat.bit-left dir.SW)
  (thrustfl.hover thrustrl.tad-less
		  thrustfr.tad-more thrustrr.hover)	       
  (& lat.bit-left dir.W)
  (thrustfl.tad-more thrustrl.tad-less
		     thrustfr.tad-more thrustrr.tad-less)	       
  (& lat.bit-left dir.NW)
  (thrustfl.tad-more thrustrl.hover
		     thrustfr.hover thrustrr.tad-less)

  ;; --- Zero ---
  lat.zero (thrustfl.hover thrustrl.hover
			   thrustfr.hover thrustrr.hover)
  
  ;; Right
  
  (& lat.bit-right dir.N)
  (thrustfl.tad-less thrustrl.tad-less
		     thrustfr.tad-more thrustrr.tad-more)	       
  (& lat.bit-right dir.NE)
  (thrustfl.hover thrustrl.tad-less
		  thrustfr.tad-more thrustrr.hover)	       
  (& lat.bit-right dir.E)
  (thrustfl.tad-more thrustrl.tad-less
		     thrustfr.tad-more thrustrr.tad-less)	       
  (& lat.bit-right dir.SE)
  (thrustfl.tad-more thrustrl.hover
		     thrustfr.hover thrustrr.tad-less)	       
  (v (& lat.bit-right dir.S)
     (& lat.bit-right dir.SS))
  (thrustfl.tad-more thrustrl.tad-more
		     thrustfr.tad-less thrustrr.tad-less)	       
  (& lat.bit-right dir.SW)
  (thrustfl.hover thrustrl.tad-more
		  thrustfr.tad-less thrustrr.hover)	       
  (& lat.bit-right dir.W)
  (thrustfl.tad-less thrustrl.tad-more
		     thrustfr.tad-less thrustrr.tad-more)	       
  (& lat.bit-right dir.NW)
  (thrustfl.tad-less thrustrl.hover
		     thrustfr.hover thrustrr.tad-more)

  (& lat.right dir.N)
  (thrustfl.bit-less thrustrl.bit-less
		     thrustfr.bit-more thrustrr.bit-more)	       
  (& lat.right dir.NE)
  (thrustfl.hover thrustrl.bit-less
		  thrustfr.bit-more thrustrr.hover)	       
  (& lat.right dir.E)
  (thrustfl.bit-more thrustrl.bit-less
		     thrustfr.bit-more thrustrr.bit-less)	       
  (& lat.right dir.SE)
  (thrustfl.bit-more thrustrl.hover
		     thrustfr.hover thrustrr.bit-less)	       
  (v (& lat.right dir.S)
     (& lat.right dir.SS))
  (thrustfl.bit-more thrustrl.bit-more
		     thrustfr.bit-less thrustrr.bit-less)	       
  (& lat.right dir.SW)
  (thrustfl.hover thrustrl.bit-more
		  thrustfr.bit-less thrustrr.hover)	       
  (& lat.right dir.W)
  (thrustfl.bit-less thrustrl.bit-more
		     thrustfr.bit-less thrustrr.bit-more)	       
  (& lat.right dir.NW)
  (thrustfl.bit-less thrustrl.hover
		     thrustfr.hover thrustrr.bit-more)

  (& lat.way-right dir.N)
  (thrustfl.less- thrustrl.less-
		  thrustfr.more+ thrustrr.more+)	       
  (& lat.way-right dir.NE)
  (thrustfl.hover thrustrl.less-
		  thrustfr.more+ thrustrr.hover)	       
  (& lat.way-right dir.E)
  (thrustfl.more+ thrustrl.less-
		  thrustfr.more+ thrustrr.less-)	       
  (& lat.way-right dir.SE)
  (thrustfl.more+ thrustrl.hover
		  thrustfr.hover thrustrr.less-)	       
  (v (& lat.way-right dir.S)
     (& lat.way-right dir.SS))
  (thrustfl.more+ thrustrl.more+
		  thrustfr.less- thrustrr.less-)	       
  (& lat.way-right dir.SW)
  (thrustfl.hover thrustrl.more+
		  thrustfr.less- thrustrr.hover)	       
  (& lat.way-right dir.W)
  (thrustfl.less- thrustrl.more+
		  thrustfr.less- thrustrr.more+)	       
  (& lat.way-right dir.NW)
  (thrustfl.less- thrustrl.hover
		  thrustfr.hover thrustrr.more+))

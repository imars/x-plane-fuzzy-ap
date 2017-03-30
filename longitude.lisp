(in-package #:xp-nap)

(defrules longitude
    ((lon lony)
     (dir direction)
     (thrustfl thrust)
     (thrustfr thrust)
     (thrustrl thrust)
     (thrustrr thrust))

  ;; ======= Position: Longitude =======

  ;; Front
  
  (& lon.front dir.N)
  (thrustfl.more+ thrustrl.less- 
		  thrustfr.more+ thrustrr.less-)
  (& lon.front dir.NE)
  (thrustfl.more+ thrustrl.hover
		  thrustfr.hover thrustrr.less-)
  (& lon.front dir.E)
  (thrustfl.more+ thrustrl.more+
		  thrustfr.less- thrustrr.less-)
  (& lon.front dir.SE)
  (thrustfl.hover thrustrl.more+
		  thrustfr.less- thrustrr.hover)	       
  (v (& lon.front dir.S)
     (& lon.front dir.SS))
  (thrustfl.less- thrustrl.more+
		  thrustfr.less- thrustrr.more+)	       
  (& lon.front dir.SW)
  (thrustfl.less- thrustrl.hover
		  thrustfr.hover thrustrr.more+)	       
  (& lon.front dir.W)
  (thrustfl.less- thrustrl.more+
		  thrustfr.less- thrustrr.more+)	       
  (& lon.front dir.NW)
  (thrustfl.hover thrustrl.less-
		  thrustfr.more+ thrustrr.hover)	       

  (& lon.front dir.N)
  (thrustfl.bit-more thrustrl.bit-less 
		     thrustfr.bit-more thrustrr.bit-less)
  (& lon.front dir.NE)
  (thrustfl.bit-more thrustrl.hover
		     thrustfr.hover thrustrr.bit-less)
  (& lon.front dir.E)
  (thrustfl.bit-more thrustrl.bit-more
		     thrustfr.bit-less thrustrr.bit-less)
  (& lon.front dir.SE)
  (thrustfl.hover thrustrl.bit-more
		  thrustfr.bit-less thrustrr.hover)	       
  (v (& lon.front dir.S)
     (& lon.front dir.SS))
  (thrustfl.bit-less thrustrl.bit-more
		     thrustfr.bit-less thrustrr.bit-more)	       
  (& lon.front dir.SW)
  (thrustfl.bit-less thrustrl.hover
		     thrustfr.hover thrustrr.bit-more)	       
  (& lon.front dir.W)
  (thrustfl.bit-less thrustrl.bit-more
		     thrustfr.bit-less thrustrr.bit-more)	       
  (& lon.front dir.NW)
  (thrustfl.hover thrustrl.bit-less
		  thrustfr.bit-more thrustrr.hover)	       
  
  (& lon.bit-front dir.N)
  (thrustfl.tad-more thrustrl.tad-less
		     thrustfr.tad-more thrustrr.tad-less)	       
  (& lon.bit-front dir.NE)
  (thrustfl.tad-more thrustrr.hover
		     thrustfl.hover thrustrl.tad-less)
  (& lon.bit-front dir.E)
  (thrustfl.tad-more thrustrl.tad-more
		     thrustfr.tad-less thrustrr.tad-less)
  (& lon.bit-front dir.SE)
  (thrustfl.hover thrustrl.tad-more
		  thrustfr.tad-less thrustrr.hover)	       
  (v (& lon.bit-front dir.S)
     (& lon.bit-front dir.SS))
  (thrustfl.tad-less thrustrl.tad-more
		     thrustfr.tad-less thrustrr.tad-more)	       
  (& lon.bit-front dir.SW)
  (thrustfl.tad-less thrustrl.hover
		     thrustfr.hover thrustrr.tad-more)	       
  (& lon.bit-front dir.W)
  (thrustfl.tad-less thrustrl.tad-less
		     thrustfr.tad-more thrustrr.tad-more)	       
  (& lon.bit-front dir.NW)
  (thrustfl.hover thrustrl.tad-less
		  thrustfr.tad-more thrustrr.hover)

  ;; --- Zero ---
  lon.zero (thrustfl.hover thrustrl.hover
			   thrustfr.hover thrustrr.hover)

  ;; Back

  (& lon.bit-back dir.N)
  (thrustfl.tad-less thrustrl.tad-more
		     thrustfr.tad-less thrustrr.tad-more)
  (& lon.bit-back dir.NE)
  (thrustfl.tad-less thrustrl.hover
		     thrustfr.hover thrustrr.tad-more)
  (& lon.bit-back dir.E)
  (thrustfl.tad-less thrustrl.tad-less
		     thrustfr.tad-more thrustrr.tad-more)
  (& lon.bit-back dir.SE)
  (thrustfl.hover thrustrl.tad-less
		  thrustfr.tad-more thrustrr.hover)	       
  (v (& lon.bit-back dir.S)
     (& lon.bit-back dir.SS))
  (thrustfl.tad-more thrustrl.tad-less
		     thrustfr.tad-more thrustrr.tad-less)	       
  (& lon.bit-back dir.SW)
  (thrustfl.tad-more thrustrl.hover
		     thrustfr.hover thrustrr.tad-less)	       
  (& lon.bit-back dir.W)
  (thrustfl.tad-more thrustrl.tad-more
		     thrustfr.tad-less thrustrr.tad-less)	       
  (& lon.bit-back dir.NW)
  (thrustfl.hover thrustrl.tad-more
		  thrustfr.tad-less thrustrr.hover)

  (& lon.back dir.N)
  (thrustfl.bit-less thrustrl.bit-more
		     thrustfr.bit-less thrustrr.bit-more)
  (& lon.back dir.NE)
  (thrustfl.bit-less thrustrl.hover
		     thrustfr.hover thrustrr.bit-more)
  (& lon.back dir.E)
  (thrustfl.bit-less thrustrl.bit-more
		     thrustfr.bit-less thrustrr.bit-more)
  (& lon.back dir.SE)
  (thrustfl.hover thrustrl.bit-less
		  thrustfr.bit-more thrustrr.hover)	       
  (v (& lon.back dir.S)
     (& lon.back dir.SS))
  (thrustfl.bit-more thrustrl.bit-less
		     thrustfr.bit-more thrustrr.bit-less)	       
  (& lon.back dir.SW)
  (thrustfl.bit-more thrustrl.hover
		     thrustfr.hover thrustrr.bit-less)	       
  (& lon.back dir.W)
  (thrustfl.bit-more thrustrl.bit-more
		     thrustfr.bit-less thrustrr.bit-less)	       
  (& lon.back dir.NW)
  (thrustfl.hover thrustrl.bit-more
		  thrustfr.bit-less thrustrr.hover)

  (& lon.back dir.N)
  (thrustfl.less- thrustrl.more+
		  thrustfr.less- thrustrr.more+)
  (& lon.back dir.NE)
  (thrustfl.less- thrustrl.hover
		  thrustfr.hover thrustrr.more+)
  (& lon.back dir.E)
  (thrustfl.less- thrustrl.more+
		  thrustfr.less- thrustrr.more+)
  (& lon.back dir.SE)
  (thrustfl.hover thrustrl.less-
		  thrustfr.more+ thrustrr.hover)	       
  (v (& lon.back dir.S)
     (& lon.back dir.SS))
  (thrustfl.more+ thrustrl.less-
		  thrustfr.more+ thrustrr.less-)	       
  (& lon.back dir.SW)
  (thrustfl.more+ thrustrl.hover
		  thrustfr.hover thrustrr.less-)	       
  (& lon.back dir.W)
  (thrustfl.more+ thrustrl.more+
		  thrustfr.less- thrustrr.less-)	       
  (& lon.back dir.NW)
  (thrustfl.hover thrustrl.more+
		  thrustfr.less- thrustrr.hover))

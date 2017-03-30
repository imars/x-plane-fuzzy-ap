(in-package #:xp-nap)

(defrules longitudev
    ((lon lony)
     (lonv local_vz)
     (dir direction)
     (thrustfl thrust)
     (thrustfr thrust)
     (thrustrl thrust)
     (thrustrr thrust))
  
  ;; ====== Velocity: Longitude ======

  ;; Front

  (& lon.front lonv.front dir.N)
  (thrustfl.strong thrustrl.weak
		   thrustfr.strong thrustrr.weak)
  (& lon.front lonv.front dir.NE)
  (thrustfl.strong thrustrl.hover
		   thrustfr.hover thrustrr.weak)
  (& lon.front lonv.front dir.E)
  (thrustfl.strong thrustrl.strong
		   thrustfr.weak thrustrr.weak)	    	       
  (& lon.front lonv.front dir.SE)
  (thrustfl.hover thrustrl.strong
		  thrustfr.weak thrustrr.hover)	       
  (v (& lon.front lonv.front dir.S)
     (& lon.front lonv.front dir.SS))
  (thrustfl.weak thrustrl.strong
		 thrustfr.weak thrustrr.strong)	       
  (& lon.front lonv.front dir.SW)
  (thrustfl.weak thrustrl.hover
		 thrustfr.hover thrustrr.strong)	       
  (& lon.front lonv.front dir.W)
  (thrustfl.weak thrustrl.weak
		 thrustfr.strong thrustrr.strong)	       
  (& lon.front lonv.front dir.NW)
  (thrustfl.hover thrustrl.weak
		  thrustfr.strong thrustrr.hover)	       
  
  (& lon.front lonv.bit-front dir.N)
  (thrustfl.more thrustrl.less
		 thrustfr.more thrustrr.less)	       
  (& lon.front lonv.bit-front dir.NE)
  (thrustfl.more thrustrl.hover
		 thrustfr.hover thrustrr.less)
  (& lon.front lonv.bit-front dir.E)
  (thrustfl.more thrustrl.more
		 thrustfr.less thrustrr.less)	    	       
  (& lon.front lonv.bit-front dir.SE)
  (thrustfl.hover thrustrl.more
		  thrustfr.less thrustrr.hover)	       
  (v (& lon.front lonv.bit-front dir.S)
     (& lon.front lonv.bit-front dir.SS))
  (thrustfl.less thrustrl.more
		 thrustfr.less thrustrr.more)	       
  (& lon.front lonv.bit-front dir.SW)
  (thrustfl.less thrustrl.hover
		 thrustfr.hover thrustrr.more)	       
  (& lon.front lonv.bit-front dir.W)
  (thrustfl.less thrustrl.less
		 thrustfr.more thrustrr.more)	       
  (& lon.front lonv.bit-front dir.NW)
  (thrustfl.hover thrustrl.less
		  thrustfr.more thrustrr.hover)

  (& lon.bit-front lonv.front dir.N)
  (thrustfl.strong thrustrl.weak
		   thrustfr.strong thrustrr.weak)
  (& lon.bit-front lonv.front dir.NE)
  (thrustfl.strong thrustrl.hover
		   thrustfr.hover thrustrr.weak)
  (& lon.bit-front lonv.front dir.E)
  (thrustfl.strong thrustrl.strong
		   thrustfr.weak thrustrr.weak)	    	       
  (& lon.bit-front lonv.front dir.SE)
  (thrustfl.hover thrustrl.strong
		  thrustfr.weak thrustrr.hover)	       
  (v (& lon.bit-front lonv.front dir.S)
     (& lon.bit-front lonv.front dir.SS))
  (thrustfl.weak thrustrl.strong
		 thrustfr.weak thrustrr.strong)	       
  (& lon.bit-front lonv.front dir.SW)
  (thrustfl.weak thrustrl.hover
		 thrustfr.hover thrustrr.strong)	       
  (& lon.bit-front lonv.front dir.W)
  (thrustfl.weak thrustrl.weak
		 thrustfr.strong thrustrr.strong)	       
  (& lon.bit-front lonv.front dir.NW)
  (thrustfl.hover thrustrl.weak
		  thrustfr.strong thrustrr.hover)	       
  
  (& lon.bit-front lonv.bit-front dir.N)
  (thrustfl.more thrustrl.less
		 thrustfr.more thrustrr.less)	       
  (& lon.bit-front lonv.bit-front dir.NE)
  (thrustfl.more thrustrl.hover
		 thrustfr.hover thrustrr.less)
  (& lon.bit-front lonv.bit-front dir.E)
  (thrustfl.more thrustrl.more
		 thrustfr.less thrustrr.less)	    	       
  (& lon.bit-front lonv.bit-front dir.SE)
  (thrustfl.hover thrustrl.more
		  thrustfr.less thrustrr.hover)	       
  (v (& lon.bit-front lonv.bit-front dir.S)
     (& lon.bit-front lonv.bit-front dir.SS))
  (thrustfl.less thrustrl.more
		 thrustfr.less thrustrr.more)	       
  (& lon.bit-front lonv.bit-front dir.SW)
  (thrustfl.less thrustrl.hover
		 thrustfr.hover thrustrr.more)	       
  (& lon.bit-front lonv.bit-front dir.W)
  (thrustfl.less thrustrl.less
		 thrustfr.more thrustrr.more)	       
  (& lon.bit-front lonv.bit-front dir.NW)
  (thrustfl.hover thrustrl.less
		  thrustfr.more thrustrr.hover)

  ;; Zero - Front

  (& lon.zero lonv.front dir.N)
  (thrustfl.more+ thrustrl.less-
		  thrustfr.more+ thrustrr.less-)
  (& lon.zero lonv.front dir.NE)
  (thrustfl.more+ thrustrl.hover
		  thrustfr.hover thrustrr.less-)
  (& lon.zero lonv.front dir.E)
  (thrustfl.more+ thrustrl.more+
		  thrustfr.less- thrustrr.less-)	    	       
  (& lon.zero lonv.front dir.SE)
  (thrustfl.hover thrustrl.more+
		  thrustfr.less- thrustrr.hover)	       
  (v (& lon.zero lonv.front dir.S)
     (& lon.zero lonv.front dir.SS))
  (thrustfl.less- thrustrl.more+
		  thrustfr.less- thrustrr.more+)	       
  (& lon.zero lonv.front dir.SW)
  (thrustfl.less- thrustrl.hover
		  thrustfr.hover thrustrr.more+)	       
  (& lon.zero lonv.front dir.W)
  (thrustfl.less- thrustrl.less-
		  thrustfr.more+ thrustrr.more+)	       
  (& lon.zero lonv.front dir.NW)
  (thrustfl.hover thrustrl.less-
		  thrustfr.more+ thrustrr.hover)	       
  
  (& lon.zero lonv.bit-front dir.N)
  (thrustfl.more thrustrl.less
		 thrustfr.more thrustrr.less)	       
  (& lon.zero lonv.bit-front dir.NE)
  (thrustfl.more thrustrl.hover
		 thrustfr.hover thrustrr.less)
  (& lon.zero lonv.bit-front dir.E)
  (thrustfl.more thrustrl.more
		 thrustfr.less thrustrr.less)	    	       
  (& lon.zero lonv.bit-front dir.SE)
  (thrustfl.hover thrustrl.more
		  thrustfr.less thrustrr.hover)	       
  (v (& lon.zero lonv.bit-front dir.S)
     (& lon.zero lonv.bit-front dir.SS))
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
  (thrustfl.less thrustrl.hover
		 thrustfr.hover thrustrr.more)
  (& lon.zero lonv.bit-back dir.E)
  (thrustfl.less thrustrl.less
		 thrustfr.more thrustrr.more)	    	       
  (& lon.zero lonv.bit-back dir.SE)
  (thrustfl.hover thrustrl.less
		  thrustfr.more thrustrr.hover)	       
  (v (& lon.zero lonv.bit-back dir.S)
     (& lon.zero lonv.bit-back dir.SS))
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
  (thrustfl.less- thrustrl.more+
		  thrustfr.less- thrustrr.more+)
  (& lon.zero lonv.back dir.NE)
  (thrustfl.less- thrustrl.hover
		  thrustfr.hover thrustrr.more+)
  (& lon.zero lonv.back dir.E)
  (thrustfl.less- thrustrl.less-
		  thrustfr.more+ thrustrr.more+)	    	       
  (& lon.zero lonv.back dir.SE)
  (thrustfl.hover thrustrl.less-
		  thrustfr.more+ thrustrr.hover)	       
  (v (& lon.zero lonv.back dir.S)
     (& lon.zero lonv.back dir.SS))
  (thrustfl.more+ thrustrl.less-
		  thrustfr.more+ thrustrr.less-)	       
  (& lon.zero lonv.back dir.SW)
  (thrustfl.more+ thrustrl.hover
		  thrustfr.hover thrustrr.less-)	       
  (& lon.zero lonv.back dir.W)
  (thrustfl.more+ thrustrl.more+
		  thrustfr.less- thrustrr.less-)	       
  (& lon.zero lonv.back dir.NW)
  (thrustfl.hover thrustrl.more+
		  thrustfr.less- thrustrr.hover)

  ;; Back
  
  (& lon.bit-back lonv.bit-back dir.N)
  (thrustfl.less thrustrl.more
		 thrustfr.less thrustrr.more)
  (& lon.bit-back lonv.bit-back dir.NE)
  (thrustfl.less thrustrl.hover
		 thrustfr.hover thrustrr.more)
  (& lon.bit-back lonv.bit-back dir.E)
  (thrustfl.less thrustrl.less
		 thrustfr.more thrustrr.more)	    	       
  (& lon.bit-back lonv.bit-back dir.SE)
  (thrustfl.hover thrustrl.less
		  thrustfr.more thrustrr.hover)	       
  (v (& lon.bit-back lonv.bit-back dir.S)
     (& lon.bit-back lonv.bit-back dir.SS))
  (thrustfl.more thrustrl.less
		 thrustfr.more thrustrr.less)	       
  (& lon.bit-back lonv.bit-back dir.SW)
  (thrustfl.more thrustrl.hover
		 thrustfr.hover thrustrr.less)	       
  (& lon.bit-back lonv.bit-back dir.W)
  (thrustfl.more thrustrl.more
		 thrustfr.less thrustrr.less)	       
  (& lon.bit-back lonv.bit-back dir.NW)
  (thrustfl.hover thrustrl.more
		  thrustfr.less thrustrr.hover)

  (& lon.bit-back lonv.back dir.N)
  (thrustfl.less- thrustrl.more+
		  thrustfr.less- thrustrr.more+)
  (& lon.bit-back lonv.back dir.NE)
  (thrustfl.less- thrustrl.hover
		  thrustfr.hover thrustrr.more+)
  (& lon.bit-back lonv.back dir.E)
  (thrustfl.less- thrustrl.less-
		  thrustfr.more+ thrustrr.more+)	    	       
  (& lon.bit-back lonv.back dir.SE)
  (thrustfl.hover thrustrl.less-
		  thrustfr.more+ thrustrr.hover)	       
  (v (& lon.bit-back lonv.back dir.S)
     (& lon.bit-back lonv.back dir.SS))
  (thrustfl.more+ thrustrl.less-
		  thrustfr.more+ thrustrr.less-)	       
  (& lon.bit-back lonv.back dir.SW)
  (thrustfl.more+ thrustrl.hover
		  thrustfr.hover thrustrr.less-)	       
  (& lon.bit-back lonv.back dir.W)
  (thrustfl.more+ thrustrl.more+
		  thrustfr.less- thrustrr.less-)	       
  (& lon.bit-back lonv.back dir.NW)
  (thrustfl.hover thrustrl.more+
		  thrustfr.less- thrustrr.hover)

  (& lon.back lonv.bit-back dir.N)
  (thrustfl.less thrustrl.more
		 thrustfr.less thrustrr.more)
  (& lon.back lonv.bit-back dir.NE)
  (thrustfl.less thrustrl.hover
		 thrustfr.hover thrustrr.more)
  (& lon.back lonv.bit-back dir.E)
  (thrustfl.less thrustrl.less
		 thrustfr.more thrustrr.more)	    	       
  (& lon.back lonv.bit-back dir.SE)
  (thrustfl.hover thrustrl.less
		  thrustfr.more thrustrr.hover)	       
  (v (& lon.back lonv.bit-back dir.S)
     (& lon.back lonv.bit-back dir.SS))
  (thrustfl.more thrustrl.less
		 thrustfr.more thrustrr.less)	       
  (& lon.back lonv.bit-back dir.SW)
  (thrustfl.more thrustrl.hover
		 thrustfr.hover thrustrr.less)	       
  (& lon.back lonv.bit-back dir.W)
  (thrustfl.more thrustrl.more
		 thrustfr.less thrustrr.less)	       
  (& lon.back lonv.bit-back dir.NW)
  (thrustfl.hover thrustrl.more
		  thrustfr.less thrustrr.hover)

  (& lon.back lonv.back dir.N)
  (thrustfl.weak thrustrl.strong
		 thrustfr.weak thrustrr.strong)
  (& lon.back lonv.back dir.NE)
  (thrustfl.weak thrustrl.hover
		 thrustfr.hover thrustrr.strong)
  (& lon.back lonv.back dir.E)
  (thrustfl.weak thrustrl.weak
		 thrustfr.strong thrustrr.strong)	    	       
  (& lon.back lonv.back dir.SE)
  (thrustfl.hover thrustrl.weak
		  thrustfr.strong thrustrr.hover)	       
  (v (& lon.back lonv.back dir.S)
     (& lon.back lonv.back dir.SS))
  (thrustfl.strong thrustrl.weak
		   thrustfr.strong thrustrr.weak)	       
  (& lon.back lonv.back dir.SW)
  (thrustfl.strong thrustrl.hover
		   thrustfr.hover thrustrr.weak)	       
  (& lon.back lonv.back dir.W)
  (thrustfl.strong thrustrl.strong
		   thrustfr.weak thrustrr.weak)	       
  (& lon.back lonv.back dir.NW)
  (thrustfl.hover thrustrl.strong
		  thrustfr.weak thrustrr.hover))

(in-package #:xp-nap)

(defrules latitudev
    ((lat latx)
     (latv local_vx)
     (dir direction)
     (thrustfl thrust)
     (thrustfr thrust)
     (thrustrl thrust)
     (thrustrr thrust))

  ;; ====== Velocity: Latitude ======

  ;; Left

  (& lat.left latv.left dir.N)
  (thrustfl.strong thrustrl.strong
		   thrustfr.weak thrustrr.weak)	       
  (& lat.left latv.left dir.NE)
  (thrustfl.hover thrustrl.strong
		  thrustfr.weak thrustrr.hover)	       
  (& lat.left latv.left dir.E)
  (thrustfl.weak thrustrl.strong
		 thrustfr.weak thrustrr.strong)	       
  (& lat.left latv.left dir.SE)
  (thrustfl.weak thrustrl.hover
		 thrustfr.hover thrustrr.strong)	       
  (v (& lat.left latv.left dir.S)
     (& lat.left latv.left dir.SS))
  (thrustfl.weak thrustrl.weak
		 thrustfr.strong thrustrr.strong)	       
  (& lat.left latv.left dir.SW)
  (thrustfl.hover thrustrl.weak
		  thrustfr.strong thrustrr.hover)	       
  (& lat.left latv.left dir.W)
  (thrustfl.strong thrustrl.weak
		   thrustfr.strong thrustrr.weak)	       
  (& lat.left latv.left dir.NW)
  (thrustfl.strong thrustrl.hover
		   thrustfr.hover thrustrr.weak)

  (& lat.left latv.bit-left dir.N)
  (thrustfl.more thrustrl.more
		 thrustfr.less thrustrr.less)	       
  (& lat.left latv.bit-left dir.NE)
  (thrustfl.hover thrustrl.more
		  thrustfr.less thrustrr.hover)	       
  (& lat.left latv.bit-left dir.E)
  (thrustfl.less thrustrl.more
		 thrustfr.less thrustrr.more)	       
  (& lat.left latv.bit-left dir.SE)
  (thrustfl.less thrustrl.hover
		 thrustfr.hover thrustrr.more)	       
  (v (& lat.left latv.bit-left dir.S)
     (& lat.left latv.bit-left dir.SS))
  (thrustfl.less thrustrl.less
		 thrustfr.more thrustrr.more)	       
  (& lat.left latv.bit-left dir.SW)
  (thrustfl.hover thrustrl.less
		  thrustfr.more thrustrr.hover)	       
  (& lat.left latv.bit-left dir.W)
  (thrustfl.more thrustrl.less
		 thrustfr.more thrustrr.less)	       
  (& lat.left latv.bit-left dir.NW)
  (thrustfl.more thrustrl.hover
		 thrustfr.hover thrustrr.less)
  
  (& lat.bit-left latv.left dir.N)
  (thrustfl.strong thrustrl.strong
		   thrustfr.weak thrustrr.weak)	       
  (& lat.bit-left latv.left dir.NE)
  (thrustfl.hover thrustrl.strong
		  thrustfr.weak thrustrr.hover)	       
  (& lat.bit-left latv.left dir.E)
  (thrustfl.weak thrustrl.strong
		 thrustfr.weak thrustrr.strong)	       
  (& lat.bit-left latv.left dir.SE)
  (thrustfl.weak thrustrl.hover
		 thrustfr.hover thrustrr.strong)	       
  (v (& lat.bit-left latv.left dir.S)
     (& lat.bit-left latv.left dir.SS))
  (thrustfl.weak thrustrl.weak
		 thrustfr.strong thrustrr.strong)	       
  (& lat.bit-left latv.left dir.SW)
  (thrustfl.hover thrustrl.weak
		  thrustfr.strong thrustrr.hover)	       
  (& lat.bit-left latv.left dir.W)
  (thrustfl.strong thrustrl.weak
		   thrustfr.strong thrustrr.strong)	       
  (& lat.bit-left latv.left dir.NW)
  (thrustfl.strong thrustrl.hover
		   thrustfr.hover thrustrr.weak)

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
  (thrustfl.more thrustrl.less
		 thrustfr.more thrustrr.less)	       
  (& lat.bit-left latv.bit-left dir.NW)
  (thrustfl.more thrustrl.hover
		 thrustfr.hover thrustrr.less)

  ;; Zero - Left
  
  (& lat.zero latv.left dir.N)
  (thrustfl.more+ thrustrl.more+
		  thrustfr.less- thrustrr.less-)	       
  (& lat.zero latv.left dir.NE)
  (thrustfl.hover thrustrl.more+
		  thrustfr.less- thrustrr.hover)	       
  (& lat.zero latv.left dir.E)
  (thrustfl.less- thrustrl.more+
		  thrustfr.less- thrustrr.more+)	       
  (& lat.zero latv.left dir.SE)
  (thrustfl.less- thrustrl.hover
		  thrustfr.hover thrustrr.more+)	       
  (v (& lat.zero latv.left dir.S)
     (& lat.zero latv.left dir.SS))
  (thrustfl.less- thrustrl.less-
		  thrustfr.more+ thrustrr.more+)	       
  (& lat.zero latv.left dir.SW)
  (thrustfl.hover thrustrl.less-
		  thrustfr.more+ thrustrr.hover)	       
  (& lat.zero latv.left dir.W)
  (thrustfl.more+ thrustrl.less-
		  thrustfr.more+ thrustrr.less-)	       
  (& lat.zero latv.left dir.NW)
  (thrustfl.more+ thrustrl.hover
		  thrustfr.hover thrustrr.less-)

  (& lat.zero latv.bit-left dir.N)
  (thrustfl.more thrustrl.more
		 thrustfr.less thrustrr.less)	       
  (& lat.zero latv.bit-left dir.NE)
  (thrustfl.hover thrustrl.more
		  thrustfr.less thrustrr.hover)	       
  (& lat.zero latv.bit-left dir.E)
  (thrustfl.less thrustrl.more
		 thrustfr.less thrustrr.more)	       
  (& lat.zero latv.bit-left dir.SE)
  (thrustfl.less thrustrl.hover
		 thrustfr.hover thrustrr.more)	       
  (v (& lat.zero latv.bit-left dir.S)
     (& lat.zero latv.bit-left dir.SS))
  (thrustfl.less thrustrl.less
		 thrustfr.more thrustrr.more)	       
  (& lat.zero latv.bit-left dir.SW)
  (thrustfl.hover thrustrl.less
		  thrustfr.more thrustrr.hover)	       
  (& lat.zero latv.bit-left dir.W)
  (thrustfl.more thrustrl.less
		 thrustfr.more thrustrr.less)	       
  (& lat.zero latv.bit-left dir.NW)
  (thrustfl.more thrustrl.hover
		 thrustfr.hover thrustrr.less)

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
  (thrustfl.less- thrustrl.less-
		  thrustfr.more+ thrustrr.more+)	       
  (& lat.zero latv.right dir.NE)
  (thrustfl.hover thrustrl.less-
		  thrustfr.more+ thrustrr.hover)	       
  (& lat.zero latv.right dir.E)
  (thrustfl.more+ thrustrl.less-
		  thrustfr.more+ thrustrr.less-)	       
  (& lat.zero latv.right dir.SE)
  (thrustfl.more+ thrustrl.hover
		  thrustfr.hover thrustrr.less-)	       
  (v (& lat.zero latv.right dir.S)
     (& lat.zero latv.right dir.SS))
  (thrustfl.more+ thrustrl.more+
		  thrustfr.less- thrustrr.less-)	       
  (& lat.zero latv.right dir.SW)
  (thrustfl.hover thrustrl.more+
		  thrustfr.less- thrustrr.hover)	       
  (& lat.zero latv.right dir.W)
  (thrustfl.less- thrustrl.more+
		  thrustfr.less- thrustrr.more+)	       
  (& lat.zero latv.right dir.NW)
  (thrustfl.less- thrustrl.hover
		  thrustfr.hover thrustrr.more+)

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
  (thrustfl.less- thrustrl.less-
		  thrustfr.more+ thrustrr.more+)	       
  (& lat.bit-right latv.right dir.NE)
  (thrustfl.hover thrustrl.less-
		  thrustfr.more+ thrustrr.hover)	       
  (& lat.bit-right latv.right dir.E)
  (thrustfl.more+ thrustrl.less-
		  thrustfr.more+ thrustrr.less-)	       
  (& lat.bit-right latv.right dir.SE)
  (thrustfl.more+ thrustrl.hover
		  thrustfr.hover thrustrr.less-)	       
  (v (& lat.bit-right latv.right dir.S)
     (& lat.bit-right latv.right dir.SS))
  (thrustfl.more+ thrustrl.more+
		  thrustfr.less- thrustrr.less-)	       
  (& lat.bit-right latv.right dir.SW)
  (thrustfl.hover thrustrl.more+
		  thrustfr.less- thrustrr.hover)	       
  (& lat.bit-right latv.right dir.W)
  (thrustfl.less- thrustrl.more+
		  thrustfr.less- thrustrr.more+)	       
  (& lat.bit-right latv.right dir.NW)
  (thrustfl.less- thrustrl.hover
		  thrustfr.hover thrustrr.more+)
  
  (& lat.right latv.bit-right dir.N)
  (thrustfl.less thrustrl.less
		 thrustfr.more thrustrr.more)
  (& lat.right latv.bit-right dir.NE)
  (thrustfl.hover thrustrl.less
		  thrustfr.more thrustrr.hover)
  (& lat.right latv.bit-right dir.E)
  (thrustfl.more thrustrl.less
		 thrustfr.more thrustrr.less)	       
  (& lat.right latv.bit-right dir.SE)
  (thrustfl.more thrustrl.hover
		 thrustfr.hover thrustrr.less)	       
  (v (& lat.right latv.bit-right dir.S)
     (& lat.right latv.bit-right dir.SS))
  (thrustfl.more thrustrl.more
		 thrustfr.less thrustrr.less)	       
  (& lat.right latv.bit-right dir.SW)
  (thrustfl.hover thrustrl.more
		  thrustfr.less thrustrr.hover)	       
  (& lat.right latv.bit-right dir.W)
  (thrustfl.less thrustrl.more
		 thrustfr.less thrustrr.more)	       
  (& lat.right latv.bit-right dir.NW)
  (thrustfl.less thrustrl.hover
		 thrustfr.hover thrustrr.more)

  (& lat.right latv.right dir.N)
  (thrustfl.weak thrustrl.weak
		 thrustfr.strong thrustrr.strong)	       
  (& lat.right latv.right dir.NE)
  (thrustfl.hover thrustrl.weak
		  thrustfr.strong thrustrr.hover)	       
  (& lat.right latv.right dir.E)
  (thrustfl.weak thrustrl.weak
		 thrustfr.strong thrustrr.strong)	       
  (& lat.right latv.right dir.SE)
  (thrustfl.strong thrustrl.hover
		   thrustfr.hover thrustrr.weak)	       
  (v (& lat.right latv.right dir.S)
     (& lat.right latv.right dir.SS))
  (thrustfl.strong thrustrl.strong
		   thrustfr.weak thrustrr.weak)	       
  (& lat.right latv.right dir.SW)
  (thrustfl.hover thrustrl.strong
		  thrustfr.weak thrustrr.hover)	       
  (& lat.right latv.right dir.W)
  (thrustfl.weak thrustrl.strong
		 thrustfr.weak thrustrr.strong)	       
  (& lat.right latv.right dir.NW)
  (thrustfl.weak thrustrl.hover
		 thrustfr.hover thrustrr.strong))

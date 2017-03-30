(in-package #:xp-nap)

(sb-ext:gc)

(defrules altitude
    ((agl y-agl)
     (vvol vh-ind)
     (vaccel dvh-ind)
     (thrustfl thrust)
     (thrustfr thrust)
     (thrustrl thrust)
     (thrustrr thrust))

  ;; === Position ===

  #|
  agl.way-above (thrustfl.zero thrustfr.zero
  thrustrl.zero thrustrr.zero)
  agl.above (thrustfl.weak thrustfr.weak
  thrustrl.weak thrustrr.weak)
  agl.bit-above (thrustfl.less thrustfr.less
  thrustrl.less thrustrr.less)
  agl.zero (thrustfl.hover thrustfr.hover
  thrustrl.hover thrustrr.hover)
  agl.bit-below (thrustfl.more thrustfr.more
  thrustrl.more thrustrr.more)
  agl.below (thrustfl.strong thrustfr.strong
  thrustrl.strong thrustrr.strong)
  agl.way-below (thrustfl.strong+4 thrustfr.strong+4
  thrustrl.strong+4 thrustrr.strong+4)
  |#
  ;; === Velocity ===

  ;; Large
  
  (& agl.way-below vvol.up)
  (thrustfl.strong+2 thrustfr.strong+2
		     thrustrl.strong+2 thrustrr.strong+2)
  (& agl.way-below vvol.bit-up)
  (thrustfl.strong+3 thrustfr.strong+3
		     thrustrl.strong+3 thrustrr.strong+3)
  (& agl.way-below vvol.zero)
  (thrustfl.strong+4 thrustfr.strong+4
		     thrustrl.strong+4 thrustrr.strong+4)
  (& agl.way-below vvol.bit-down)
  (thrustfl.strong+5 thrustfr.strong+5
		     thrustrl.strong+5 thrustrr.strong+5)
  (& agl.way-below vvol.down)
  (thrustfl.strong+6 thrustfr.strong+6
		     thrustrl.strong+6 thrustrr.strong+6)

  (& agl.way-above vvol.up)
  (thrustfl.zero thrustfr.zero
		 thrustrl.zero thrustrr.zero)
  (& agl.way-above vvol.bit-up)
  (thrustfl.zero thrustfr.zero
		 thrustrl.zero thrustrr.zero)
  (& agl.way-above vvol.zero)
  (thrustfl.weak- thrustfr.weak-
		  thrustrl.weak- thrustrr.weak-)
  (& agl.way-above vvol.bit-down)
  (thrustfl.weak- thrustfr.weak-
		  thrustrl.weak- thrustrr.weak-)
  (& agl.way-above vvol.down)
  (thrustfl.weak thrustfr.weak
		 thrustrl.weak thrustrr.weak)
  
  ;; Medium
  
  (& agl.below vvol.up)
  (thrustfl.strong+ thrustfr.strong+
		    thrustrl.strong+ thrustrr.strong+)
  (& agl.above vvol.down)
  (thrustfl.weak- thrustfr.weak-
		  thrustrl.weak- thrustrr.weak-)
  
  (& agl.below vvol.bit-up)
  (thrustfl.more thrustfr.more
		 thrustrl.more thrustrr.more)
  (& agl.above vvol.bit-down)
  (thrustfl.less thrustfr.less
		  thrustrl.less thrustrr.less)

  (& agl.below vvol.zero)
  (thrustfl.strong+1 thrustfr.strong+1
		     thrustrl.strong+1 thrustrr.strong+1)
  (& agl.above vvol.zero)
  (thrustfl.zero thrustfr.zero
		 thrustrl.zero thrustrr.zero)

  (& agl.below vvol.bit-down)
  (thrustfl.strong+2 thrustfr.strong+2
		     thrustrl.strong+2 thrustrr.strong+2)
  (& agl.above vvol.bit-up)
  (thrustfl.zero thrustfr.zero
		  thrustrl.zero thrustrr.zero)

  (& agl.below vvol.down)
  (thrustfl.strong+3 thrustfr.strong+3
		     thrustrl.strong+3 thrustrr.strong+3)
  (& agl.above vvol.up)
  (thrustfl.zero thrustfr.zero
		 thrustrl.zero thrustrr.zero)

  ;; Small

  (& agl.bit-below vvol.up)
  (thrustfl.zero thrustfr.zero
		 thrustrl.zero thrustrr.zero)
  (& agl.bit-above vvol.down)
  (thrustfl.strong+1 thrustfr.strong+1
		     thrustrl.strong+1 thrustrr.strong+1)
  
  (& agl.bit-below vvol.bit-up)
  (thrustfl.bit-less thrustfr.bit-less
		     thrustrl.bit-less thrustrr.bit-less)
  (& agl.bit-above vvol.bit-down)
  (thrustfl.bit-less thrustfr.bit-less
		     thrustrl.bit-less thrustrr.bit-less)
  
  (& agl.bit-below vvol.zero)
  (thrustfl.more thrustfr.more
		 thrustrl.more thrustrr.more)
  (& agl.bit-above vvol.zero)
  (thrustfl.less thrustfr.less
		 thrustrl.less thrustrr.less)
  
  (& agl.bit-below vvol.bit-down)
  (thrustfl.strong+1 thrustfr.strong+1
		     thrustrl.strong+1 thrustrr.strong+1)
  (& agl.bit-above vvol.bit-up)
  (thrustfl.zero thrustfr.zero
		  thrustrl.zero thrustrr.zero)
  
  (& agl.bit-below vvol.down)
  (thrustfl.strong+2 thrustfr.strong+2
		     thrustrl.strong+2 thrustrr.strong+2)
  (& agl.bit-above vvol.up)
  (thrustfl.zero thrustfr.zero
		  thrustrl.zero thrustrr.zero)
  
  ;; Zero
  
  (& agl.zero vvol.up)
  (thrustfl.zero thrustfr.zero
		  thrustrl.zero thrustrr.zero)
  (& agl.zero vvol.bit-up)
  (thrustfl.less thrustfr.less
		 thrustrl.less thrustrr.less)
  (& agl.zero vvol.zero)
  (thrustfl.hover thrustfr.hover
		  thrustrl.hover thrustrr.hover)
  (& agl.zero vvol.bit-down)
  (thrustfl.more thrustfr.more
		 thrustrl.more thrustrr.more)
  (& agl.zero vvol.down)
  (thrustfl.strong+2 thrustfr.strong+2
		     thrustrl.strong+2 thrustrr.strong+2)


  ;; === Acceleration ===

  (& (v #|(& agl.below vaccel.accel) (& agl.below vaccel.decel)|#
      (& agl.way-below vaccel.accel) (& agl.way-below vaccel.decel))
     (v vvol.down vvol.bit-down))
  (thrustfl.strong+5 thrustrl.strong+5
		     thrustfr.strong+5 thrustrr.strong+5)

  ;; Below and down
  
  (& agl.below vaccel.accel vvol.down)
  (thrustfl.strong+4 thrustrl.strong+4
		     thrustfr.strong+4 thrustrr.strong+4)
  (& agl.below vaccel.decel vvol.down)
  (thrustfl.strong+3 thrustrl.strong+3
		     thrustfr.strong+3 thrustrr.strong+3)
  (& agl.below vaccel.accel vvol.bit-down)
  (thrustfl.strong+2 thrustrl.strong+2
		     thrustfr.strong+2 thrustrr.strong+2)
  (& agl.below vaccel.decel vvol.bit-down)
  (thrustfl.strong+1 thrustrl.strong+1
		     thrustfr.strong+1 thrustrr.strong+1)

  (& agl.bit-below vaccel.accel vvol.down)
  (thrustfl.strong+3 thrustrl.strong+3
		     thrustfr.strong+3 thrustrr.strong+3)
  (& agl.bit-below vaccel.decel vvol.down)
  (thrustfl.strong+2 thrustrl.strong+2
		     thrustfr.strong+2 thrustrr.strong+2)	 
  (& agl.bit-below vaccel.accel vvol.bit-down)
  (thrustfl.strong+ thrustrl.strong+
		     thrustfr.strong+ thrustrr.strong+)
  (& agl.bit-below vaccel.decel vvol.bit-down)
  (thrustfl.strong thrustrl.strong
		     thrustfr.strong thrustrr.strong)

  ;; Below and up

  ;; Large
  (& agl.way-below vaccel.accel vvol.up)
  (thrustfl.strong+2 thrustrl.strong+2
		     thrustfr.strong+2 thrustrr.strong+2)
  (& agl.way-below vaccel.decel vvol.up)
  (thrustfl.strong+3 thrustrl.strong+3
		     thrustfr.strong+3 thrustrr.strong+3)
  (& agl.way-below vaccel.accel vvol.bit-up)
  (thrustfl.strong+4 thrustrl.strong+4
		     thrustfr.strong+4 thrustrr.strong+4)
  (& agl.way-below vaccel.decel vvol.bit-up)
  (thrustfl.strong+5 thrustrl.strong+5
		     thrustfr.strong+5 thrustrr.strong+5)
  ;; Medium
  (& agl.below vaccel.accel vvol.up)
  (thrustfl.strong thrustrl.strong
		   thrustfr.strong thrustrr.strong)
  (& agl.below vaccel.decel vvol.up)
  (thrustfl.strong+ thrustrl.strong+
		    thrustfr.strong+ thrustrr.strong+)
  (& agl.below vaccel.accel vvol.bit-up)
  (thrustfl.strong+1 thrustrl.strong+1
		     thrustfr.strong+1 thrustrr.strong+1)
  (& agl.below vaccel.decel vvol.bit-up)
  (thrustfl.strong+2 thrustrl.strong+2
		     thrustfr.strong+2 thrustrr.strong+2)
  ;; Small
  (& agl.bit-below vaccel.accel vvol.up)
  (thrustfl.weak- thrustrl.weak-
		  thrustfr.weak- thrustrr.weak-)
  (& agl.bit-below vaccel.decel vvol.up)
  (thrustfl.weak thrustrl.weak
		 thrustfr.weak thrustrr.weak)
  (& agl.bit-below vaccel.accel vvol.bit-up)
  (thrustfl.tad-more thrustrl.tad-more
		     thrustfr.tad-more thrustrr.tad-more)
  (& agl.bit-below vaccel.decel vvol.bit-up)
  (thrustfl.bit-more thrustrl.bit-more
		     thrustfr.bit-more thrustrr.bit-more)

  ;; Zero

  (& agl.zero vaccel.accel vvol.up)
  (thrustfl.zero thrustrl.zero
		 thrustfr.zero thrustrr.zero)
  (& agl.zero vaccel.decel vvol.up)
  (thrustfl.weak- thrustrl.weak-
		  thrustfr.weak- thrustrr.weak-)

  (& agl.zero vaccel.accel vvol.bit-up)
  (thrustfl.less thrustrl.less
		      thrustfr.less thrustrr.less)
  (& agl.zero vaccel.decel vvol.bit-up)
  (thrustfl.bit-less- thrustrl.bit-less-
		     thrustfr.bit-less- thrustrr.bit-less-)

  (& agl.zero vaccel.zero vvol.up)
  (thrustfl.zero thrustrl.zero
  		 thrustfr.zero thrustrr.zero)
  (& agl.zero vaccel.zero vvol.bit-up)
  (thrustfl.bit-less- thrustrl.bit-less-
  		      thrustfr.bit-less- thrustrr.bit-less-)

  ;;(& agl.zero vaccel.zero vvol.zero)
  ;;(thrustfl.hover thrustrl.hover
  ;;		  thrustfr.hover thrustrr.hover)

  (& agl.zero vaccel.zero vvol.bit-down)
  (thrustfl.bit-more+ thrustrl.bit-more+
		      thrustfr.bit-more+ thrustrr.bit-more+)
  (& agl.zero vaccel.zero vvol.down)
  (thrustfl.strong+4 thrustrl.strong+4
		     thrustfr.strong+4 thrustrr.strong+4)

  (& agl.zero vaccel.accel vvol.bit-down)
  (thrustfl.bit-more+ thrustrl.bit-more+
		      thrustfr.bit-more+ thrustrr.bit-more+)
  (& agl.zero vaccel.decel vvol.bit-down)
  (thrustfl.bit-more thrustrl.bit-more
		     thrustfr.bit-more thrustrr.bit-more)
  (& agl.zero vaccel.accel vvol.down)
  (thrustfl.strong+4 thrustrl.strong+4
		     thrustfr.strong+4 thrustrr.strong+4)
  (& agl.zero vaccel.decel vvol.down)
  (thrustfl.strong+3 thrustrl.strong+3
		     thrustfr.strong+3 thrustrr.strong+3)

  ;; Above and down
  
  (& agl.bit-above vaccel.accel vvol.bit-down)
  (thrustfl.tad-less thrustrl.tad-less
		     thrustfr.tad-less thrustrr.tad-less)
  (& agl.bit-above vaccel.decel vvol.bit-down)
  (thrustfl.hover thrustrl.hover
		  thrustfr.hover thrustrr.hover)
  (& agl.bit-above vaccel.accel vvol.down)
  (thrustfl.strong+1 thrustrl.strong+1
		     thrustfr.strong+1 thrustrr.strong+1)
  (& agl.bit-above vaccel.decel vvol.down)
  (thrustfl.strong+ thrustrl.strong+
		    thrustfr.strong+ thrustrr.strong+)

  (& agl.above vaccel.accel vvol.bit-down)
  (thrustfl.bit-less- thrustrl.bit-less-
		      thrustfr.bit-less- thrustrr.bit-less-)
  (& agl.above vaccel.decel vvol.bit-down)
  (thrustfl.less thrustrl.less
		 thrustfr.less thrustrr.less)
  (& agl.above vaccel.accel vvol.down)
  (thrustfl.bit-less thrustrl.bit-less
		     thrustfr.bit-less thrustrr.bit-less)
  (& agl.above vaccel.decel vvol.down)
  (thrustfl.bit-less- thrustrl.bit-less-
		      thrustfr.bit-less- thrustrr.bit-less-)

  (& agl.way-above vaccel.accel vvol.bit-down)
  (thrustfl.weak thrustrl.weak
		 thrustfr.weak thrustrr.weak)
  (& agl.way-above vaccel.decel vvol.bit-down)
  (thrustfl.weak- thrustrl.weak-
		  thrustfr.weak- thrustrr.weak-)
  (& agl.way-above vaccel.accel vvol.down)
  (thrustfl.weak thrustrl.weak
		 thrustfr.weak thrustrr.weak)
  (& agl.way-above vaccel.decel vvol.down)
  (thrustfl.weak- thrustrl.weak-
		  thrustfr.weak- thrustrr.weak-)

  ;; Above and up
  
  (& agl.bit-above vaccel.accel vvol.up)
  (thrustfl.weak thrustrl.weak
		 thrustfr.weak thrustrr.weak)
  (& agl.bit-above vaccel.decel vvol.up)
  (thrustfl.less- thrustrl.less-
		  thrustfr.less- thrustrr.less-)
  (& agl.bit-above vaccel.accel vvol.bit-up)
  (thrustfl.less thrustrl.less
		 thrustfr.less thrustrr.less)
  (& agl.bit-above vaccel.decel vvol.bit-up)
  (thrustfl.bit-less- thrustrl.bit-less-
		      thrustfr.bit-less- thrustrr.bit-less-)

  (& agl.above vaccel.accel vvol.up)
  (thrustfl.zero thrustrl.zero
		 thrustfr.zero thrustrr.zero)
  (& agl.above vaccel.decel vvol.up)
  (thrustfl.zero thrustrl.zero
		 thrustfr.zero thrustrr.zero)
  (& agl.above vaccel.accel vvol.bit-up)
  (thrustfl.zero thrustrl.zero
		 thrustfr.zero thrustrr.zero)
  (& agl.above vaccel.decel vvol.bit-up)
  (thrustfl.zero thrustrl.zero
		 thrustfr.zero thrustrr.zero)


  (& (v #|(& agl.above vaccel.accel) (& agl.above vaccel.decel)|#
      (& agl.way-above vaccel.accel) (& agl.way-above vaccel.decel))
     (v vvol.up vvol.bit-up))
  (thrustfl.zero thrustrl.zero
		 thrustfr.zero thrustrr.zero))

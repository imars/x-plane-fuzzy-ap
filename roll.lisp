(in-package #:xp-nap)

(sb-ext:gc)

(defrules roll
    ((agl y-agl)
     (roll phi)
     (rollr r-r)
     (rolla r-a)
     (thrustfl thrust)
     (thrustfr thrust)
     (thrustrl thrust)
     (thrustrr thrust))

  ;; === Roll ===
  
  roll.way-left
  (thrustfl.strong+ thrustrl.strong+
		    thrustfr.weak- thrustrr.weak-)
  roll.left
  (thrustfl.strong thrustrl.strong
		   thrustfr.weak thrustrr.weak)
  roll.bit-left
  (thrustfl.bit-more thrustrl.bit-more
		     thrustfr.bit-less thrustrr.bit-less)
  roll.zero
  (thrustfl.hover thrustrl.hover
		  thrustfr.hover thrustrr.hover)
  roll.bit-right
  (thrustfl.bit-less thrustrl.bit-less
		     thrustfr.bit-more thrustrr.bit-more)
  roll.right
  (thrustfl.weak thrustrl.weak
		 thrustfr.strong thrustrr.strong)
  roll.way-right
  (thrustfl.weak- thrustrl.weak-
		  thrustfr.strong+ thrustrr.strong+)

  ;; === Roll velocity ===

  (& roll.left rollr.left)
  (thrustfl.strong+ thrustrl.strong+
		    thrustfr.weak- thrustrr.weak-)
  (& roll.right rollr.right)
  (thrustfl.weak- thrustrl.weak-
		  thrustfr.strong+ thrustrr.strong+)
  (& roll.left rollr.bit-left)
  (thrustfl.more+ thrustrl.more+
		  thrustfr.less- thrustrr.less-)
  (& roll.right rollr.bit-right)
  (thrustfl.less- thrustrl.less-
		  thrustfr.more+ thrustrr.more+)
  
  (& roll.left rollr.right)
  (thrustfl.tad-less thrustrl.tad-less
		     thrustfr.bit-more thrustrr.bit-more)
  (& roll.right rollr.left)
  (thrustfl.bit-more thrustrl.bit-more
		     thrustfr.tad-less thrustrr.tad-less)
  (& roll.left rollr.bit-right)
  (thrustfl.bit-more thrustrl.bit-more
		     thrustfr.bit-less thrustrr.bit-less)
  (& roll.right rollr.bit-left)
  (thrustfl.bit-less thrustrl.bit-less
		     thrustfr.bit-more thrustrr.bit-more)

  
  (& roll.bit-left rollr.left)
  (thrustfl.weak thrustrl.weak
		 thrustfr.strong thrustrr.strong)
  (& roll.bit-right rollr.right)
  (thrustfl.strong thrustrl.strong
		   thrustfr.weak thrustrr.weak)
  (& roll.bit-left rollr.bit-left)
  (thrustfl.more thrustrl.more
		 thrustfr.less thrustrr.less)
  (& roll.bit-right rollr.bit-right)
  (thrustfl.less thrustrl.less
		 thrustfr.more thrustrr.more)

  (& roll.bit-left rollr.right)
  (thrustfl.tad-more thrustrl.tad-more
		     thrustfr.bit-less thrustrr.bit-less)
  (& roll.bit-right rollr.left)
  (thrustfl.bit-less thrustrl.bit-less
		     thrustfr.tad-more thrustrr.tad-more)
  (& roll.bit-left rollr.bit-right)
  (thrustfl.tad-more thrustrl.tad-more
		  thrustfr.hover thrustrr.hover)
  (& roll.bit-right rollr.bit-left)
  (thrustfl.hover thrustrl.hover
		     thrustfr.tad-more thrustrr.tad-more)
  
  ;; Zero
  (& roll.zero rollr.left)
  (thrustfl.more+ thrustrl.more+
		  thrustfr.less- thrustrr.less-)
  (& roll.zero rollr.bit-left)
  (thrustfl.bit-more+ thrustrl.bit-more+
		      thrustfr.bit-less- thrustrr.bit-less-)
  (& roll.zero rollr.zero agl.zero)
  (thrustfl.hover thrustrl.hover
		  thrustfr.hover thrustrr.hover)
  (& roll.zero rollr.bit-right)
  (thrustfl.bit-less- thrustrl.bit-less-
		      thrustfr.bit-more+ thrustrr.bit-more+)
  (& roll.zero rollr.right)
  (thrustfl.less- thrustrl.less-
		  thrustfr.more+ thrustrr.more+)
  
  
  ;; === Roll Acceleration ===

  ;; Medium
  
  (& roll.right rolla.accel rollr.right)
  (thrustfl.weak thrustrl.weak
		   thrustfr.strong thrustrr.strong)
  (& roll.right rolla.decel rollr.right)
  (thrustfl.more thrustrl.more
		 thrustfr.less thrustrr.less)
  (& roll.left rolla.accel rollr.left)
  (thrustfl.strong thrustrl.strong
		 thrustfr.weak thrustrr.weak)
  (& roll.left rolla.decel rollr.left)
  (thrustfl.more thrustrl.more
		 thrustfr.less thrustrr.less)
  
  (& roll.right rolla.accel rollr.left)
  (thrustfl.tad-more thrustrl.tad-more
		  thrustfr.hover thrustrr.hover)
  (& roll.right rolla.decel rollr.left)
  (thrustfl.tad-more thrustrl.tad-more
		     thrustfr.tad-less thrustrr.tad-less)
  (& roll.left rolla.accel rollr.right)
  (thrustfl.hover thrustrl.hover
		     thrustfr.tad-more thrustrr.tad-more)
  (& roll.left rolla.decel rollr.right)
  (thrustfl.tad-less thrustrl.tad-less
		     thrustfr.tad-more thrustrr.tad-more)

  (& roll.right rolla.accel rollr.bit-right)
  (thrustfl.less thrustrl.less
		 thrustfr.more thrustrr.more)
  (& roll.right rolla.decel rollr.bit-right)
  (thrustfl.bit-less- thrustrl.bit-less-
		     thrustfr.bit-more+ thrustrr.bit-more+)
  (& roll.left rolla.accel rollr.bit-left)
  (thrustfl.more thrustrl.more
		      thrustfr.less thrustrr.less)
  (& roll.left rolla.decel rollr.bit-left)
  (thrustfl.bit-more+ thrustrl.bit-more+
		      thrustfr.bit-less- thrustrr.bit-less-)

  (& roll.right rolla.accel rollr.bit-left)
  (thrustfl.hover thrustrl.hover
		  thrustfr.tad-more thrustrr.tad-more)
  (& roll.right rolla.decel rollr.bit-left)
  (thrustfl.tad-less thrustrl.tad-less
		     thrustfr.tad-more thrustrr.tad-more)
  (& roll.left rolla.accel rollr.bit-right)
  (thrustfl.tad-more thrustrl.tad-more
		     thrustfr.hover thrustrr.hover)
  (& roll.left rolla.decel rollr.bit-right)
  (thrustfl.tad-more thrustrl.tad-more
		     thrustfr.tad-less thrustrr.tad-less)

  ;; Small
  
  (& roll.bit-right rolla.accel rollr.right)
  (thrustfl.weak thrustrl.weak
		 thrustfr.strong thrustrr.strong)
  (& roll.bit-right rolla.decel rollr.right)
  (thrustfl.less- thrustrl.less-
		  thrustfr.more+ thrustrr.more+)
  (& roll.bit-left rolla.accel rollr.left)
  (thrustfl.strong thrustrl.strong
		   thrustfr.weak thrustrr.weak)
  (& roll.bit-left rolla.decel rollr.left)
  (thrustfl.more+ thrustrl.more+
		  thrustfr.less- thrustrr.less-)
  
  (& roll.bit-right rolla.accel rollr.left)
  (thrustfl.bit-more+ thrustrl.bit-more+
		      thrustfr.less thrustrr.less)
  (& roll.bit-right rolla.decel rollr.left)
  (thrustfl.bit-more thrustrl.bit-more
		     thrustfr.bit-less- thrustrr.bit-less-)
  (& roll.bit-left rolla.accel rollr.right)
  (thrustfl.less thrustrl.less
		 thrustfr.bit-more+ thrustrr.bit-more+)
  (& roll.bit-left rolla.decel rollr.right)
  (thrustfl.bit-less- thrustrl.bit-less-
		      thrustfr.bit-more thrustrr.bit-more)
  
  (& roll.bit-right rolla.accel rollr.bit-right)
  (thrustfl.less thrustrl.less
		 thrustfr.more thrustrr.more)
  (& roll.bit-right rolla.decel rollr.bit-right)
  (thrustfl.bit-less- thrustrl.bit-less-
		      thrustfr.bit-more+ thrustrr.bit-more+)
  (& roll.bit-left rolla.accel rollr.bit-left)
  (thrustfl.more thrustrl.more
		 thrustfr.less thrustrr.less)
  (& roll.bit-left rolla.decel rollr.bit-left)
  (thrustfl.bit-more+ thrustrl.bit-more+
		      thrustfr.bit-less- thrustrr.bit-less-)
  
  (& roll.bit-right rolla.accel rollr.bit-left)
  (thrustfl.hover thrustrl.hover
		  thrustfr.bit-less thrustrr.bit-less)
  (& roll.bit-right rolla.decel rollr.bit-left)
  (thrustfl.hover thrustrl.hover
		  thrustfr.tad-less thrustrr.tad-less)
  (& roll.bit-left rolla.accel rollr.bit-right)
  (thrustfl.bit-less thrustrl.bit-less
		     thrustfr.hover thrustrr.hover)
  (& roll.bit-left rolla.decel rollr.bit-right)
  (thrustfl.tad-less thrustrl.tad-less
		     thrustfr.hover thrustrr.hover)

  
  
  ;; Zero
  
  (& roll.zero rolla.accel rollr.right)
  (thrustfl.strong thrustrl.strong
		   thrustfr.weak thrustrr.weak)
  (& roll.zero rolla.decel rollr.right)
  (thrustfl.more+ thrustrl.more+
		  thrustfr.less- thrustrr.less-)
  (& roll.zero rolla.accel rollr.bit-right)
  (thrustfl.bit-more+ thrustrl.bit-more+
		      thrustfr.bit-less- thrustrr.bit-less-)
  (& roll.zero rolla.decel rollr.bit-right)
  (thrustfl.bit-more thrustrl.bit-more
		     thrustfr.bit-less thrustrr.bit-less)

  (& roll.zero rolla.zero rollr.zero)
  (thrustfl.hover thrustrl.hover
		  thrustfr.hover thrustrr.hover)

  (& roll.zero rolla.accel rollr.left)
  (thrustfl.weak thrustrl.weak
		 thrustfr.strong thrustrr.strong)
  (& roll.zero rolla.decel rollr.left)
  (thrustfl.less- thrustrl.less-
		  thrustfr.more+ thrustrr.more+)
  (& roll.zero rolla.accel rollr.bit-left)
  (thrustfl.bit-less- thrustrl.bit-less-
		      thrustfr.bit-more+ thrustrr.bit-more+)
  (& roll.zero rolla.decel rollr.bit-left)
  (thrustfl.bit-less thrustrl.bit-less
		     thrustfr.bit-more thrustrr.bit-more))

  
	       
	       


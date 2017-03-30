(in-package #:xp-nap)

(sb-ext:gc)

(defrules pitch
    ((agl y-agl)
     (pitch theta)
     (pitchr p-r)
     (pitcha p-a)
     (thrustfl thrust)
     (thrustfr thrust)
     (thrustrl thrust)
     (thrustrr thrust))

  ;; === Pitch ===
  
  pitch.way-front
  (thrustfl.strong+ thrustrl.weak-
		    thrustfr.strong+ thrustrr.weak-)
  pitch.front
  (thrustfl.strong thrustrl.weak
		   thrustfr.strong thrustrr.weak)
  pitch.bit-front
  (thrustfl.bit-more thrustrl.bit-less
		     thrustfr.bit-more thrustrr.bit-less)
  pitch.zero
  (thrustfl.hover thrustrl.hover
		  thrustfr.hover thrustrr.hover)
  pitch.bit-back
  (thrustfl.bit-less thrustrl.bit-more
		     thrustfr.bit-less thrustrr.bit-more)
  pitch.back
  (thrustfl.weak thrustrl.strong
		 thrustfr.weak thrustrr.strong)
  pitch.way-back
  (thrustfl.weak- thrustrl.strong+
		  thrustfr.weak- thrustrr.strong+)

  ;; === Pitch velocity ===
  
  (& pitch.back pitchr.back)
  (thrustfl.weak- thrustrl.strong+
		  thrustfr.weak- thrustrr.strong+)
  (& pitch.front pitchr.front)
  (thrustfl.strong+ thrustrl.weak-
		    thrustfr.strong+ thrustrr.weak-)
  (& pitch.back pitchr.bit-back)
  (thrustfl.less- thrustrl.more+
		  thrustfr.less- thrustrr.more+)
  (& pitch.front pitchr.bit-front)
  (thrustfl.more+ thrustrl.less-
		  thrustfr.more+ thrustrr.less-)
  
  (& pitch.back pitchr.front)
  (thrustfl.bit-more thrustrl.tad-less
		     thrustfr.bit-more thrustrr.tad-less)
  (& pitch.front pitchr.back)
  (thrustfl.tad-less thrustrl.bit-more
		     thrustfr.tad-less thrustrr.bit-more)
  (& pitch.back pitchr.bit-front)
  (thrustfl.bit-less thrustrl.bit-more
		     thrustfr.bit-less thrustrr.bit-more)
  (& pitch.front pitchr.bit-back)
  (thrustfl.bit-more thrustrl.bit-less
		     thrustfr.bit-more thrustrr.bit-less)

  
  (& pitch.bit-back pitchr.back)
  (thrustfl.weak thrustrl.strong
		 thrustfr.weak thrustrr.strong)
  (& pitch.bit-front pitchr.front)
  (thrustfl.strong thrustrl.weak
		   thrustfr.strong thrustrr.weak)
  (& pitch.bit-back pitchr.bit-back)
  (thrustfl.less thrustrl.more
		 thrustfr.less thrustrr.more)
  (& pitch.bit-front pitchr.bit-front)
  (thrustfl.more thrustrl.less
		 thrustfr.more thrustrr.less)
  
  (& pitch.bit-back pitchr.front)
  (thrustfl.tad-more thrustrl.bit-less
		     thrustfr.tad-more thrustrr.bit-less)
  (& pitch.bit-front pitchr.back)
  (thrustfl.bit-less thrustrl.tad-more
		     thrustfr.bit-less thrustrr.tad-more)
  (& pitch.bit-back pitchr.bit-front)
  (thrustfl.hover thrustrl.tad-more
		  thrustfr.hover thrustrr.tad-more)
  (& pitch.bit-front pitchr.bit-back)
  (thrustfl.tad-more thrustrl.hover
		     thrustfr.tad-more thrustrr.hover)
  
  ;; Zero
  (& pitch.zero pitchr.back)
  (thrustfl.less- thrustrl.more+
		  thrustfr.less- thrustrr.more+)
  (& pitch.zero pitchr.bit-back)
  (thrustfl.bit-less- thrustrl.bit-more+
		      thrustfr.bit-less- thrustrr.bit-more+)
  (& pitch.zero pitchr.zero agl.zero)
  (thrustfl.hover thrustfl.hover
		  thrustfr.hover thrustrr.hover)
  (& pitch.zero pitchr.bit-front)
  (thrustfl.bit-more+ thrustrl.bit-less-
		      thrustfr.bit-more+ thrustrr.bit-less-)
  (& pitch.zero pitchr.front)
  (thrustfl.more+ thrustrl.less-
		  thrustfr.more+ thrustrr.less-)
  

  ;; === Pitch Acceleration ===

  ;; Medium

  (& pitch.front pitcha.accel pitchr.front)
  (thrustfl.strong thrustrl.weak
		   thrustfr.strong thrustrr.weak)
  (& pitch.front pitcha.decel pitchr.front)
  (thrustfl.more thrustrl.less
		 thrustfr.more thrustrr.less)
  (& pitch.back pitcha.accel pitchr.back)
  (thrustfl.weak thrustrl.strong
		 thrustfr.weak thrustrr.strong)
  (& pitch.back pitcha.decel pitchr.back)
  (thrustfl.less thrustrl.more
		 thrustfr.less thrustrr.more)
  
  (& pitch.front pitcha.accel pitchr.back)
  (thrustfl.hover thrustrl.tad-more
		  thrustfr.hover thrustrr.tad-more)
  (& pitch.front pitcha.decel pitchr.back)
  (thrustfl.tad-less thrustrl.tad-more
		     thrustfr.tad-less thrustrr.tad-more)
  (& pitch.back pitcha.accel pitchr.front)
  (thrustfl.tad-more thrustrl.hover
		     thrustfr.tad-more thrustrr.hover)
  (& pitch.back pitcha.decel pitchr.front)
  (thrustfl.tad-more thrustrl.tad-less
		     thrustfr.tad-more thrustrr.tad-less)
  
  (& pitch.front pitcha.accel pitchr.bit-front)
  (thrustfl.more thrustrl.less
		 thrustfr.more thrustrr.less)
  (& pitch.front pitcha.decel pitchr.bit-front)
  (thrustfl.bit-more+ thrustrl.bit-less-
		      thrustfr.bit-more+ thrustrr.bit-less-)
  (& pitch.back pitcha.accel pitchr.bit-back)
  (thrustfl.less thrustrl.more
		 thrustfr.less thrustrr.more)
  (& pitch.back pitcha.decel pitchr.bit-back)
  (thrustfl.bit-less- thrustrl.bit-more+
		      thrustfr.bit-less- thrustrr.bit-more+)

  (& pitch.front pitcha.accel pitchr.bit-back)
  (thrustfl.tad-more thrustrl.hover
		     thrustfr.tad-more thrustrr.hover)
  (& pitch.front pitcha.decel pitchr.bit-back)
  (thrustfl.tad-more thrustrl.tad-less
		     thrustfr.tad-more thrustrr.tad-less)
  (& pitch.back pitcha.accel pitchr.bit-front)
  (thrustfl.hover thrustrl.tad-more
		  thrustfr.hover thrustrr.tad-more)
  (& pitch.back pitcha.decel pitchr.bit-front)
  (thrustfl.tad-less thrustrl.tad-more
		     thrustfr.tad-less thrustrr.tad-more)
  
  ;; Small
  
  (& pitch.bit-front pitcha.accel pitchr.front)
  (thrustfl.strong thrustrl.weak
		   thrustfr.strong thrustrr.weak)
  (& pitch.bit-front pitcha.decel pitchr.front)
  (thrustfl.more+ thrustrl.less-
		  thrustfr.more+ thrustrr.less-)
  (& pitch.bit-back pitcha.accel pitchr.back)
  (thrustfl.weak thrustrl.strong
		 thrustfr.weak thrustrr.strong)
  (& pitch.bit-back pitcha.decel pitchr.back)
  (thrustfl.less- thrustrl.more+
		  thrustfr.less- thrustrr.more+)
  
  (& pitch.bit-front pitcha.accel pitchr.back)
  (thrustfl.less thrustrl.bit-more+
		 thrustfr.less thrustrr.bit-more+)
  (& pitch.bit-front pitcha.decel pitchr.back)
  (thrustfl.bit-less- thrustrl.bit-more
		      thrustfr.bit-less- thrustrr.bit-more)
  (& pitch.bit-back pitcha.accel pitchr.front)
  (thrustfl.bit-more+ thrustrl.less
		      thrustfr.bit-more+ thrustrr.less)
  (& pitch.bit-back pitcha.decel pitchr.front)
  (thrustfl.bit-more thrustrl.bit-less-
		     thrustfr.bit-more thrustrr.bit-less-)

  (& pitch.bit-front pitcha.accel pitchr.bit-front)
  (thrustfl.more thrustrl.less
		 thrustfr.more thrustrr.less)
  (& pitch.bit-front pitcha.decel pitchr.bit-front)
  (thrustfl.bit-more+ thrustrl.bit-less-
		      thrustfr.bit-more+ thrustrr.bit-less-)
  (& pitch.bit-back pitcha.accel pitchr.bit-back)
  (thrustfl.less thrustrl.more
		 thrustfr.less thrustrr.more)
  (& pitch.bit-back pitcha.decel pitchr.bit-back)
  (thrustfl.bit-less- thrustrl.bit-more+
		      thrustfr.bit-less- thrustrr.bit-more+)
  
  (& pitch.bit-front pitcha.accel pitchr.bit-back)
  (thrustfl.bit-less thrustrl.hover
		     thrustfr.bit-less thrustrr.hover)
  (& pitch.bit-front pitcha.decel pitchr.bit-back)
  (thrustfl.tad-less thrustrl.hover
		     thrustfr.tad-less thrustrr.hover)
  (& pitch.bit-back pitcha.accel pitchr.bit-front)
  (thrustfl.hover thrustrl.bit-less
		  thrustfr.hover thrustrr.bit-less)
  (& pitch.bit-back pitcha.decel pitchr.bit-front)
  (thrustfl.hover thrustrl.tad-less
		  thrustfr.hover thrustrr.tad-less)

  
  
  ;; Zero
  
  (& pitch.zero pitcha.accel pitchr.front)
  (thrustfl.strong thrustrl.weak
		   thrustfr.strong thrustrr.weak)
  (& pitch.zero pitcha.decel pitchr.front)
  (thrustfl.more+ thrustrl.less-
		  thrustfr.more+ thrustrr.less-)
  (& pitch.zero pitcha.accel pitchr.bit-front)
  (thrustfl.bit-more+ thrustrl.bit-less-
		      thrustfr.bit-more+ thrustrr.bit-less-)
  (& pitch.zero pitcha.decel pitchr.bit-front)
  (thrustfl.bit-more thrustrl.bit-less
		     thrustfr.bit-more thrustrr.bit-less)

  (& pitch.zero pitcha.zero pitchr.zero)
  (thrustfl.hover thrustrl.hover
		  thrustfr.hover thrustrr.hover)

  (& pitch.zero pitcha.accel pitchr.back)
  (thrustfl.weak thrustrl.strong
		 thrustfr.weak thrustrr.strong)
  (& pitch.zero pitcha.decel pitchr.back)
  (thrustfl.less- thrustrl.more+
		  thrustfr.less- thrustrr.more+)
  (& pitch.zero pitcha.accel pitchr.bit-back)
  (thrustfl.bit-less- thrustrl.bit-more+
		      thrustfr.bit-less- thrustrr.bit-more+)
  (& pitch.zero pitcha.decel pitchr.bit-back)
  (thrustfl.bit-less thrustrl.bit-more
		     thrustfr.bit-less thrustrr.bit-more))

  
	       
	       


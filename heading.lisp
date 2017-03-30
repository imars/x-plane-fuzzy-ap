(in-package #:xp-nap)

(defrules heading
    ((yaw psi)
     (yawr q-r)
     (yawa q-a)
     (thrustfl thrust)
     (thrustfr thrust)
     (thrustrl thrust)
     (thrustrr thrust))

     ;; Yaw
     yaw.way-left (thrustfl.more thrustfr.less
				 thrustrl.less thrustrr.more)
     yaw.left (thrustfl.bit-more thrustfr.bit-less
				 thrustrl.bit-less thrustrr.bit-more)
     yaw.bit-left (thrustfl.tad-more thrustfr.tad-less
				     thrustrl.tad-less thrustrr.tad-more)
     yaw.zero (thrustfl.hover thrustfr.hover
			      thrustrl.hover thrustrr.hover)
     yaw.bit-right (thrustfl.tad-less thrustfr.tad-more
				      thrustrl.tad-more thrustrr.tad-less)
     yaw.right (thrustfl.bit-less thrustfr.bit-more
				  thrustrl.bit-more thrustrr.bit-less)
     yaw.way-right (thrustfl.less thrustfr.more
				  thrustrl.more thrustrr.less)

     ;; Rate
     (& yawr.left yaw.left)
     (thrustfl.more+ thrustfr.bit-less-
		      thrustrl.bit-less- thrustrr.more+)
     
     (& yawr.left yaw.bit-left)
     (thrustfl.more thrustfr.less
		    thrustrl.less thrustrr.more)
     (& yawr.bit-left yaw.left)
     (thrustfl.bit-more thrustfr.bit-less
			thrustrl.bit-less thrustrr.bit-more)
     (& yawr.bit-left yaw.bit-left)
     (thrustfl.tad-more thrustfr.tad-less
			thrustrl.tad-less thrustrr.tad-more)

     (& yawr.left yaw.right)
     (thrustfl.bit-more thrustfr.bit-less
			thrustrl.bit-less thrustrr.bit-more)
     (& yawr.left yaw.bit-right)
     (thrustfl.more thrustfr.less
		    thrustrl.less thrustrr.more)
     (& yawr.bit-left yaw.bit-right)
     (thrustfl.tad-more thrustfr.tad-less
			thrustrl.tad-less thrustrr.tad-more)

     (& yawr.left yaw.zero)
     (thrustfl.more thrustfr.less
		    thrustrl.less thrustrr.more)
     (& yawr.bit-left yaw.zero)
     (thrustfl.tad-more thrustfr.tad-less
			thrustrl.tad-less thrustrr.tad-more)
     (& yawr.zero yaw.zero)
     (thrustfl.hover thrustfr.hover
		     thrustrl.hover thrustrr.hover)
     (& yawr.bit-right yaw.zero)
     (thrustfl.tad-less thrustfr.tad-more
			thrustrl.tad-more thrustrr.tad-less)
     (& yawr.right yaw.zero)
     (thrustfl.less thrustfr.more
		    thrustrl.more thrustrr.less)

     (& yawr.bit-right yaw.bit-left)
     (thrustfl.tad-less thrustfr.tad-more
			thrustrl.tad-more thrustrr.tad-less)
     (& yawr.right yaw.bit-left)
     (thrustfl.less thrustfr.more
		    thrustrl.more thrustrr.less)
     (& yawr.right yaw.left)
     (thrustfl.bit-less thrustfr.bit-more
			thrustrl.bit-more thrustrr.bit-less)

     (& yawr.right yaw.right)
     (thrustfl.bit-less- thrustfr.more+
		      thrustrl.more+ thrustrr.bit-less-)
     (& yawr.right yaw.bit-right)
     (thrustfl.less thrustfr.more
		    thrustrl.more thrustrr.less)
     (& yawr.bit-right yaw.right)
     (thrustfl.bit-less thrustfr.bit-more
			thrustrl.bit-more thrustrr.bit-less)
     (& yawr.bit-right yaw.bit-right)
     (thrustfl.tad-less thrustfr.tad-more
			thrustrl.tad-more thrustrr.tad-less)
     )


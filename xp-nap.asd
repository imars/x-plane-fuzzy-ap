;;;; xp-nap.asd
;;;;
;;;; Copyright (c) 2016 Ian Marshall 

(asdf:defsystem #:xp-nap
  :description "An x-plane UDP logic pilot."
  :author "Ian Marshall <i.marshall@mac.com>"
  :license ""
  :depends-on (#:x-plane-udp
	       #:cl-fuzl)
  :serial t
  :components ((:file "package")
	       (:file "parameters")
	       (:file "utils")
	       (:file "altitude" :depends-on ("parameters"))
	       (:file "pitch" :depends-on ("parameters"))
	       (:file "roll" :depends-on ("parameters"))
	       (:file "latitude" :depends-on ("parameters"))
	       (:file "latitudev" :depends-on ("parameters"))
	       (:file "longitude" :depends-on ("parameters"))
	       (:file "longitudev" :depends-on ("parameters"))
	       (:file "heading" :depends-on ("parameters"))
	       (:file "xp-nap" :depends-on ("package"
					    "utils"
					    "parameters"
					    "heading"
					    "latitude"
					    "latitudev"
					    "longitude"
					    "longitudev"
					    "pitch"
					    "roll"
					    "altitude"))))


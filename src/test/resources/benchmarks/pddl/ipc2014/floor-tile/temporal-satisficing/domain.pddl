;;Created by Tomas de la Rosa
;;Domain for painting floor tiles with two colors

(define (domain floor-tile)
 (:requirements :typing )
 (:types robot tile color - object)

(:predicates 	
		(robot-at ?r - robot ?x - tile)
		(up ?x - tile ?y - tile)
		(down ?x - tile ?y - tile)
		(right ?x - tile ?y - tile)
		(left ?x - tile ?y - tile)		
		(clear ?x - tile)
                (painted ?x - tile ?c - color)
		(robot-has ?r - robot ?c - color)
                (available-color ?c - color)
                (free-color ?r - robot))

(:action change-color
  :parameters (?r - robot ?c - color ?c2 - color)
  :precondition (and (at start robot-has ?r ?c)
  		  (over all available-color ?c2))
  :effect (and (at start (not (robot-has ?r ?c)))
  	       (at end (robot-has ?r ?c2))))

(:action paint-up
  :parameters (?r - robot ?y - tile ?x - tile ?c - color)
  :precondition (and (over all (robot-has ?r ?c))
  		  (at start (robot-at ?r ?x))
		  (over all (up ?y ?x))
		  (at start (clear ?y)))
  :effect (and (at start (not (clear ?y)))
  	       (at end (painted ?y ?c))))

(:action paint-down
  :parameters (?r - robot ?y - tile ?x - tile ?c - color)
  :precondition (and (over all (robot-has ?r ?c))
  		  (at start (robot-at ?r ?x))
		  (over all (down ?y ?x))
		  (at start (clear ?y)))
  :effect (and (at start (not (clear ?y)))
  	       (at end (painted ?y ?c))))


; Robot movements
(:action up 
  :parameters (?r - robot ?x - tile ?y - tile)
  :precondition (and (at start (robot-at ?r ?x)) 
  		  (over all (up ?y ?x)) 
		  (at start (clear ?y)))
  :effect (and 
  	       (at start (not (robot-at ?r ?x)))
	       (at end (robot-at ?r ?y))
	       (at start (not (clear ?y)))
               (at end (clear ?x))))

(:action down 
  :parameters (?r - robot ?x - tile ?y - tile)
  :precondition (and (at start (robot-at ?r ?x))
  		  (over all (down ?y ?x)) 
		  (at start (clear ?y)))
  :effect (and (at start (not (robot-at ?r ?x)))
  	       (at end (robot-at ?r ?y))
	       (at start (not (clear ?y)))
               (at end (clear ?x))))

(:action right 
  :parameters (?r - robot ?x - tile ?y - tile)
  :precondition (and (at start (robot-at ?r ?x))
  		  (over all (right ?y ?x))
		  (at start (clear ?y)))
  :effect (and (at start (not (robot-at ?r ?x)))
  	       (at end (robot-at ?r ?y))
	       (at start (not (clear ?y)))
               (at end (clear ?x))))

(:action left 
  :parameters (?r - robot ?x - tile ?y - tile)
  :precondition (and (at start (robot-at ?r ?x)) 
  		  (over all (left ?y ?x)) 
		  (at start (clear ?y)))
  :effect (and (at start (not (robot-at ?r ?x)))
  	       (at end (robot-at ?r ?y))
	       (at start (not (clear ?y)))
               (at end (clear ?x))))
)

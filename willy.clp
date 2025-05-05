(deffacts estadoInicial
    (hice nada) ;
    (ant nada)
    (nMovimientos 0) ;
    (act inicial)
)

(defrule actAntNorth (declare (salience 1000))
   ?act <- (act nada)
   ?ant <- (ant ?x)
   (hice north)
   =>
   (retract ?ant)
   (assert (ant south))
   (retract ?act)
   (assert (act algo))
)

(defrule actAntSouth  (declare (salience 1000))
   ?act <- (act nada)
   ?ant <- (ant ?x)
   (hice south)
   =>
   (retract ?ant)
   (assert (ant north))
   (retract ?act)
   (assert (act algo))
)

(defrule actAntEast (declare (salience 1000))
   ?act <- (act nada)
   ?ant <- (ant ?x)
   (hice east)
   =>
   (retract ?ant)
   (assert (ant west))
   (retract ?act)
   (assert (act algo))
)

(defrule actAntWest  (declare (salience 1000))
   ?act <- (act nada)
   ?ant <- (ant ?x)
   (hice west)
   =>
   (retract ?ant)
   (assert (ant east))
   (retract ?act)
   (assert (act algo))
)
(defrule moverWillyInicio
    (directions $? ?dir $?)
    ?h <- (hice ?x)
    ?act <- (act inicial)
    =>
	(retract ?h)
	(assert (hice ?dir))
   (retract ?act)
   (assert (act nada))    
   (moveWilly ?dir)
)

(defrule moverWilly
    (directions $? ?dir $?)
    ?h <- (hice ?x)
    ?act <- (act algo)
    =>
	(retract ?h)
	(assert (hice ?dir))
   (retract ?act)
   (assert (act nada))    
   (moveWilly ?dir)
)

(defrule moverWillySouth (declare (salience 1))
    (directions $? south $?)
	?h <- (hice east)
    =>
	(retract ?h)
	(assert (hice south))
    (moveWilly south)
)

(defrule moverWillyEast (declare (salience 1))
    (directions $? east $?)
	?h <- (hice south)
    =>
	(retract ?h)
	(assert (hice east))
    (moveWilly east)
)

(defrule perceptPull (declare (salience 200))
   (percepts Pull)
   (ant ?ant)
   =>
   (moveWilly ?ant)
)








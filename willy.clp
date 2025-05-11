(deffacts estadoInicial
    (hice nada) ;
    (ant nada)
    (nMovimientos 0) ;
    (act inicial)
    (pos 0 0)
)

(defrule actAntNorth (declare (salience 1000))
   ?act <- (act nada)
   ?ant <- (ant ?)
   (hice north)
    ?pos <- (pos ?x1 ?y1)
   =>
   (retract ?ant)
   (assert (ant south))
   (retract ?act)
   (assert (act algo))
    (retract ?pos)
   (assert (pos ?x1 (- ?y1 1)))
)

(defrule actAntSouth  (declare (salience 1000))
   ?act <- (act nada)
   ?ant <- (ant ?)
   (hice south)
    ?pos <- (pos ?x1 ?y1)
   =>
   (retract ?ant)
   (assert (ant north))
   (retract ?act)
   (assert (act algo))
    (retract ?pos)
   (assert (pos ?x1 (+ ?y1 1)))
)

(defrule actAntEast (declare (salience 1000))
   ?act <- (act nada)
   ?ant <- (ant ?)
   (hice east)
   ?pos <- (pos ?x1 ?y1)
   =>
   (retract ?ant)
   (assert (ant west))
   (retract ?act)
   (assert (act algo))
    (retract ?pos)
   (assert (pos (+ ?x1 1) ?y1))
)

(defrule actAntWest  (declare (salience 1000))
   ?act <- (act nada)
   ?ant <- (ant ?)
   (hice west)
   ?pos <- (pos ?x1 ?y1)
   =>
   (retract ?ant)
   (assert (ant east))
   (retract ?act)
   (assert (act algo))
      (retract ?pos)
   (assert (pos (- ?x1 1) ?y1))
)
(defrule moverWillyInicio
    ?act <- (act inicial)
    ?h <- (hice nada)
    =>
    (retract ?h)
	(assert (hice east))
   (retract ?act)
   (assert (act nada))
   (moveWilly east)
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
    ?act <- (act algo)
    =>
	(retract ?h)
	(assert (hice south))
    (retract ?act)
   (assert (act nada)) 
    (moveWilly south)
)

(defrule moverWillyEast (declare (salience 1))
    (directions $? east $?)
	?h <- (hice south)
    ?act <- (act algo)
    =>
	(retract ?h)
	(assert (hice east))
    (retract ?act)
   (assert (act nada)) 
    (moveWilly east)
)

(defrule perceptPull (declare (salience 2000))
   (percepts Pull)
   (ant ?ant)
   ?h <- (hice ?hice)
   ?act <- (act algo)
   =>
   (moveWilly ?ant)
   (retract ?h)
   (assert (hice ?ant))
   (retract ?act)
   (assert (act nada))
)

(defrule perceptAlien (declare (salience 2001))
(percepts Noise)
(hasLaser)
(hice ?hice)
(ant ?ant)
(directions ?ant $? ?x $?)
=>
(fireLaser ?x)
)







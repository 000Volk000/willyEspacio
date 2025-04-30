(deffacts estadoInicial
    (hice nada) ;
    (nMovimientos 0) ;
)

(defrule moverWilly
    (directions $? south $?)
    ?h <- (hice nada)
    =>
	(retract ?h)
	(assert (hice south))
    (moveWilly south)
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

(defrule fireWilly
	(hasLaser)
	(directions $? ?direction $?)
	=>
	(fireLaser ?direction)
	)
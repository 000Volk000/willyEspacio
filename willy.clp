(defrule moveWilly
   (directions $? ?direction $?)
   =>
   (moveWilly ?direction)
)

(deffacts initial-fact
   (ant nada) ; Define el hecho inicial
)

(defrule moveWillySouth (declare (salience 10))
   (directions $? south $?) ; Verifica que hay una dirección "south"
   ?a <- (ant ?current)           ; Verifica que el hecho "ant" existe
   =>
   (retract ?a) ; Elimina el hecho actual
   (assert (ant north))     ; Inserta el nuevo valor de "ant"
   (moveWilly south)        ; Realiza el movimiento
)

(defrule moveWillyEast (declare (salience 1))
   (directions $? east $?)  ; Verifica que hay una dirección "east"
   ?a <- (ant ?current)           ; Verifica que el hecho "ant" existe
   =>
   (retract ?a) ; Elimina el hecho actual
   (assert (ant west))      ; Inserta el nuevo valor de "ant"
   (moveWilly east)         ; Realiza el movimiento
)

(defrule perceptPull (declare (salience 200))
   (percepts Pull)
   (ant ?ant)
   =>
   (moveWilly ?ant)
)

(defrule fireWilly
   (hasLaser)
   (directions $? ?direction $?)
   =>
   (fireLaser ?direction)
)
## 21. (Uniones disjuntas, también conocidas como co-productos o sumas) Este ejercicio extiende el cálculo-λ tipado con uniones disjuntas. Las gramáticas de los tipos y los términos se extienden de la siguiente manera:

    τ ::= ... | τ + τ
    M ::= ... | left(M) | right(M) | case M of left(x) -> M1, right(y) -> M2

### donde 
    
    - σ + τ representa el tipo de la unión disjunta entre σ y τ, similar al tipo `Either σ τ` de Haskell, 
    - left(M) y right(M) inyectan un valor en la unión
    - case M of left(x) -> M1, right(y) -> M2 efectúa un análisis de casos del término M comparándolo con los patrones left(x) y right(y).

### a) Definir reglas de tipado para los nuevos constructores de términos.

    G |- M : P
    ____________________(e-left)
    G |- left(M) : P + Q

    G |- M : Q
    _____________________(e-right)
    G |- right(M) : P + Q

    G |- M : P + Q      G, x: P |- M1 : R        G, y: P |- M2 : R
    _______________________________________________________________(e-case)
    G |- case M of left(x) -> M1, right(y) -> M2 : R


### b) Usando las reglas de tipado anteriores, y dados los tipos P, Q y R, exhibir habitantes de los siguientes tipos:

#### i. Inyecciones: P -> (P + Q) y Q -> (P + Q).

    \x: P. left(x) : P -> P + Q

y
    \x: Q. right(x) : P -> P + Q

#### ii. Análisis de casos: (P + Q) -> (P -> R) -> (Q -> R) -> R.

    (\x : P + Q. \y: P -> R. \z: Q -> R. case x of left(x) -> y x, right(x) -> z x) : (P + Q) -> (P -> R) -> (Q -> R) -> R

#### iii. Conmutatividad: (P + Q) -> (Q + P).

                                        _____________________________(ax)         ___________________________(ax)
                                        G, x : P |- x : P                         G, x : Q |- x : Q
        _________________________(ax)   _____________________________(e-right)    ___________________________(e-left)
        G, x : P + Q |- x : P + Q       G, x : P |- right(x) : Q + P              G, x : Q |- left(x) : Q + P
        _____________________________________________________________________________________________________(e-case)
        G, x : P + Q |- case x of left(x) -> right(x), right(x) -> left(x) : Q + P
        _____________________________________________________________________________________________________(->in)
        G |- (\x : P + Q. case x of left(x) -> right(x), right(x) -> left(x)) : (P + Q) -> (Q + P)
    .

#### iv. Asociatividad: ((P + Q) + R) -> (P + (Q + R)) y (P + (Q + R)) -> ((P + Q) + R).

                                                                                                                                        _______________________________________________(ax)
                                                                                                                                        x : P + Q, y: Q |- y : Q   
                                                                                    ________________________________________(ax)        _______________________________________________(e-left)
                                                                                    x : P + Q, y: P |- y : P                            x : P + Q, y: Q |- left(y) : Q + R                            
                                            ________________________________(ax)    ________________________________________(e-left)    _______________________________________________(e-right)
                                            x : P + Q, y: P + Q |- y : P + Q        x : P + Q, y: P |- left(y) : P + (Q + R)            x : P + Q, y: Q |- right(left(y)) : P + (Q + R)
                                            ___________________________________________________________________________________________________________________________________________(e-case)
                                                                                        x : P + Q, y: P + Q |- case y of
                                                                                                                    left(y) -> left(y)
                                                                                                                    right(y) -> right(left(y)) : P + (Q + R)
                                                                                        _______________________________________________________________________________(->i)                     _____________________(ax)      __________________________________________(ax)
                                                                                        x : P + Q |- \y: P + Q. case y of                                                                        x : P + Q |- x: P + Q          x : R |- right(x) : R
                                                                                                                    left(y) -> left(y),                                                                                         __________________________________________(e-right)
                                                                                                                    right(y) -> right(left(y)) : (P + Q) -> P + (Q + R)                                                         x : R |- right(x) : Q + R       
    __________________________________(ax)                                              ______________________________________________________________________________________________________________________________(->e)     __________________________________________(e-right)
    x : (P + Q) + R |- x : (P + Q) + R                                                                              x : P + Q |- (\y: P + Q. case y of                                                                          x : R |- right(right(x)) : P + (Q + R)
                                                                                                                                                left(y) -> left(y),
                                                                                                                                                right(y) -> right(left(y))) x : P + (Q + R)
    ______________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________(e-case)
                                                                                                    x : (P + Q) + R |- case x of 
                                                                                                                        left(x) -> (\y: P + Q. case y of 
                                                                                                                                                left(y) -> left(y)
                                                                                                                                                right(y) -> right(left(y))) x,
                                                                                                                        right(x) -> right(right(x)) : P + (Q + R)
                                                                                                    ________________________________________________________________________________(->in)
                                                                                                    \x : (P + Q) + R. case x of 
                                                                                                                        left(x) -> (\y: P + Q. case y of 
                                                                                                                                                left(y) -> left(y)
                                                                                                                                                right(y) -> right(left(y))) x,
                                                                                                                        right(x) -> right(right(x)) : ((P + Q) + R) -> (P + (Q + R))
    .

    \x : P + (Q + R). case x of 
                        left(x) -> left(left(x)) 
                        right(x) -> (\y: Q + R. case y of 
                                                    left(y) -> left(right(y))
                                                    right(y) -> right(y)) x : ((P + Q) + R) -> (P + (Q + R))


#### v. Distributividad del producto sobre la suma: (P × (Q + R)) -> ((P × Q) + (P × R)) y ((P × Q) + (P × R)) -> (P × (Q + R)).

                                                        ___________________________________(ax)     ___________________________________(ax)     ___________________________________(ax) ___________________________________(ax)
                                                        x: P × (Q + R), y: P, z: Q |- y : P         x: P × (Q + R), y: P, z: Q |- z : Q         x: P × (Q + R), y: P, z: R |- y : P     x: P × (Q + R), y: P, z: R |- z : R
                                                        _______________________________________________________________________________(e-par)  ___________________________________________________________________________(e-par)
                                                                x: P × (Q + R), y: P, z: Q |- (y, z) : (P × Q)                                          x: P × (Q + R), y: P, z: R |- (y, z) : (P × R)
    ___________________________________________(ax)             ______________________________________________________________(e-left)                  _______________________________________________________________(e-right)
    x: P × (Q + R), y: P, z: Q + R |- z : Q + R                 x: P × (Q + R), y: P, z: Q |- left((y, z)) : (P × Q) + (P × R)                          x: P × (Q + R), y: P, z: R |- right((y, z)) : (P × Q) + (P × R)
    ___________________________________________________________________________________________________________________________________________________________________________________________________________________(e-case)
                                                                                        x: P × (Q + R), y: P, z: Q + R |-
                                                                                            case z of
                                                                                                left(z) -> left((y, z))
                                                                                                right(z) -> right((y, z))                                                                                                           _________________________________(ax)
                                                                                            : (P × Q) + (P × R)                                                                                                                     x: P × (Q + R) |- x : P × (Q + R)
                                                                                        __________________________________________(->i)                                                                                             _________________________________(e-proy1)                                      
                                                                                        x: P × (Q + R) |- (\y: P. \z: Q + R.                                                                                                        x: P × (Q + R) |- π1(x) : P
                                                                                            case z of
                                                                                                left(z) -> left((y, z))
                                                                                                right(z) -> right((y, z)))                                                                                                                                                      __________________________________(ax)             
                                                                                            : P -> Q + R -> ((P × Q) + (P × R))                                                                                                                                                 x: P × (Q + R) |- x  : P × (Q + R)
                                                                                        ______________________________________________________________________________________________________________________________________________________________________________(->e)     __________________________________(e-proy2)
                                                                                                                                                                x: P × (Q + R) |- (\y: P. \z: Q + R.                                                                            x: P × (Q + R) |- π2(x)  : Q + R
                                                                                                                                                                    case z of
                                                                                                                                                                        left(z) -> left((y, z))
                                                                                                                                                                        right(z) -> right((y, z))) π1(x) 
                                                                                                                                                                    : Q + R -> ((P × Q) + (P × R))
                                                                                                                                                                __________________________________________________________________________________________________________________________________________________(->e)
                                                                                                                                                                                                                        x: P × (Q + R) |- (\y: P. \z: Q + R. 
                                                                                                                                                                                                                            case z of
                                                                                                                                                                                                                                left(z) -> left((y, z))
                                                                                                                                                                                                                                right(z) -> right((y, z))) π1(x) π2(x) 
                                                                                                                                                                                                                            : (P × Q) + (P × R)
                                                                                                                                                                                                                        ______________________________________________(->i)
                                                                                                                                                                                                                        \x: P × (Q + R). (\y: P. \z: Q + R. 
                                                                                                                                                                                                                            case z of
                                                                                                                                                                                                                                left(z) -> left((y, z))
                                                                                                                                                                                                                                right(z) -> right((y, z))) π1(x) π2(x) 
                                                                                                                                                                                                                            : (P × (Q + R)) -> ((P × Q) + (P × R))
    .

    \x: (P × Q) + (P × R).
        case x of
            left(x) -> (π1(x), left(π2(x))),
            right(x) -> (π1(x), right(π2(x))) : P × (Q + R)


#### vi. Ley de los exponentes: ((P + Q) -> R) -> ((P -> R) × (Q -> R)) y ((P -> R) × (Q -> R)) -> ((P + Q) -> R).

[TODO]


### c) Definir reglas de semántica operacional manteniendo el determinismo y la preservación de tipos.

    si M -> M' entonces left(M) -> left(M')

    si M -> M' entonces right(M) -> right(M')

    si M -> M' entonces case M of left(x) > M1, right(y) > M2 -> case M' of left(x) > M1, right(y) > M2

    case left(V) of left(x) > M1, right(y) > M2 -> M1[x := V]

    case right(V) of left(x) > V1, right(y) > M2 -> M2[y := V]


### d) Demostrar que la relación de reducción definida tiene la propiedad de preservación de tipos.

[papel]

### e) ¿Cómo se extiende el conjunto de los valores? ¿Se verifica la propiedad de progreso?

V := ... | left(V) | right(V)

Se verifica.

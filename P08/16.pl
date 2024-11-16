frutal(frutilla).
frutal(banana).
frutal(manzana).
cremoso(banana).
cremoso(americana).
cremoso(frutilla).

leGusta(X) :- frutal(X), cremoso(X).
cucurucho(X,Y) :- leGusta(X), leGusta(Y).

/*
I.

?- cucurucho(X, Y).
    ?- leGusta(X), leGusta(Y).
        ?- frutal(X), cremoso(X).
            ?- cremoso(X)           { X = frutilla }
                ?- ok
    ?- leGusta(Y)                   { X = frutilla }
        ? frutal(Y), cremoso(Y).
            ?- cremoso(Y)           { X = frutilla, Y = frutilla }
                ?- ok
    ...            
*/

/*
II.

leGusta(X) :- !, frutal(X), cremoso(X).

    no tiene efecto, por tener solo una clausula.

leGusta(X) :- frutal(X), !, cremoso(X).

    se queda con el primer resultado (frutilla).

leGusta(X) :- frutal(X), cremoso(X), !.

    se queda con el primer resultado (frutilla).

cucurucho(X,Y) :- !, leGusta(X), leGusta(Y).

    no tiene efecto, por tener solo una clausula.

cucurucho(X,Y) :- leGusta(X), !, leGusta(Y).

    se queda con el primer resultado (frutilla) para X.

cucurucho(X,Y) :- leGusta(X), leGusta(Y), !.

    se queda con el primer resultado (frutilla) para X e Y.
*/

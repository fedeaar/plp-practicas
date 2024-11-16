/* I. Sean los predicados P(?X) y Q(?X), ¿qué significa la respuesta a la siguiente consulta?

    ?- P(Y), not(Q(Y)).

Encontrar todo Y tal que P(Y) y no Q(Y).
*/

/* II. ¿Qué pasaría si se invirtiera el orden de los literales en la consulta anterior?

El operador de corte del not influiría en los resultados.
*/

/* III. Sea el predicado P(?X), ¿Cómo se puede usar el not para determinar si existe una única Y tal que P(?Y)
es verdadero?
*/

p(a).
p(b).
q(a).

multipleP(X)
    :- p(X), p(Y), X \= Y.
uniqueP(X)
    :- not(multipleP(X)).

multipleQ(X)
    :- q(X), q(Y), X \= Y.
uniqueQ(X)
    :- not(multipleQ(X)).

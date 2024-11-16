/* I. arbol(-A). Genera estructuras de árbol binario, dejando los
valores de los nodos sin instanciar. Deben devolverse todos los 
árboles posibles (es decir, para toda estructura posible, el 
predicado debe devolverla luego de un número finito de pedidos). No debe devolverse dos veces el mismo árbol. */

/* idea: siempre agrando en uno la altura del árbol. Casos:
- izq es el máximo y genero todo der hasta esa altura.
- viceversa con der.
- izq y der son ambos máximos.
*/

% arbol(-A).
arbol(A)
    :-  nat(N),
        arbolDeAltura(A, N).

% arbolDeAltura(-A, +N).
arbolDeAltura(nil, 0).
arbolDeAltura(bin(L, _, R), N)
    :-  prev(N, M),
        arbolDeAltura(L, M),
        arbolDeAlturaMenorA(R, M).
arbolDeAltura(bin(L, _, R), N)
    :-  prev(N, M),
        arbolDeAltura(R, M),
        arbolDeAlturaMenorA(L, M).
arbolDeAltura(bin(L, _, R), N)
    :-  prev(N, M),
        arbolDeAltura(L, M),
        arbolDeAltura(R, M).

% arbolDeAlturaMenorA(-A, +N).
arbolDeAlturaMenorA(A, N)
    :-  rango(M, 0, N),
        arbolDeAltura(A, M).

% nat(-N).
nat(0).
nat(N)
    :-  nat(M),
        N is M + 1.

% prev(+N, -M).
prev(N, M)
    :-  M is N - 1,
        M >= 0.

% rango(-X, +I, +D).
rango(I, I, D)
    :- I < D.
rango(X, I, D)
    :- NI is I + 1, NI < D, rango(X, NI, D).


/* II. nodosEn(?A, +L). Es verdadero cuando A es un árbol cuyos 
nodos pertenecen al conjunto de átomos L (representado 
mediante una lista no vacía, sin orden relevante y sin repetidos). 
Puede asumirse que el árbol se recibe instanciado en su estructura, 
pero no necesariamente en sus nodos. */

% nodosEn(?A, +L).
nodosEn(A, L)
    :-  nonvar(A),
        nodosPertenecen(A, L).
nodosEn(A, L)
    :-  var(A),
        arbol(A),
        nodosPertenecen(A, L).

% nodosPertenecen(+A, +L).
nodosPertenecen(nil, _).
nodosPertenecen(bin(I, X, D), L)
    :-  member(X, L),
        nodosPertenecen(I, L),
        nodosPertenecen(D, L).


/* III. sinRepEn(-A, +L). Genera todos los árboles cuyos nodos 
pertenezcan al alfabeto L y usando como máximo una vez cada símbolo
del mismo. En este caso, no hay infinitos árboles posibles; es
importante que el predicado no devuelva soluciones repetidas y que no
se quede buscando indefinidamente una vez terminado el espacio de
soluciones. */

% sinRepEn(-A, +L).
sinRepEn(A, L)
    :-  largo(L, N),
        M is N + 1,
        arbolDeAlturaMenorA(A, M),
        formadoPor(A, L, []).

% formadoPor(+A, +L, +S). 
% L tiene los elementos a usar, S los que se usaron.
formadoPor(nil, L, L).
formadoPor(bin(I, X, D), Ys, Zs)
    :-  member(X, Ys),
        remover(X, Ys, Ws),
        formadoPor(I, Ws, Vs),
        formadoPor(D, Vs, Zs).

% remover(+X, +Ys, -Zs)
remover(_, [], []).
remover(X, [X | Ys], Ys).
remover(X, [Y | Ys], [Y | Zs])
    :-  X \= Y,
        remover(X, Ys, Zs).

%largo(+L, N)
largo([], 0).
largo([_ | Xs], N)
    :-  largo(Xs, M),
        N is M + 1.

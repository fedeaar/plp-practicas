% asumo definido

% esNodo(+G, ?X) generador.
% esArista(+G, ?X, ?Y) generador, sin repetidos en el caso -X, -Y.

% ejemplo
esNodo(grafo, a).
esNodo(grafo, b).
esNodo(grafo, c).
esNodo(grafo, d).
esNodo(grafo, e).
esNodo(grafo, f).
% no conexo
esNodo(grafoNc, a).
esNodo(grafoNc, b).
esNodo(grafoNc, c).
% estrella
esNodo(grafoEstrella, a).
esNodo(grafoEstrella, b).
esNodo(grafoEstrella, c).
esNodo(grafoEstrella, d).

% ejemplo
parArista(grafo, a, b).
parArista(grafo, a, c).
parArista(grafo, a, d).
parArista(grafo, a, e).
parArista(grafo, b, e).
parArista(grafo, b, d).
parArista(grafo, b, f).
parArista(grafo, c, e).
parArista(grafo, c, f).
parArista(grafo, d, f).
% no conexo
parArista(grafoNc, a, b).
% estrella
parArista(grafoEstrella, a, b).
parArista(grafoEstrella, a, c).
parArista(grafoEstrella, a, d).

esArista(G, X, Y) :- parArista(G, X, Y).
esArista(G, X, Y) :- parArista(G, Y, X).

/* I. caminoSimple(+G,+D,+H,?L) que dice si L es un camino simple en el grafo G
que empieza en D y termina en H. Un camino simple lo representaremos por una
lista de nodos distintos, tal que para cada par de nodos consecutivos en L
existe una arista en G que los conecta. Notar que el primer elemento de L debe
ser D y el último H. Cuando L está sin instanciar, el predicado debe ir devolviendo todos los caminos simples desde D a H sin repetidos (es decir, hay que tener cuidado con los ciclos). */
caminoSimple(G, D, H, L)
    :- caminoSimpleSinNodos(G, D, H, [], L).

% caminoSimpleSinNodos(+G, +D, +H, +N, ?L)
caminoSimpleSinNodos(G, D, D, N, [D])
    :-  esNodo(G, D),
        noPertenece(D, N).
caminoSimpleSinNodos(G, D, H, N, [D | Ls])
    :-  esArista(G, D, X),
        noPertenece(X, N),
        caminoSimpleSinNodos(G, X, H, [D | N], Ls).

% noPertenece(+X, +Ls)
noPertenece(_, []).
noPertenece(X, [L | Ls])
    :-  X \= L,
        noPertenece(X, Ls).


/* II. caminoHamiltoniano(+G,?L). Un camino L en un grafo G es Hamiltoniano sii
L es un camino simple que contiene a todos los nodos G. Implementar el predicado 
que dice si L es un camino Hamiltoniano en G. */
caminoHamiltoniano(G, L)
    :-  esNodo(G, A),
        esNodo(G, B),
        caminoSimple(G, A, B, L),
        not(noIncluyeAlgunNodo(G, L)).

% noIncluyeAlgunNodo(+G, +L)
noIncluyeAlgunNodo(G, L)
    :-  esNodo(G, X),
        noPertenece(X, L).

/* III. esConexo(+G). Dado un grafo dice si este es conexo. Un grafo G es
conexo sii no existe un par de nodos en G tal que no hay un camino simple que
los una. Notar que con esta definición un grafo de un nodo (y sin aristas) es
conexo. */
esConexo(G)
    :- not(noEsConexo(G)).

noEsConexo(G)
    :-  esNodo(G, X),
        esNodo(G, Y),
        not(caminoSimple(G, X, Y, L)).

/* IV. esEstrella(+G). Dado un grafo dice si es un grafo estrella. Un grafo es
estrella sii es conexo y hay un nodo común a todas sus aristas. */
esEstrella(G)
    :-  esConexo(G),
        esNodo(G, X),
        not(hayAristaSinX(G, X)).

hayAristaSinX(G, X)
    :-  esArista(G, A, B),
        X \= A,
        X \= B.

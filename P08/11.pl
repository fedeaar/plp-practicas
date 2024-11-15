% vacío(+T).
vacio(nil).

% raiz(+T, ?T),
not(raiz(nil, _)).
raiz(bin(_, V, _), V). 

% altura(+T, ?N).
altura(nil, 0).
altura(bin(T1, _, T2), N) 
    :-  altura(T1, M1),
        altura(T2, M2),
        N is 1 + max(M1, M2).

% cantidadDeNodos(+T, ?N).
cantidadDeNodos(nil, 0).
cantidadDeNodos(bin(T1, _, T2), N) 
    :-  cantidadDeNodos(T1, M1),
        cantidadDeNodos(T2, M2),
        N is 1 + M1 + M2.

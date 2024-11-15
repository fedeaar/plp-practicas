% I. intersección(+L1, +L2, -L3), tal que L3 es la intersección sin 
%    repeticiones de las listas L1 y L2. Respetando orden de L1.
interseccion_([], _, _, []).
interseccion_([X | Xs], Ys, Rs, Zs) 
    :-  not(member(X, Ys)), 
        interseccion_(Xs, Ys, Rs, Zs). 
interseccion_([X | Xs], Ys, Rs, Zs) 
    :-  member(X, Rs), 
        interseccion_(Xs, Ys, Rs, Zs).
interseccion_([X | Xs], Ys, Rs, [X | Zs]) 
    :-  member(X, Ys), 
        not(member(X, Rs)), 
        interseccion_(Xs, Ys, [X | Rs], Zs). 

interseccion(Xs, Ys, Zs) 
    :-  interseccion_(Xs, Ys, [], Zs).

% II. partir(+N, +L, -L1, -L2), donde L1 tiene los N primeros elementos de L, y
%     L2 el resto. Si L tiene menos de N elementos el predicado debe fallar.
largo([], 0).
largo([_ | Xs], N) 
    :-  largo(Xs, M),
        N is M + 1.

partir(0, Xs, [], Xs).
partir(N, Xs, Ys, Zs) 
    :-  append(Ys, Zs, Xs), 
        largo(Ys, N).

% III. borrar(+ListaOriginal, +X, -ListaSinXs), que elimina todas las 
%      ocurrencias de X de la lista ListaOriginal.
borrar([], _, []).
borrar([X | Xs], X, Zs) 
    :-  borrar(Xs, X, Zs).
borrar([X | Xs], Y, [X | Zs]) 
    :-  X \= Y, 
        borrar(Xs, Y, Zs).

% IV. sacarDuplicados(+L1, -L2), que saca todos los elementos duplicados de 
%     la lista L1.
sacarDuplicados([], []).
sacarDuplicados([X | Xs], Ys) 
    :-  sacarDuplicados(Xs, Ys), 
        member(X, Ys).
sacarDuplicados([X | Xs], [X | Ys]) 
    :-  sacarDuplicados(Xs, Ys),  
        not(member(X, Ys)).

% otra forma:
% sacarDuplicados(Xs, Ys) :- interseccion(Xs, Xs, Ys).

% V. permutación(+L1, ?L2), que tiene éxito cuando L2 es permutación de L1. 
% V. ¿Hay una manera más eficiente de definir este predicado para cuando L2  
%    está instanciada?
sinPrimeraAparicion([], _, []).
sinPrimeraAparicion([X | Xs], X, Xs).
sinPrimeraAparicion([X | Xs], Y, [X | Zs]) 
    :-  X \= Y, 
        sinPrimeraAparicion(Xs, Y, Zs).

permutacion([], []).
permutacion(Xs, Ys)
    :- member(P, Xs), 
       sinPrimeraAparicion(Xs, P, Rs),
       permutacion(Rs, Ps), 
       append([P], Ps, Ys).

% VI. reparto(+L, +N, -LListas) que tenga éxito si LListas es una lista de N 
%     listas (N ≥ 1) de cualquier longitud - incluso vacías - tales que al 
%     concatenarlas se obtiene la lista L.
%     solucion:
%       dividimos en buckets de largo mas o menos similar (len // buckets)
%       si hay excedente, el ultimo lo contiene
partirBest(0, Xs, [], Xs).
partirBest(N, [], Ys, Zs)
    :-  partirBest(M, [], Ys, Zs),
        N is M + 1.
partirBest(N, [X | Xs], [X | Ys], Zs)
    :-  partirBest(M, Xs, Ys, Zs),
        N is M + 1.

partirMultiple(Xs, 1, _, [Xs]).
partirMultiple([], N, S, [[] | Ys])
    :-  partirMultiple([], M, S, Ys),
        N is M + 1.
partirMultiple(Xs, N, S, [Y | Ys])
    :-  partirBest(S, Xs, Y, Ps),
        partirMultiple(Ps, M, S, Ys),
        N is M + 1.

reparto(Xs, N, Ys)
    :-  largo(Xs, M),
        S is max(1, M // N),
        partirMultiple(Xs, N, S, Ys).

% VII. repartoSinVacías(+L, -LListas) similar al anterior, pero ninguna de las 
%     listas de LListas puede ser vacía, y la longitud de LListas puede variar.
partirMultiple2([], 0, _, []).
partirMultiple2(Xs, 1, _, [Xs]) 
    :- Xs \= [].
partirMultiple2([], N, _, Ys)
    :-  partirMultiple2([], M, _, Ys),
        N is M + 1.
partirMultiple2(Xs, N, S, [Y | Ys])
    :-  partirBest(S, Xs, Y, Ps),
        partirMultiple2(Ps, M, S, Ys),
        N is M + 1.

repartoSinVacias(Xs, N, Ys)
    :-  largo(Xs, M),
        S is max(1, M // N),
        partirMultiple2(Xs, N, S, Ys).

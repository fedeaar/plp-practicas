% I. cuadradoSemiMagico(+N, -Ms).
cuadradoSemiMagico(N, Ms)
    :-  nat(X),
        cuadradoSemiMagicoConXeI(X, N, N, Ms).

% cuadradoSemiMagicoConXeI(+X, +N, +I, -Ms).
cuadradoSemiMagicoConXeI(_, _, 0, []).
cuadradoSemiMagicoConXeI(X, N, I, [M | Ms])
    :-  sumaXdeLargoN(X, N, M),
        W is I - 1,
        W >= 0,
        cuadradoSemiMagicoConXeI(X, N, W, Ms).

% sumaXdeLargoN(+X, +N, -Ys).
sumaXdeLargoN(0, 0, []).
sumaXdeLargoN(X, N, [0 | Ys])
    :-  M is N - 1,
        M >= 0,
        sumaXdeLargoN(X, M, Ys).
sumaXdeLargoN(X, N, [Y | Ys])
    :-  M is N - 1,
        M >= 0,
        rango(Y, 1, X),
        Z is X - Y,
        sumaXdeLargoN(Z, M, Ys).

% rango(-X, +I, +D).
rango(X, X, _).
rango(X, Y, Z)
    :-  W is Y + 1,
        W =< Z,
        rango(X, W, Z).

% nat(-X).
nat(0).
nat(N)
    :-  nat(M),
        N is M + 1.

% II. cuadradoMagico(+N, -Ms).
cuadradoMagico(0, []).
cuadradoMagico(N, [M | Ms])
    :-  cuadradoSemiMagico(N, [M | Ms]),
        filaSuma(M, X),
        columnasSuman(X, N, [M | Ms]).

%filaSuma(+X, -Y).
filaSuma([], 0).
filaSuma([X | Xs], Y)
    :-  filaSuma(Xs, S),
        Y is S + X.

% columnasSuman(-X, +I, +Ms)
columnasSuman(_, 0, _).
columnasSuman(X, I, Ms)
    :-  columnaNSuma(I, Ms, X),
        M is I - 1,
        M >= 0,
        columnasSuman(X, M, Ms).

% columnaNSuma(+N, +M, -Y)
columnaNSuma(_, [], 0).
columnaNSuma(N, [M | Ms], Y)
    :-  nesimo(N, M, X),
        columnaNSuma(N, Ms, Z),
        Y is X + Z.

% nesimo(+N, +Xs, -Y)
nesimo(1, [X | _], X).
nesimo(N, [_ | Xs], Y)
    :-  M is N - 1,
        M >= 0,
        nesimo(M, Xs, Y).

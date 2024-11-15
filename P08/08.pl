% parteQueSuma(+L,+S,-P) que es verdadero cuando P es una lista con 
% elementos de L que suman S.
parteQueSuma([], 0, []).
parteQueSuma([X | Xs], N, [X | Zs])
    :-  M is N - X,
        parteQueSuma(Xs, M, Zs).
parteQueSuma([_ | Xs], N, Zs)
    :-  parteQueSuma(Xs, N, Zs).

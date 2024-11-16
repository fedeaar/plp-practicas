% Dado un predicado unario P sobre números naturales, definir un predicado que determine el mínimo X que satisfaga P(X).

% nat(-X).
nat(0).
nat(N)
    :-  nat(M),
        N is M + 1.

minimoP(X)
    :-  nat(X),
        p(X),
        !.

p(15).
p(13).

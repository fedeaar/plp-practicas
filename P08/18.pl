% corteMasParejo(+L,-L1,-L2)
corteMasParejo(L, L1, L2)
    :-  generarCorte(L, L1, L2),
        not(hayMejorCorte(L, L1, L2)).

% generarCorte(+L, -L1, -L2)
generarCorte([L | Ls], [L], Ls).
generarCorte([L | Ls], [L | L1], L2)
    :-  generarCorte(Ls, L1, L2).

% hayMejorCorte(+L, +L1, +L2)
hayMejorCorte(L, L1, L2)
    :-  generarCorte(L, L3, L4),
        suma(L1, S1),
        suma(L2, S2),
        S3 is abs(S2 - S1),
        suma(L3, S4),
        suma(L4, S5),
        S6 is abs(S5 - S4),
        S6 < S3.

% suma(+L, -N).
suma([], 0).
suma([X | Xs], N)
    :-  suma(Xs, M),
        N is X + M.

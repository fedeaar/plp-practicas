% I. inorder(+AB,-Lista).
inorder(nil, []).
inorder(bin(T1, V, T2), L)
    :-  inorder(T1, L1),
        inorder(T2, L2),
        append(L1, [V | L2], L).

% II. arbolConInorder(+Lista,-AB).
arboConInorder([], nil).
arboConInorder([X | Xs], bin(T1, X, T2))
    :-  arboConInorder([], T1),
        arboConInorder(Xs, T2).

% maximoBin(+T, -N).
maximoBin(nil, 0).
maximoBin(bin(T1, X, T2), N)
    :-  maximoBin(T1, P),
        maximoBin(T2, Q),
        N is max(max(P, Q), X).

% minimoBin(+T, -N).
minimoBin(bin(nil, X, nil), X).
minimoBin(bin(nil, X, T1), N)
    :-  T1 \= nil,
        minimoBin(T1, P),
        N is min(P, X).
minimoBin(bin(T1, X, nil), N)
    :-  T1 \= nil,
        minimoBin(T1, P),
        N is min(P, X).
minimoBin(bin(T1, X, T2), N)
    :-  T1 \= nil,
        T2 \= nil,
        minimoBin(T1, P),
        minimoBin(T2, Q),
        N is min(min(P, Q), X).

% III. aBB(+T).
aBB(nil).
aBB(bin(T1, X, T2))
    :-  maximoBin(T1, P),
        P < X,
        T2 = nil,
        aBB(T1).
aBB(bin(T1, X, T2))
    :-  maximoBin(T1, P),
        P < X,
        T2 \= nil,
        minimoBin(T2, Q),
        X < Q,
        aBB(T1),
        aBB(T2).

% IV. aBBInsertar(+X, +T1, -T2).
aBBInsertar(X, nil, bin(nil, X, nil)).
aBBInsertar(X, bin(T1, Y, T2), bin(T3, Y, T2))
    :-  X < Y,
        aBBInsertar(X, T1, T3).
aBBInsertar(X, bin(T1, Y, T2), bin(T1, Y, T3))
    :-  Y < X,
        aBBInsertar(X, T2, T3).

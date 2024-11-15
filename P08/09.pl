% I. desde(+X, -Y).
% si Y se instancia, nunca termina.
desde(X, X).
desde(X, Y) :- N is X + 1, desde(N, Y).

% mayor
% II. desdeReversible(+X, ?Y).
desdeReversible(X, X).
desdeReversible(X, Y)
    :-  nonvar(Y),
        X =< Y.
desdeReversible(X, Y) 
    :-  var(Y),
        N is X + 1, 
        desdeReversible(N, Y).

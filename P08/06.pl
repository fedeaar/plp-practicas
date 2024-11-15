% aplanar(+Xs, -Ys), Ys contiene los elementos de todos los niveles de Xs.
aplanar([], []).
aplanar([[] | Xs], Ys) :- aplanar(Xs, Ys).
aplanar([[Z | Zs] | Xs], Ys) :- aplanar([Z | Zs], Fs), aplanar(Xs, Rs), append(Fs, Rs, Ys).
aplanar([X | Xs], [X | Ys]) :- X \= [], X \= [_|_], aplanar(Xs, Ys).

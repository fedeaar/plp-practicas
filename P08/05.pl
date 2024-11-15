% I. last(?L, ?U), donde U es el último elemento de la lista L.
last([X], X).
last([_ | Xs], Ys) :- last(Xs, Ys).

% II. primeros(?L, ?L1), contiene los primeros elementos de L.
primeros([_], []).
primeros([X | Xs], [X | Ys]) :- primeros(Xs, Ys).

% II. reverse(+L, -L1), donde L1 contiene los mismos elementos que L, pero en orden inverso.
%     reverse(?L, -L1)
reverse([], []).
reverse(Xs, [Y | Ys]) :- last(Xs, Y), primeros(Xs, Zs), reverse(Zs, Ys). 

% III. prefijo(?P, +L), donde P es prefijo de la lista L.
%      prefijo(?P, ?L)
prefijo([], _).
prefijo([X | Xs], [X | Ys]) :- prefijo(Xs, Ys).

% IV. sufijo(?S, +L), donde S es sufijo de la lista L.
%     sufijo(?S, ?L)
sufijo(Xs, Ys) :- reverse(Ys, Zs), prefijo(Ws, Zs), reverse(Ws, Xs).

% V. sublista(?S, +L), donde S es sublista de L.
% sin repetidos
sublista([], _).
sublista(Xs, Ys) :- prefijo(Xs, Ys), Xs \= [].
sublista(Xs, [_ | Ys]) :- sufijo(Xs, Ys), Xs \= [].
sublista(Xs, [_ | Ys]) :- primeros(Ys, Zs), sublista(Xs, Zs), Xs \= [].

% VI. pertenece(?X, +L), que es verdadero sii el elemento X se encuentra en la lista L.
%     pertenece(?X, ?L)
pertenece(X, [X | _]).
pertenece(X, [_ | Xs]) :- pertenece(X, Xs).

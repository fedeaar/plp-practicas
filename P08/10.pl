% intercalar(?L1, ?L2, ?L3)
intercalar(Xs, [], Xs).
intercalar([], Ys, Ys).
intercalar([X | Xs], [Y | Ys], [X, Y | Zs])
    :- intercalar(Xs, Ys, Zs).

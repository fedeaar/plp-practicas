% juntar(?Lista1,?Lista2,?Lista3)
juntar([], Ys, Ys).
juntar([X | Xs], Ys, [X | Zs]) :- juntar(Xs, Ys, Zs).

% nat(-X).
nat(0).
nat(X)
    :-  nat(N),
        X is N + 1.

% rango(-X, +I, +D).
rango(Izq, Izq, Der).
rango(X, Izq, Der) 
    :-  NIzq is Izq+1, 
        NIzq =< Der, 
        rango(X, NIzq, Der).
        
% coprimos(-X, -Y)
coprimos(X, Y)
    :-  nat(Y),
        rango(X, 0, Y),
        1 is gcd(X, Y).

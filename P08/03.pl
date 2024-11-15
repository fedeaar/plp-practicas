natural(0).
natural(suc(X)) :- natural(X).

% I. se cuelga.
% ?- menorOIgual(0, Y0)      { Y0 = suc(Y1) }
%   ?- menorOIgual(0, Y1)    { Y1 = suc(Y2) }
%     ?- menorOIgual(0, Y2)  { Y2 = suc(Y3) }
%       ...

% II. puede colgarse si
%  - el objetivo no se reduce
%  - siempre se puede deducir una resolvente nueva (ie. siempre hay clausulas con un término (y su negación) unificable)

% III.
menorOIgual(X, X) :- natural(X).
menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).

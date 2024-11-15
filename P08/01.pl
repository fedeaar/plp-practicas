padre(juan, carlos).
padre(juan, luis).
padre(carlos, daniel).
padre(carlos, diego).
padre(luis, pablo).
padre(luis, manuel).
padre(luis, ramiro).
abuelo(X,Y) :- padre(X,Z), padre(Z,Y).

% I. 
% abuelo(X, manuel). 
% X = juan.

% II. hijo(?X, ?Y)
hijo(X, Y) :- padre(Y, X).

% II. hermano(?X, ?Y)
hermano(X, Y) :- padre(Z, X), padre(Z, Y), X \= Y.

% II. descendiente(?X, ?Y)
descendiente(X, Y) :- hijo(X, Y).
descendiente(X, Y) :- hijo(X, Z), descendiente(Z, Y).

% III.
% ?- descendiente(Alguien, juan).                       { Alguien = Alguien }
%   ?- hijo(Alguien, juan).                             { Alguien = Alguien }
%     ?- padre(juan, Alguien).                          { Alguien = Alguien }
%       ?- ok                                           { Alguien = carlos }                    --> Alguien = carlos
%       ?- ok                                           { Alguien = luis }                      --> Alguien = luis
%   ?- hijo(Alguien, Z), descendiente(Z, juan).         { Z = Z, Alguien = Alguien }
%     ?- padre(Z, Alguien), descendiente(Z, juan)       { Z = Z, Alguien = Alguien }
%       ?- descendiente(juan, juan)                     { Z = juan, Alguien = carlos }
%         ?- hijo(juan, juan)                           { Z = juan, Alguien = carlos }
%           ?- padre(juan, juan)                        { Z = juan, Alguien = carlos }
%             ?- false                                  { Z = juan, Alguien = carlos }
%         ?- hijo(juan, W), descendiente(W, juan)       { Z = juan, Alguien = carlos }
%           ?- padre(W, juan), descendiente(W, juan)    { Z = juan, W = W, Alguien = carlos }
%             ?- false                                  { Z = juan, W = W, Alguien = carlos }
%       ?- descendiente(juan, juan)                     { Z = juan, Alguien = luis }
%         ?- false                                      { Z = juan, Alguien = luis }
%       ?- descendiente(carlos, juan)                   { Z = carlos, Alguien = daniel }
%         ?- hijo(carlos, juan)                         { Z = carlos, Alguien = daniel }
%           ?- padre(juan, carlos)                      { Z = carlos, Alguien = daniel }
%             ?- ok                                     { Z = carlos, Alguien = daniel }        --> Alguien = daniel
%       ?- descendiente(carlos, juan)                   { Z = carlos, Alguien = diego }
%         ?- hijo(carlos, juan)                         { Z = carlos, Alguien = diego }
%           ?- padre(juan, carlos)                      { Z = carlos, Alguien = diego }
%             ?- ok                                     { Z = carlos, Alguien = diego }         --> Alguien = diego
%       ?- descendiente(luis, juan)                     { Z = luis, Alguien = pablo }
%         ?- hijo(luis, juan)                           { Z = luis, Alguien = pablo }
%           ?- padre(juan, luis)                        { Z = luis, Alguien = pablo }
%             ?- ok                                     { Z = luis, Alguien = pablo }           --> Alguien = pablo
%       ?- descendiente(luis, juan)                     { Z = luis, Alguien = manuel }
%         ?- hijo(luis, juan)                           { Z = luis, Alguien = manuel }
%           ?- padre(juan, luis)                        { Z = luis, Alguien = manuel }
%             ?- ok                                     { Z = luis, Alguien = manuel }          --> Alguien = manuel
%       ?- descendiente(luis, juan)                     { Z = luis, Alguien = ramiro }
%         ?- hijo(luis, juan)                           { Z = luis, Alguien = ramiro }
%           ?- padre(juan, luis)                        { Z = luis, Alguien = ramiro }
%             ?- ok                                     { Z = luis, Alguien = ramiro }          --> Alguien = ramiro

% IV.
% padre(juan, X), padre(X, Z).

% V.
% hermano(X, pablo).

% VI.
% ancestro(X, X).
% ancestro(X, Y) :- ancestro(Z, Y), padre(X, Z).

% VII.
% retorna juan, por unificación.
% si se piden más, retorna el resto y luego se cuelga.

% VIII.
ancestro(X, X).
ancestro(X, Y) :- padre(X, Z), ancestro(Z, Y).

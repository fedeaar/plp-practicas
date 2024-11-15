% vecino(?X, ?Y, +L).
vecino(X, Y, [X | [Y | _]]).
vecino(X, Y, [_ | Ls]) :- vecino(X, Y, Ls).

% I.
% ?- vecino(5, Y, [5, 6, 5, 3]).
%   ?- ok                           { Y = 6 }   def. 1
%   ?- vecino(5, Y, [6, 5, 3]).                 def. 2
%     ?- false                                  def. 1
%     ?- vecino(5, Y, [5, 3]).                  def. 2
%       ?- ok                       { Y = 3 }   def. 1
%       ?- vecino(5, Y, [3]).                   def. 2  
%           ?- false.                           def. 1
%           ?- vecino(5, Y, []).                def. 2
%               ?- false                        def. 1
%               ?- false                        def. 2

% II. vecino_inv(?X, ?Y, +L).
vecino_inv(X, Y, [_ | Ls]) :- vecino(X, Y, Ls).
vecino_inv(X, Y, [X | [Y | _]]).

% II. los resultados suceden en orden inverso.

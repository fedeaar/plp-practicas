paresDeNat :: [(Int,Int)]
paresDeNat = [(x , y) | s <- [0 ..], x <- [0 .. s], y <- [0 .. s], (x + y) == s]
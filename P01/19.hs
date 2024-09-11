{-
hay más de un generador infinito, por lo que se cuelga
-}
pitagóricas :: [(Integer, Integer, Integer)]
pitagóricas = [(a, b, c) | c <- [1..], a <-[1..c], b <- [1..c], a^2 + b^2 == c^2]

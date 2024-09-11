listasHasta :: Int -> Int -> [[Int]]
listasHasta n l = foldr f [[]] [0 .. l - 1]
    where f x r  = r ++ [ y : z | y <- [1 .. n], 
                                  z <- r, 
                                  length z + x == l - 1 ]

listasQueSuman :: Int -> [[Int]] 
listasQueSuman n = [ x | x <- listasHasta n n, sum x == n ]

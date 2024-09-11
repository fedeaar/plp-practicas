-- I.
genLista :: a -> (a -> a) -> Integer -> [a]
genLista i f n = foldl g [i] [1 .. n]
    where g x y = x ++ [f (last x)]
{-
otra forma:

genLista i f 0 = []
genLista i f n = i : genLista (f i) f (n-1)
-}

-- II.
desdeHasta :: Integer -> Integer -> [Integer]
desdeHasta a b
    | a >= b    = error "Invalid arguments."
    | otherwise = genLista a (+ 1) (b - a + 1)
 
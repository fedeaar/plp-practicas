recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z [] = z
recr f z (x : xs) = f x xs (recr f z xs)

-- a.
sacarUna :: Eq a => a -> [a] -> [a]
sacarUna x = recr f []
    where
        f y ys r
            | x == y    = ys
            | otherwise = y : r
 
-- b.
{-
No es adecuado ya que no podemos 'frenar' prematuramente la evaluación.
foldr, foldl aplican f a todos los elementos. Se podrían usar, igual, si
se mantiene un 'contexto' conjunto al acumulado.
-}

-- c.
insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado x = recr f [x]
    where
        f y ys r
            | x < y     = x : y : ys
            | otherwise = y : r

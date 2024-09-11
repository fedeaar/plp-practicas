-- elementosEnPosicionesPares
{-
La recursión es estructural si se complementa la estructura.
Si no, no, ya que no tenemos forma de saber, a partir del elemento
actual y el acumulado en qué posición está el elemento.
-}
enum :: [a] -> [(Int, a)]
enum = zip [0 ..]

elementosEnPosicionesPares :: [a] -> [a]
elementosEnPosicionesPares xs = foldr f [] (enum xs)
    where 
        f (i, x) y
            | even i    = x : y
            | otherwise = y

-- entrelazar
entrelazar :: [a] -> [a] -> [a]
entrelazar = foldr f (const [])
    where
        f x r [] = x : r []
        f x r (y: ys) = x : y : r ys

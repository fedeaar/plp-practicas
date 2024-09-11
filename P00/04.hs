-- a.
(?:) :: (a -> [a] -> Bool) -> a -> [a] -> [a]
(?:) f x y
    | f x y     = x : y
    | otherwise = y

limpiar :: String -> String -> String
limpiar a b = foldr (f ?:) "" a
    where f x _ = x `elem` b

-- b.
promedio :: [Float] -> Float
promedio x = sum x / fromIntegral (length x)

difPromedio :: [Float] -> [Float]
difPromedio x = map (\z -> z - promedio x) x

-- c.
recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr f z [] = z
recr f z (x : xs) = f x xs (recr f z xs)

todosIguales :: [Int] -> Bool
todosIguales = recr (\x xs y -> (null xs || x == head xs) && y) True

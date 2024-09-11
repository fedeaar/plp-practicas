recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr f z [] = z
recr f z (x : xs) = f x xs (recr f z xs)

-- I.
join :: a -> [[a]] -> [[a]]
join x = foldr (\ y -> (:) (x : y)) []

carrousel :: [a] -> [[a]]
carrousel xs = f xs (length xs)
    where
        f _ 0 = []
        f xs n = xs : f (tail xs ++ [head xs]) (n-1)

permutaciones :: [a] -> [[a]]
permutaciones xs = foldr f [] (carrousel xs)
    where
        f [z] y    = [z] : y  
        f (z:zs) y = join z (permutaciones zs) ++ y

-- II. 
partes :: [a] -> [[a]]
partes = recr f [[]]
    where f x _ r = r ++ join x r

-- III.
prefijos :: [a] -> [[a]]
prefijos = foldr f [[]]
    where f x y = [] : join x y
    
-- IV.
sublistas :: [a] -> [[a]]
sublistas = recr f [[]]
    where f x xs r = tail (prefijos (x:xs)) ++ r

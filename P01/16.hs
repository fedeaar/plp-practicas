data HashSet a = Hash (a -> Integer) (Integer -> [a])

-- I.
vacío :: (a -> Integer) -> HashSet a
vacío f = Hash f (const [])

-- II.
pertenece :: Eq a => a -> HashSet a -> Bool
pertenece a (Hash f t) = a `elem` t (f a)

-- III.
agregar :: Eq a => a -> HashSet a -> HashSet a
agregar a (Hash f t)
    | pertenece a (Hash f t) = Hash f t
    | otherwise              = Hash f t'
    where t' n
            | n == f a  = a : t n 
            | otherwise = t n

-- IV.
cap :: Eq a => [a] -> [a] -> [a]
cap = foldr f (const []) 
    where f x r ys
            | x `elem` ys = x : r ys
            | otherwise   = r ys

intersección :: Eq a => HashSet a -> HashSet a -> HashSet a
intersección (Hash f t1) (Hash _ t2) = Hash f t'
    where t' n = t1 n `cap` t2 n

-- V.
recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z [] = z
recr f z (x : xs) = f x xs (recr f z xs)

foldr1 :: (a -> a -> a) -> [a] -> a
foldr1 f [] = error "Invalid argument."
foldr1 f  x = foldr f (last x) (init x)

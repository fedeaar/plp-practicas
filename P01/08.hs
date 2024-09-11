-- I.
mapPares :: (a -> b -> c) -> [(a, b)] -> [c]
mapPares f = foldr g []
    where g x y = uncurry f x : y

-- II.
armarPares :: [a] -> [b] -> [(a, b)]
armarPares = foldr f (const [])
    where 
        f x r []     = []
        f x r (y:ys) = (x, y) : r ys

-- III.
mapDoble :: (a -> b -> c) -> [a] -> [b] -> [c]
-- mapDoble f xs ys = mapPares f (armarPares xs ys)
mapDoble f = foldr g (const [])
    where 
        g x r []     = []
        g x r (y:ys) = f x y : r ys


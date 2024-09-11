-- I.

max2 :: Ord a => (a, a) -> a
max2 (x, y) 
    | x >= y    = x
    | otherwise = y

normaVectorial :: Floating a => (a, a) -> a
normaVectorial (x, y) = sqrt (x^2 + y^2)

substract :: Num a => a -> a -> a
substract = flip (-)

predecesor :: Num a => a -> a
predecesor = subtract 1

evaluarEnCero :: Num a => (a -> b) -> b
evaluarEnCero = \f -> f 0

dosVeces :: (a -> a) -> a -> a
dosVeces = \f -> f . f

flipAll :: [a -> b -> c] -> [b -> a -> c]
flipAll = map flip

flipRaro :: b -> (a -> b -> c) -> a -> c
flipRaro = flip flip

-- II.

max2curr :: Ord a => a -> a -> a
max2curr x y
    | x >= y    = x
    | otherwise = y

normaVectorialCurr :: Floating a => a -> a -> a
normaVectorialCurr x y = sqrt (x^2 + y^2)

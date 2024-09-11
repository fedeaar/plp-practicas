-- a.
valorAbsoluto :: Float -> Float
valorAbsoluto x
    | x >= 0 = x
    | x < 0  = -x

-- b.
divisible :: Int -> Int -> Bool
divisible x y = mod x y == 0

bisiesto :: Int -> Bool
bisiesto x = (divisible x 4 && not (divisible x 100)) || divisible x 400

-- c.
factorial :: Int -> Int
factorial n = product [1 .. n]

-- d.
beta :: Bool -> Int
beta False = 0
beta True  = 1

(?:) :: (a -> [a] -> Bool) -> a -> [a] -> [a]
(?:) f x y
    | f x y     = x : y
    | otherwise = y

primos :: Int -> [Int]
primos n = foldl (flip (f ?:)) [] [2 .. n]
    where f x = foldr (\z w -> not (divisible x z) && w) True

cantDivisoresPrimos :: Int -> Int
cantDivisoresPrimos n = foldr f 0 (primos n)
    where f x y = beta (divisible n x) + y

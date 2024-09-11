-- I.
_sum :: Num a => [a] -> a
_sum = foldr (+) 0

_elem :: Eq a => a -> [a] -> Bool
_elem a = foldr (\x y -> x == a || y) False

(+++) :: [a] -> [a] -> [a]
(+++) xs ys = foldr (:) ys xs

(?:) :: (a -> Bool) -> a -> [a] -> [a]
(?:) f x y
    | f x       = x : y
    | otherwise = y

filter :: (a -> Bool) -> [a] -> [a]
filter f = foldr (f ?:) []

map :: (a -> b) -> [a] -> [b]
map f = foldr (\x y -> f x : y) []

-- II.
mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun f = foldr1 (\x y -> if f x y then x else y)

-- III.
sumasParciales :: Num a => [a] -> [a]
sumasParciales = foldl (\x y -> x ++ [y + if null x then 0 else last x]) []

-- IV.
enum :: [a] -> [(Int, a)]
enum = zip [0 ..]

sumaAlt :: Num a => [a] -> a
sumaAlt xs = foldr f 0 (enum xs)
    where
        f (i, x) y 
            | i == 0    = x + y
            | odd i     = x + y
            | otherwise = y - x

-- V.
sumaAltInv :: Num a => [a] -> a
sumaAltInv xs = foldr f 0 (enum xs)
    where
        f (i, x) y 
            | mod i 2 /= mod (length xs) 2 = x + y
            | otherwise                    = y - x

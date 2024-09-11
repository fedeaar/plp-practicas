-- I.
foldNat :: (Integer -> a -> a) -> a -> Integer -> a
foldNat f z 1 = z
foldNat f z n = f n (foldNat f z (n-1))

-- II.
potencia :: Floating a => a -> Integer -> a
potencia x = foldNat f x 
    where f n r = x * r 

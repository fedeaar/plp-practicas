-- I.
sumaMat :: [[Int]] -> [[Int]] -> [[Int]]
sumaMat = zipWith (zipWith (+))

-- II.
elemSplit :: [Int] -> [[Int]]
elemSplit = foldr f []
    where f x y = [x] : y

transponer :: [[Int]] -> [[Int]]
transponer = foldr f []
    where f x [] = elemSplit x
          f x r  = zipWith (:) x r 

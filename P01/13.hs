join :: a -> [[a]] -> [[a]]
join x = foldr (\ y -> (:) (x : y)) []

data AB a = Nil
    | Bin (AB a) a (AB a)

foldAB :: b -> (b -> a -> b -> b) -> AB a -> b
foldAB cNil cBin Nil         = cNil
foldAB cNil cBin (Bin i x d) =
    cBin (foldAB cNil cBin i) x (foldAB cNil cBin d)

recAB :: b -> (AB a -> b -> a -> AB a -> b -> b) -> AB a -> b
recAB cNil cBin Nil         = cNil
recAB cNil cBin (Bin i x d) =
    cBin i (recAB cNil cBin i) x d (recAB cNil cBin d)

-- I.
ramas :: AB a -> [[a]]
ramas = foldAB cNil cBin
    where
        cNil = []
        cBin i x d 
            | null i && null d = [[x]]
            | null i           = join x d
            | null d           = join x i
            | otherwise        = join x i ++ join x d 

mismaEstructura :: AB a -> AB b -> Bool
mismaEstructura = foldAB cNil cBin
    where 
        cNil Nil = True
        cNil _   = False
        cBin ri x rd Nil           = False
        cBin ri _ rd (Bin i2 _ d2) = ri i2 && rd d2

data AB a = Nil
    | Bin (AB a) a (AB a)

-- I.
foldAB :: b -> (b -> a -> b -> b) -> AB a -> b
foldAB cNil cBin Nil         = cNil
foldAB cNil cBin (Bin i x d) =
    cBin (foldAB cNil cBin i) x (foldAB cNil cBin d)

recAB :: b -> (AB a -> b -> a -> AB a -> b -> b) -> AB a -> b
recAB cNil cBin Nil         = cNil
recAB cNil cBin (Bin i x d) =
    cBin i (recAB cNil cBin i) x d (recAB cNil cBin d)

-- II.
esNil :: AB a -> Bool
esNil = foldAB True (\i x d -> False)

altura :: AB a -> Integer
altura = foldAB 1 (\i x d -> 1 + max i d)

cantNodos :: AB a -> Integer
cantNodos = foldAB 0 (\i x d -> 1 + i + d)

-- III.
mejorSegun :: (a -> a -> Bool) -> AB a -> Maybe a
mejorSegun f = foldAB cNil cBin
    where
        cNil = Nothing
        cBin Nothing x Nothing  = Just x
        cBin Nothing x (Just d)
            | f x d     = Just x
            | otherwise = Just d
        cBin (Just i) x Nothing
            | f i x     = Just i
            | otherwise = Just x
        cBin (Just i) x (Just d)
            | f i x && f i d = Just i
            | f x d          = Just x
            | otherwise      = Just d

-- IV.
maxAB :: Ord a => AB a -> Maybe a
maxAB = mejorSegun (>)

esABB :: Ord a => AB a -> Bool
esABB = recAB cNil cBin
    where
        cNil = True
        cBin i ri x d rd = ri && rd && f p1 && g p2
            where 
                p1 = maxAB i
                p2 = maxAB d 
                f Nothing  = True
                f (Just a) = a <= x
                g Nothing  = True
                g (Just a) = x < a

-- V.
{-
foldAB en los casos donde se puede acumular directo. 
recAB en los casos donde hay más de un acumulado necesario.
Notar que seguro se puede hacer con foldAB y tuplas.
-}

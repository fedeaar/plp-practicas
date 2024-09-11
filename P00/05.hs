data AB a = Nil | Bin (AB a) a (AB a) deriving Foldable

-- a.
vacioAB :: AB a -> Bool
vacioAB = null

-- b.
negacionAB :: AB Bool -> AB Bool
negacionAB Nil = Nil
negacionAB (Bin l x r) = Bin (negacionAB l) (not x) (negacionAB r)

-- c.
productoAB :: AB Int -> Int
productoAB = product

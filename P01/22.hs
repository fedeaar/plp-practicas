data AIH a = Hoja a | Bin (AIH a) (AIH a) deriving Show

foldAIH :: (a -> b) -> (b -> b -> b) -> AIH a -> b
foldAIH cHoja cBin (Hoja a)  = cHoja a
foldAIH cHoja cBin (Bin a b) = cBin (foldAIH cHoja cBin a) (foldAIH cHoja cBin b)

altura :: AIH a -> Integer
altura = foldAIH (const 1) (\i d -> 1 + max i d)

tamaño :: AIH a -> Integer
tamaño = foldAIH (const 1) (+)

-- a.
extender :: AIH () -> AIH ()
extender (Hoja _)  = Bin (Hoja ()) (Hoja ())
extender (Bin a b)
    | altura a > altura b = Bin a (extender b)
    | otherwise           = Bin (extender a) b

nEsimoAIH :: Int -> AIH ()
nEsimoAIH n = foldr (const extender) (Hoja ()) [1 .. n]

aihInfinito :: [AIH ()]
aihInfinito = [ nEsimoAIH n | n <- [0 ..]]

-- b.
{-
la recursión no se realiza para ambos subarboles, sino 
dependiendo de la altura.
-}

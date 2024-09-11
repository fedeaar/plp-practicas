data AIH a = Hoja a | Bin (AIH a) (AIH a)

-- a.
foldAIH :: (a -> b) -> (b -> b -> b) -> AIH a -> b
foldAIH cHoja cBin (Hoja a)  = cHoja a
foldAIH cHoja cBin (Bin a b) = cBin (foldAIH cHoja cBin a) (foldAIH cHoja cBin b)

recAIH :: (a -> b) -> (b -> AIH a -> b -> AIH a -> b) -> AIH a -> b
recAIH cHoja cBin (Hoja a)  = cHoja a
recAIH cHoja cBin (Bin a b) = cBin (recAIH cHoja cBin a) a (recAIH cHoja cBin b) b

-- b.
altura :: AIH a -> Integer
altura = foldAIH (const 1) (\i d -> 1 + max i d)

tamaño :: AIH a -> Integer
tamaño = foldAIH (const 1) (+)

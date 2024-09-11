-- I.
curry :: ((a, b) -> c) -> a -> b -> c
curry f a b = f (a, b)

-- II.
uncurry :: (a -> b -> c) -> (a, b) -> c
uncurry f (a, b) = f a b

-- III.
{-
Entiendo que esto no se puede hacer, dado que no hay forma 'sensible'
de convertir una cantidad arbitraria de parámetros en una tupla.
Sin embargo, tal vez hay formas de hacer magia negra para lograr
algo que funcione.
-}

-- a.
inverso :: Float -> Maybe Float
inverso x
    | x /= 0    = Just (1 / x)
    | otherwise = Nothing

-- b.
aEntero :: Either Int Bool -> Int
aEntero (Left a)      = a
aEntero (Right False) = 0
aEntero (Right True)  = 1

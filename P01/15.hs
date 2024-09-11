-- I.
data RoseTree a = Leaf a 
    | Rose [RoseTree a]

-- II.
foldRT :: (a -> b) -> ([b] -> b) -> RoseTree a -> b
foldRT cLeaf cRose (Leaf a)     = cLeaf a
foldRT cLeaf cRose (Rose x) = cRose (map (foldRT cLeaf cRose) x)

-- III.
hojas :: RoseTree a -> [RoseTree a]
hojas = foldRT cLeaf cRose
    where
        cLeaf a = [Leaf a]
        cRose = concat

distancias :: RoseTree a -> [Int]
distancias = foldRT cLeaf cRose
    where
        cLeaf a = [0]
        cRose x = map (+1) (concat x)

altura :: RoseTree a -> Int
altura = foldRT (const 1) ((+1) . foldr max 0)

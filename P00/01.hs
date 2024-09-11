import qualified GHC.Stack as GHC.Stack.Types

{-
:type null
> null :: Foldable t => t a -> Bool

posible impl.:
-}
_null :: Foldable t => t a -> Bool
_null = foldr (\a b -> False) True

{-
:type head
> GHC.Stack.types.HasCallStack => [a] -> a

posible impl.:
-}
_head :: GHC.Stack.Types.HasCallStack => [a] -> a
_head (x:xs) = x

{-
:type tail
> GHC.Stack.types.HasCallStack => [a] -> a

posible impl.:
-}
_tail :: GHC.Stack.Types.HasCallStack => [a] -> [a]
_tail (x:xs) = xs

{-
:type init
> GHC.Stack.types.HasCallStack => [a] -> [a]

posible impl.:
-}
_init :: GHC.Stack.Types.HasCallStack => [a] -> [a]
_init [x] = []
_init (x:xs) = x : _init xs

{-
:type last
> GHC.Stack.types.HasCallStack => [a] -> a

posible impl.:
-}
_last :: GHC.Stack.Types.HasCallStack => [a] -> a
_last []  = error "Invalid argument."
_last [x] = x
_last (x:xs) = _last xs

{-
:take
> Int -> [a] -> [a]

posible impl.:
-}
_take :: Int -> [a] -> [a]
_take 0 _ = []
_take n (x:xs)
    | n > 0 = x : _take (n-1) xs
    | n < 0 = error "Invalid argument."

{-
:drop
> Int -> [a] -> [a]

posible impl.:
-}
_drop :: Int -> [a] -> [a]
_drop 0 x = x
_drop n (x:xs)
    | n > 0 = _drop (n-1) xs
    | n < 0 = error "Invalid argument."

{-
:type (++)
> [a] -> [a] -> [a]

posible impl.:
-}
_join :: [a] -> [a] -> [a]
_join xs ys = foldr (:) ys xs

{-
:type concat
> Foldable t => t [a] -> [a]

posible impl.:
-}
_concat :: Foldable t => t [a] -> [a]
_concat = foldr _join []

{-
:type reverse
> [a] -> [a]

posible impl.:
-}
_reverse :: [a] -> [a]
_reverse = foldr (\x y -> _join y [x]) []

{-
:type elem
> (Foldable t, Eq a) => a -> t a -> Bool

posible impl.:
-}
_elem :: (Foldable t, Eq a) => a -> t a -> Bool
_elem a = foldr (\x y -> x == a || y) False 

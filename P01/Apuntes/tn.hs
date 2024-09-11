-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- foldr f z [] = z
-- foldr f z (x : xs) = f x (foldr f z xs)

-- recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
-- recr f z [] = z
-- recr f z (x : xs) = f x xs (recr f z xs)

-- foldl :: (b -> a -> b) -> b -> [a] -> b
-- foldl f ac [] = ac
-- foldl f ac (x : xs) = foldl f (f ac x) xs


elem2 :: Eq a => a -> [a] -> Bool
elem2 e []     = False
elem2 e (x:xs) = e == x || elem2 e xs


elem3 :: Eq a => a -> [a] -> Bool
elem3 e = foldr (\x rec -> e == x || rec) False

sumaAlt :: Num a => [a] -> a
sumaAlt = foldr (-) 0

{-
[1,2,3,4] --> 1 - 2 + 3 - 4

sumaAlternada [2,3,4] --> 2 - 3 + 4

1 - sumaAlternada [2,3,4] --> 1 - (2 - 3 + 4)
-}


{-
f [] =
f (x:xs) = x f xs

-}


take2 :: Int -> [a]-> [a]
take2 _ []     = []
take2 n (x:xs) = if n == 0 then [] else x : take2 (n-1) xs

take3 :: [a] -> Int -> [a]
take3 []     _ = []
take3 (x:xs) n = if n == 0 then [] else x : take3 xs (n-1)

take4 :: [a] -> Int -> [a]
take4 []     = const [] -- \_ -> []
take4 (x:xs) = \n -> if n == 0 then [] else x : take4 xs (n-1)

take5 :: [a] -> Int -> [a]
take5 = foldr (\x rec -> \n -> if n == 0 then [] else x : rec (n-1)) 
              (const [])

take6 :: Int -> [a] -> [a]
take6 = flip take5


-- foldr f z [] = z
-- foldr f z (x : xs) = f x (foldr f z xs)

                  
-- foldr :: (a -> (Int -> [a]) -> (Int -> [a])) 
     -- -> (Int -> [a]) 
     -- -> [a] 
     -- -> (Int -> [a])




{-
f [] = z
f (x:xs) = g x (f xs)

x
xs
f

x, (f xs)
x, xs, f xs
-}


sacarUna:: Eq a => a -> [a] -> [a]
sacarUna e = recr (\x xs rec -> if x == e then xs else x : rec) []

recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr f z [] = z
recr f z (x : xs) = f x xs (recr f z xs)



pares :: [(Int, Int)]
pares = [ (x,s-x) | s <- [0..], x <- [0..s]]
--pares = [ (x,y) | s <- [0..], x <- [0..s], y <- [0..s], x+y == s]



data AEB a = Hoja a | Bin (AEB a) a (AEB a)

miArbol = Bin (Hoja 3) 5 (Bin (Hoja 7) 8 (Hoja 1))

foldAEB :: (a -> b -> b -> b) -> (a -> b) -> AEB a -> b
foldAEB cBin cHoja t = case t of 
                            Hoja h -> cHoja h
                            Bin i r d -> cBin r (rec i) (rec d)
    where rec = foldAEB cBin cHoja

altura :: AEB a -> Int
altura = foldAEB (\r ri rd -> 1 + max ri rd) (const 0)


-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- foldr f z [] = z
-- foldr f z (x : xs) = f x (foldr f z xs)

data Polinomio a = X
                  |Cte a
                  |Suma (Polinomio a) (Polinomio a)
                  |Prod (Polinomio a) (Polinomio a)


foldPoli :: b -> (a -> b) -> (b -> b -> b) -> (b -> b -> b) -> Polinomio a -> b
foldPoli cX cCte cSuma cProd pol = case pol of 
    X -> cX  
    Cte c -> cCte c 
    Suma p q -> cSuma (rec p) (rec q)
    Prod p q -> cProd (rec p) (rec q)
    where rec = foldPoli cX cCte cSuma cProd


evaluar2 :: Num a => a -> Polinomio a -> a
evaluar2 x = foldPoli x id (+) (*)

evaluar :: Num a => a -> Polinomio a -> a
evaluar x pol = case pol of
                    X -> x
                    Cte c -> c
                    Suma p q -> rec p + rec q
                    Prod p q -> rec p * rec q
    where rec = evaluar x

p1 = Prod (Cte 3) X

p2 = Suma (Suma (Prod X X) X) (Cte 1)




data RoseTree a = Rose a [RoseTree a]

miRT = Rose 1 [Rose 2 [], Rose 3 [Rose 4 [], Rose 5 [], Rose 6 []]]


foldRose :: (a -> [b] -> b) -> RoseTree a -> b
foldRose cRose (Rose n hijos) = cRose n (map rec hijos)
    where rec = foldRose cRose

tamaño :: RoseTree a -> Int
tamaño = foldRose (\n recs -> 1 + sum recs)


cantHojas :: RoseTree a -> Int
cantHojas = foldRose (\n recs -> if null recs then 1 else sum recs)


alturaRT :: RoseTree a -> Int
alturaRT = foldRose (\_ recs -> 1 + maximum (0:recs))


type Conj a = (a -> Bool)

vacio :: Conj a
vacio =  const False

universo :: Conj a
universo = const True


udt = \e -> e == 1 || e == 2 || e == 3

mayores5 :: Conj Int
mayores5 = \e -> e > 5


agregar :: Eq a => a -> Conj a -> Conj a
agregar e c = \e1 -> e == e1 || c e1


mayores5y3 = agregar 3 mayores5


union :: Conj a -> Conj a -> Conj a
union c1 c2 = \e -> c1 e || c2 e

interseccion :: Conj a -> Conj a -> Conj a
interseccion c1 c2 = \e -> c1 e && c2 e

complemento :: Conj a -> Conj a
complemento c1 = not.c1

diferencia :: Conj a -> Conj a -> Conj a
diferencia c1 c2 = \e -> c1 e && not (c2 e)



numPares = even











curry :: ((a,b) -> c) -> a -> b -> c
--curry f x y = f (x,y)
curry f = \x y -> f (x,y)

uncurry :: (a -> b -> c) -> (a,b) -> c
uncurry f = \(x,y) -> f x y

(.) :: (a -> b) -> (c -> a) -> c -> b
(.) f g = \x -> f (g x)


flip :: (a -> b -> c) -> b -> a -> c
flip f = \x y -> f y x


($) :: (a -> b) -> a -> b
($) f = f


const :: a -> b -> a
const x = \_ -> x



nUnos 2
-> take 2 infinitosUnos
-> take 2 (1:infinitosUnos)
-> 1 : take (2-1) infinitosUnos
-> 1 : take 1 infinitosUnos
-> 1 : take 1 (1:infinitosUnos)
-> 1 : 1 : take (1-1) infinitosUnos
-> 1 : 1 : take 0 infinitosUnos
-> 1 : 1 : []





maximo :: Ord a => [a] -> a
maximo [x] = x
maximo (x:xs) = if x > rec then x else rec
    where rec = maximo xs

minimo [x] = x
minimo (x:xs) = if x < rec then x else rec
    where rec = minimo xs

listaMasCorta :: [[a]] -> [a]
listaMasCorta [x] = x
listaMasCorta (x:xs) = if length x < length rec then x else rec
	where rec = listaMasCorta xs


mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun _ [x] = x
mejorSegun p (x:xs) = if p x rec then x else rec
	where rec = mejorSegun p xs


maximo = mejorSegun (>)
minimo = mejorSegun (<)
listaMasCorta = mejorSegun (\x rec -> length x < length rec)



filter p = foldr (\x rec -> if p x then x:rec else rec) [] 

map f = foldr (\x rec -> f x : rec) []


listaComp f xs p = map f $ filter p xs


foldr1 :: (a -> a -> a) -> [a] -> a
foldr1 _ [x] = x
foldr1 f (x:xs) = f x (foldr1 f xs)

mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun _ [x] = x
mejorSegun p (x:xs) = if p x rec then x else rec
	where rec = mejorSegun p xs

mejorSegun p = foldr1 (\x rec -> if p x rec then x else rec)

--foldr :: (a -> b -> b) -> b -> [a] -> b
--foldr _ z [] = z
--foldr f z (x:xs) = f x (foldr f z xs)

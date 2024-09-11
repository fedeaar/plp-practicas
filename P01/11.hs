data Polinomio a = X
    | Cte a
    | Suma (Polinomio a) (Polinomio a)
    | Prod (Polinomio a) (Polinomio a)

foldPoly :: a 
    -> (b -> a) 
    -> (a -> a -> a) 
    -> (a -> a -> a) 
    -> Polinomio b 
    -> a
foldPoly cX cCte cSuma cProd X          = cX
foldPoly cX cCte cSuma cProd (Cte a)    = cCte a
foldPoly cX cCte cSuma cProd (Suma a b) = 
    cSuma (foldPoly cX cCte cSuma cProd a) 
          (foldPoly cX cCte cSuma cProd b)
foldPoly cX cCte cSuma cProd (Prod a b) = 
    cProd (foldPoly cX cCte cSuma cProd a)  
          (foldPoly cX cCte cSuma cProd b)

evaluar :: Num a => a -> Polinomio a -> a
evaluar x = foldPoly x id (+) (*)

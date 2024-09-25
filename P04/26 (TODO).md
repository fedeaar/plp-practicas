## 26. Definir las siguientes funciones en Cálculo Lamb da con Listas (visto en el ejercicio 22). Pueden definirse como macros o como extensiones al cálculo. Nota: en este ejercicio usamos la notación M : σ para decir que la expresión M a definir debe tener tipo σ en cualquier contexto.

### a) headσ : [σ] -> σ y tailσ : [σ] -> [σ] (asumir que ⊥σ def= μx : σ.x).

### b) iterateσ:(σ -> σ) -> σ -> [σ] que dadas f y x genera la lista infinita x :: f x :: f(f x) :: f(f(f x)) :: ...

### c) zipρσ : [ρ] -> [σ] -> [ρ ×σ] que se comporta como la función homónima de Haskell.

### d) takeσ : Nat -> ([σ] -> [σ]) que se comporta como la función homónima de Haskell.

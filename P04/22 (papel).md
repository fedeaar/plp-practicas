## 22. Este ejercicio extiende el Cálculo Lambda tipado con listas. Comenzamos ampliando el conjunto de tipos:

    τ ::= ... | [τ]

### donde [τ] representa el tipo de las listas cuyas componentes son de tipo τ. El conjunto de términos ahora incluye:

    M, N, O ::= ... | []_τ | M :: N | case M of {[] -> N / h :: t -> O} | foldr M base -> N ; rec(h,r) -> O

### donde 

- []_σ es la lista vacía cuyos elementos son de tipo σ; 
- M :: N agrega M a la lista N; 
- case M of {[] -> N / h :: t -> O} es el observador de listas. Por su parte, los nombres de variables que se indiquen luego del / (h y t en este caso) son variables que pueden aparecer libres en O y deberán ligarse con la cabeza y cola de la lista respectivamente; 
- foldr M base -> N ; rec(h,r) -> O es el operador de recursión estructural (no currificado). Los nombres de variables indicados entre paréntesis (h y r en este caso) son variables que pueden aparecer libres en O y deberán ser ligadas con la cabeza y el resultado de la recursión respectivamente. 

### Por ejemplo,

    case zero :: succ(zero) :: []_Nat of {[] -> false | x :: xs -> isZero(x) } ->> true
    
    foldr 1 :: 2 :: 3 :: (λx: [Nat]. x) []_Nat base -> zero ; rec(head,rec) -> head + rec ->> 6

### a) Mostrar el árbol sintáctico para los dos ejemplos dados.

### b) Agregar reglas de tipado para las nuevas expresiones.

### c) Demostrar el siguiente juicio de tipado (recomendación: marcar variables libres y ligadas en el término antes de comenzar).

    x : Bool, y : [Bool] |- foldr x :: x :: y base -> y ; rec(y,x) -> if y then x else []_Bool: [Bool]

### d) Mostrar cómo se extiende el conjunto de valores. Estos deben reflejar la forma de las listas que un programa podría devolver.

### e) Agregar los axiomas y reglas de reducción asociados a las nuevas expresiones.

## 16. (Programa, Forma Normal) Para el siguiente ejercicio, considerar el cálculo sin la regla pred(zero) -> zero. Un programa es un término que tipa en el contexto vacío (es decir, no puede contener variables libres). Para cada una de las siguientes expresiones,

### i) Determinar si puede ser considerada un programa.

### ii) Si es un programa, ¿Cuál es el resultado de su evaluación? Determinar si se trata de una forma normal, y en caso de serlo, si es un valor o un error.

### a) (λx: Bool. x) true

### b) λx: Nat. pred(succ(x))

### c) λx: Nat. pred(succ(y))

### d) (λx: Bool. pred(isZero(x))) true

### e) (λf : Nat -> Bool. f zero) (λx: Nat. isZero(x))

### f) (λf : Nat -> Bool. x) (λx: Nat. isZero(x))

### g) (λf : Nat ->  Bool. f pred(zero)) (λx : Nat. isZero(x))

### h) μy: Nat. succ(y)

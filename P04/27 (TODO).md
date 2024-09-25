## 27. Se desea extender el Cálculo Lamb da tipado con colas bidireccionales (también cono cidas como deque). Se extenderán los tipos y términos de la siguiente manera:

    σ ::= ···|Colaσ M ::= ···| ⟨⟩σ | M • M | próximo(M) | desencolar(M) | case M of ⟨⟩ ; M ; c • x ; M

### donde ⟨⟩σ es la cola vacía en la que se pueden encolar elementos de tipo σ; M1 •M2 representa el agregado del elemento M2 al final de la cola M1; los observadores próximo(M1) y desencolar(M1) devuelven, respectivamente, el primer elemento de la cola (el primero que se encoló), y la cola sin el primer elemento (estos dos últimos solo tienen sentido si la cola no es vacía); y el observador case M1 of ⟨⟩ ; M2 ; c • x ; M3 permite operar con la cola en sentido contrario, accediendo al último elemento encolado (cuyo valor se ligará a la variable x en M3) y al resto de la cola (que se ligará a la variable c en el mismo subtérmino).

### a) Intro ducir las reglas de tipado para la extensión propuesta.

### b) Definir el conjunto de valores y las nuevas reglas de reducción. Pueden usar los conectivos booleanos de la guía. No es necesario escribir las reglas de congruencia, basta con indicar cuántas son. Pista: puede ser necesario mirar más de un nivel de un término para saber a qué reduce.

### c) Mostrar paso por paso cómo reduce la expresión: case ⟨⟩Nat • 1 • 0 of ⟨⟩ ; próximo(⟨⟩Bool) ; c • x ; isZero(x)

### d) Definir como macro la función últimoτ, que dada una cola devuelve el último elemento que se encoló en ella. Si la cola es vacía, puede colgarse o llegar a una forma normal bien tipada que no sea un valor. Dar un juicio de tipado válido para esta función (no es necesario demostrarlo).

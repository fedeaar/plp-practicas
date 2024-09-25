## 21. (Uniones disjuntas, también conocidas como co-productos o sumas) Este ejercicio extiende el cálculo-λ tipado con uniones disjuntas. Las gramáticas de los tipos y los términos se extienden de la siguiente manera:

    τ ::= ... | τ + τ
    M ::= ... | left(M) | right(M) | case M of left(x) ; M1 [] right(y) ; M2

### donde σ + τ representa el tipo de la unión disjunta entre σ y τ, similar al tipo Either σ τ de Haskell, left(M) y right(M) inyectan un valor en la unión y case M of left(x) ; M1 [] right(y) ; M2 efectúa un análisis de casos del término M comparándolo con los patrones left(x) y right(y).

### a) Definir reglas de tipado para los nuevos constructores de términos.
### b) Usando las reglas de tipado anteriores, y dados los tipos σ, τ y ρ, exhibir habitantes de los siguientes tipos:
#### i. Inyecciones: σ -> (σ + τ) y τ -> (σ + τ).
#### ii. Análisis de casos: (σ + τ) -> (σ -> ρ) -> (τ -> ρ) -> ρ.
#### iii. Conmutatividad: (σ + τ) -> (τ + σ).
#### iv. Aso ciatividad: ((σ + τ) + ρ) -> (σ + (τ + ρ)) y (σ + (τ + ρ)) -> ((σ + τ) + ρ).
#### v. Distributividad del producto sobre la suma: (σ × (τ + ρ)) -> ((σ × τ) + (σ × ρ)) y ((σ × τ) + (σ × ρ)) -> (σ × (τ + ρ)).
#### vi. Ley de los exponentes: ((σ + τ) -> ρ) -> ((σ -> ρ) × (τ -> ρ)) y ((σ -> ρ) × (τ -> ρ)) -> ((σ + τ) -> ρ).
### c) Definir reglas de semántica operacional manteniendo el determinismo y la preservación de tipos.
### d) Demostrar que la relación de reducción definida tiene la propiedad de preservación de tipos.
### e) ¿Cómo se extiende el conjunto de los valores? ¿Se verifica la propiedad de progreso?

## 20. (Pares, o productos) Este ejercicio extiende el cálculo-λ tipado con pares. Las gramáticas de los tipos y los términos se extienden de la siguiente manera:

    τ ::= ... | τ × τ
    M ::= ... | ⟨M, M⟩ | π1(M) | π2(M)

### donde σ × τ es el tipo de los pares cuya primera componente es de tipo σ y cuya segunda componente es de tipo τ, ⟨M, N⟩ construye un par y π1(M) y π2(M) proyectan la primera y la segunda componente de un par, respectivamente.

### a) Definir reglas de tipado para los nuevos constructores de términos.

### b) Usando las reglas de tipado anteriores, y dados los tipos σ, τ y ρ, exhibir habitantes de los siguientes tipos:

#### i. Constructor de pares: σ -> τ -> (σ × τ)

#### ii. Proyecciones: (σ × τ) -> σ y (σ × τ) -> τ

#### iii. Conmutatividad: (σ × τ) -> (τ × σ)

#### iv. Asociatividad: ((σ × τ) × ρ) -> (σ × (τ × ρ)) y (σ × (τ × ρ)) -> ((σ × τ) × ρ).

#### v. Currificación: ((σ × τ) -> ρ) -> (σ -> τ -> ρ) y (σ -> τ -> ρ) -> ((σ × τ) -> ρ).

### c) Definir reglas de semántica operacional manteniendo el determinismo y la preservación de tipos. Importante: no olvidar las reglas de congruencia.

### d) Demostrar que la relación de reducción definida es determinística.

### e) ¿Cómo se extiende el conjunto de los valores? ¿Se verifica la propiedad de preservación de tipos? ¿Se verifica la propiedad de progreso?

## 9 (Tipos habitados) Decimos que un tipo τ está habitado si existe un término M tal que el juicio |- M : τ es derivable. En ese caso, decimos que M es un habitante de τ. Por ejemplo, dado un tipo σ, la identidad λx : σ.x es un habitante del tipo σ -> σ. Demostrar que los siguientes tipos están habitados (para cualquier σ, τ y ρ):

### a) σ -> τ -> σ

### b) (σ -> τ -> ρ) -> (σ -> τ) -> σ -> ρ

### c) (σ -> τ -> ρ) -> τ -> σ -> ρ

### d) (τ -> ρ) -> (σ -> τ) -> σ -> ρ

### Para pensar: el tipo b es el de la función conocida como Combinador S. ¿Con qué función ya conocida de Haskell se corresponden los habitantes de los otros tipos? ¿Hay tipos que no estén habitados? ¿Si se reemplaza ->  por =>, las fórmulas habitadas son siempre tautologías? ¿Las tautologías son siempre fórmulas habitadas?

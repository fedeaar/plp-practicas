## 10. Dada la siguiente función:

```hs
     truncar :: AB a -> Int -> AB a
{T0} truncar Nil \_ = Nil
{T1} truncar (Bin i r d) n = if n == 0 then Nil else Bin (truncar i (n-1)) r (truncar d (n-1))
```

### Y los siguientes lemas:

```hs
1. ∀ x :: Int. ∀ y :: Int. ∀ z :: Int. max (min x y) (min x z) = min x (max y z)
2. ∀ x :: Int. ∀ y :: Int. ∀ z :: Int. z + min x y = min (z+x) (z+y)
```

### Demostrar las siguientes propiedades:

### a) ∀ t :: AB a. altura t ≥ 0

### b) ∀ t :: AB a. ∀ n :: Int. (n ≥ 0 => (altura (truncar t n) = min n (altura t)))

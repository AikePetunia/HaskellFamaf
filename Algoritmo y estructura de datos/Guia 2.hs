

1)
a)Dada una lista de números enteros, que devuelve un único elemento entero de forma recursiva, siendo el caso base una lista vacía de enteros devolviendo 0, siendo el 2 caso definido por como funciona la sumatoria en lenguaje matemático en programación.
b)
  
    Caso base, xs = [] Sum [] 
={Notación en términos constructores} 
    0 
={Caso 1, [] = 0} 
    True

Hipótesis inductiva Sum xs = x + sum xs

Caso inductivo, demuestro que vale para todo x:xs 
-> 
    Sum (x:xs) 
={Matcheo caso 2} 
    x + sum xs 
={Válido por HI}

d) y como que la derivación es única en este caso?

2)
a) 
sum cuad.xs = ⟨ Sum i : 0 ≤ i < length.xs : xs.i ∗ xs.i⟩ 
La sumatoria de los números de una lista multiplicados por sí mismos

sumCuad :: [Int] -> Int
sumCuad [] = 0
sumCuad (x:xs) = x * x + sumCuad xs

b) 
Asumo que e = True 
iga.e.xs = ⟨ ∀ i : 0 ≤ i < #xs : xs.i = e ⟩ 
Para todo elemento en la lista xs, hay un elemento igual a true

igaE :: [a] -> Bool
igaE [] = True
igaE (x:xs) = x == True && igaE xs

c) 
exp.x.n = x^n 
número x elevado a un exponente positivo n

expXN :: Int -> Int -> Int
expXN x n = x^n + expXN

d) 
sum par.n = ⟨ Sum i : 0 ≤ i ≤ n ∧ par.i : i⟩ donde par.i .= i mod 2 = 0. 
Suma todo número par.

sumPar :: [Int] -> Int
sumPar [] = 0
sumPar (x:xs) | x mod 2 == 0 = sumPar | otherwise = x + sumPar xs

e) 
cuantos.p.xs = ⟨N i : 0 ≤ i < #xs : p.(xs.i)⟩ 
Cuenta cuantas p hay en una lista

cuantosP :: [Char] -> Int
cuantosP :: [] = 0
cuantosP | x /= p = cuantosP xs | x == p = 1 + cuantosP xs
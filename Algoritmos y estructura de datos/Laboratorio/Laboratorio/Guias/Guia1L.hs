--LAB PRACTICO 1)

--a)esCero :: Int -> Bool, que verifica si un entero es igual a 0.

esCero :: Int -> Bool
esCero n | n == 0    = True
         | otherwise = False

--chekiado !

--b)esPositivo :: Int -> Bool, que verifica si un entero es estrictamente mayor a 0.

esPositivo :: Int -> Bool
esPositivo n | n == 0 = False
             | n > 0 = True
             | otherwise = False

--chekiado !

--c) esVocal :: Char -> Bool, que verifica si un caracter es una vocal en min ́uscula.

esVocal :: Char -> Bool
esVocal c | c == 'a' = True
          | c == 'e' = True
          | c == 'i' = True
          | c == 'o' = True
          | c == 'u' = True
          | otherwise = False

--chekiado !

--d) ya lo hice en otra ocacion cuatri pasado

--LAB 2)
--Para cada una de las siguientes funciones escrib ́ı una expresi ́on que las describa formalmente. Por otro
--lado, escrib ́ı un programa recursivo que compute la funci ́on.
--
--a) paratodo :: [Bool] -> Bool, que verifica que todos los elementos de una lista sean True.
-- <Ai : 0 <= i < #.xs: xs !! i == true>

paraTodo :: [Bool] -> Bool
paraTodo [] = True                                      --1
paraTodo (x:xs) | not x = False                    --2
                | otherwise = paraTodo xs               --3

--b) sumatoria :: [Int] -> Int, que calcula la suma de todos los elementos de una lista de enteros.

sum1 :: [Int] -> Int
sum1 [] = 0                          --1
sum1 (x:xs) = x + sum xs             --2

--chekiado !

--c) productoria :: [Int] -> Int, que calcula el producto de todos los elementos de la lista de enteros.


prod1 :: [Int] -> Int
prod1 [] = 0                           --1
prod1 (x:xs) = x * prod xs             --2

-- d) factorial :: Int -> Int, que toma un n ́umero n y calcula n!.

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

--chekiado!

{-
e) Utiliza la funci ́on sumatoria para definir, promedio :: [Int] -> Int, que toma una lista de
n ́umeros no vacia y calcula el valor promedio (truncado, usando divisi ́on entera).
-}

promedio :: [Int] -> Int
promedio [] = 0
promedio xs = sum xs `div` length xs

--chekiado !

-- LAB 3)

--a y b y c)
--    La variable libre no necesariamente tiene que ser un i, j, puede ser una lista.
--    a) La variable libre es xs

varA :: [Int] -> Bool
varA [] = True                                     --1
varA (x:xs) | x == 0 = False                        --2
            | x > 0 = varA xs                          --3
            | otherwise = False                     --4

--chekiado !
{-
    varA xs = [−5, −3, 4, 8]
={Notacion en terminos de constructores}
    varA xs-5:-3:4:8:[]
={Matcheo caso 4}
    False 


xs = [11, 2, 5, 8]

    varA xs = [11, 2, 5, 8]
={Notacion en terminos de constructores}
    varA xs  11:2:5:8:[]
={Matcheo caso 3}
    varA 2:5:8:[]
={Matcheo caso 3}
    varA 5:8:[]
={Matcheo caso 3}
    varA 8:[]
={matcheo caso 3}
    varA []
={Caso base}
    True
vvv
    b) La variable libre es x, xs
    x == n
-}

varB :: Eq a => [a] -> a -> Bool
varB [] n = False                               --1
varB (x:xs) n | n == x = True                   --2
              | otherwise = varB xs n           --3

--chekiado !
{-
xs = [11, 2, 5, 8] 5
    
    varB xs = [11, 2, 5, 8] 5
={Notacion en terminos de constructores}
    varB xs 11:2:5:8[] 5 
={Matcheo caso 3}
    varB 2:5:8[] 5
={Mathceo caso 3}
    5 == 5 = True
={Coso}
    True

    c) La variable libre es xs, ys --NO LO PIDE, PERO LO HICE IGUAL
-}

varC :: Eq a => [a] -> [a] -> Bool
varC [] [] = True
varC (x:xs) (y:ys) = x == y && varC xs ys

--chekiado!

-- d) La variable libre es xs

varD :: [Int] -> Bool
varD [] = False                                       --1
varD (x:y:xs) = x == y + 1 && varD xs                --2

--DUDOSO. COPILA COMO QUIERE

{-
xs = [−5, −3, 4, 8]


    varD xs = [−5, −3, 4, 8]
={Notacion en terminos de constructores}
    varD xs =  -5:-3:4:8:[]
={Matcheo caso 2}
    -5 == -3 + 1 && varD  4:8:[]
={False, caso 2}
    4 == 8 + 1 && varD []
={Caso base 1}
    False

xs = [11, 2, 5, 8]

    varD xs = [11, 2, 5, 8]
={Notacion en terminos de constructores}
    varD xs = 11:2:5:8:[]
={Caso 2}
    11 == 2 + 1 && varD 5:8:[]
={False, Caso 2}
    5 == 8 + 1 && varD []
={False, Caso 1}
    False


-}
-- 8 a)
-- 
--     ⟨ ∀ i : 1 ≤ i < n : i ⟩
-- ≡ {Implemento n = 5}
--     ⟨ ∀ i : 1 ≤ i < 5 : i ⟩                           //son elementos de n
-- ≡ { aplico el t ́ermino a cada elemento del rango }
--     (1 * 2 * 3 * 4 * 5)
-- ={aritmetica}
--     120

    --variable libre: n 

prod :: Int -> Int
prod n = n * prod

{-
b) ⟨Sum i: 0 ≤ i < #xs : xs.i ⟩/ #xs

Es el promedio de los elementos de la lista xs en su sumatoria.

xs = [6, 9, 3, 9, 8].

    ⟨Sum i: 0 ≤ i < #xs : xs.i ⟩ / #xs
={Implemento xs}
    ⟨Sum i: i e {6, 9, 3, 9, 8} : xs.i ⟩/ 5
={Impl en xs}
    (xs.1 + xs.2 + xs.3 + xs.4 + xs.5 ) / 5
={Aritmetica}
    (6 + 9 + 3 + 9 + 8 )/5
={Aritmetica}
    7 

    Variable libre xs 
-}

sum :: [Int] -> Int
sum [] = 0                                          --1
sum (x:xs) = x + sum xs 'div' lenght xs             --2

prod2 :: Int -> Int -> Int -> Bool
prod2 i j n | i > n = False
           | j > n = False
           | i * j == n = True
           | otherwise = False

--Chekiado !

--10 y lab 5)

--10. Definı recursivamente una funci ́on todos : [Bool] → Bool que verifica que todos los elementos de una lista
--son True, es decir, que satisface la siguiente especificaci ́on:
--
--todos.xs ≡ ⟨ ∀ i : 0 ≤ i < #xs : xs.i ⟩

todosxs :: [Bool] -> Bool
todosxs [] = True
todosxs (x:xs) = x && todosxs xs

--chekiado!

--11 y lab 6)

--b) n es el elemento mas grande de xs

-- <Max n : n pert xs : n >

--variable libre xs

esMaximo :: [Int] -> Bool
esMaximo [] = False -- Una lista vacía no tiene máximo
esMaximo [x] = True -- Una lista con un solo elemento es siempre máxima
esMaximo (x:xs) = x >= head xs && esMaximo xs

--chekiado !

--c) El producto de los elementos pares de xs

-- -<prod i : 0 ≤ i < length(xs) ∧ `mod` 2 (xs !! i) : (xs !! i)>

-- variable libre xs 

productoPar :: [Int] -> Int
productoPar [] = 1
productoPar (x:xs)
                  | x `mod` 2 == 0 = x * productoPar xs     --alt: even x 
                  | otherwise = productoPar xs

--Solo multiplica numeros pares.

--chekiado !

-- d) La suma de los elementos en posicion par de xs 

--variable libre xs

sumPar :: [Int] -> Int
sumPar [] = 0
sumPar (x:xs) | x `mod` 2 == 0 = x + sumPar xs
              | otherwise = sumPar xs

--chekiado !

--lab clase 2

--27 y lab 7. Defin ́ı recursivamente las siguientes funciones.
--a) La funci ́on paratodo, que dada una lista de valores xs : [A] y un predicado T : A → Bool, determina
--si todos los elementos en xs hacen verdadero el predicado T, es decir:
--
--paratodo.xs.T ≡ ⟨ ∀ i : 0 ≤ i < #xs : T.(xs.i) ⟩

paraTodo1 :: [a] -> (a -> Bool) -> Bool
paraTodo1 [] _ = True
paraTodo1 (x:xs) t = t x && paraTodo1 xs t

{-
Para testear:

ghci
Prelude> numeros = [2,4,6,8]
Prelude> esPar x = x `mod` 2 == 0
Prelude> paraTodo numeros esPar
True

Prelude> numeros2 = [2,4,5,8]
Prelude> esMayorA5 x = x > 5
Prelude> paraTodo numeros esMayorA5
False
-}

-- chekiado !

-- b) La función existe, que dada una lista de valores xs : [A] y un predicado T : A → Bool, determina si
-- algún elemento en xs hace verdadero el predicado T, es decir:
-- existe : [A] → (A → Bool) → Bool
-- existe.xs.T ≡ ⟨ ∃ i : 0 ≤ i < #xs : T.(xs.i) ⟩
-- Puede ser de ayuda recordar la función del ejercicio 9.

-- --ej 9 

algunof :: Eq a => [a] -> Bool
algunof [] = False
algunof [x] = False
algunof (x:y:xs) = x /= y || algunof (y:xs)

-- >

paraTodo2 :: [a] -> (a -> Bool) -> Bool
paraTodo2 [] _ = True
paraTodo2 (x:xs) t = t x && paraTodo2 xs t

existe :: [a] -> (a -> Bool) -> Bool
existe [] _ = True
existe (x:xs) t = t x && existe xs t


esPar :: Int -> Bool
esPar x = x `mod` 2 == 0

resultado1 = existe [1, 3, 5, 7] esPar  -- Debería ser False
resultado2 = existe [1, 2, 3, 5] esPar  -- Debería ser True

main :: IO ()
main = do
    print resultado1  -- Imprime False
    print resultado2  -- Imprime True

--Nda false en ambos. 

-- c)

-- La función sumatoria, que dada una lista de valores xs : [A] y una función T : A → Num (toma
-- elementos de A y devuelve números), calcula la suma de la aplicación de T a los elementos en xs es
-- decir:

-- sumatoria : [A] → (A → Num) → Num
-- sumatoria.xs.T = ⟨sum i : 0 ≤ i < #xs : T.(xs.i) ⟩

-- Función sumatoria que suma los resultados de aplicar T a los elementos de la lista xs
sumatoria :: [a] -> (a -> Int) -> Int
sumatoria [] _ = 0
sumatoria (x:xs) t = t x + sumatoria xs t

{-
    -- Función que devuelve 1 si el número es par, 0 si es impar
    esPar :: Int -> Int
    esPar x = if x `mod` 2 == 0 then 1 else 0

    -- Ejemplo de uso
    main :: IO ()
    main = do
        let lista = [1, 2, 3, 4, 5, 6]
        let sumaPares = sumatoria lista esPar
        print sumaPares  -- Esto debería imprimir 3, ya que hay 3 números pares en la lista (2, 4, 6)

    --let lista = [1, 2, 3, 4, 5, 6]
    --sumatoria lista esPar
-}
-- chekiado !

-- d)

-- d) La función productoria, que dada una lista de valores xs : [A] y una función T : A → Num, calcula
-- el producto de la aplicación de T a los elementos de xs, es decir:

-- productoria : [A] → (A → Num) → Num
-- productoria.xs.T = ⟨Prod i : 0 ≤ i < #xs : T.(xs.i) ⟩

productoria :: [a] -> (a -> Int) -> Int
productoria [] _ = 0
productoria (x:xs) t = t x + productoria xs t

-- Función que devuelve 1 si el número es par, 0 si es impar
{-
esPar :: Int -> Int
esPar x = if x `mod` 2 == 0 then 1 else 0

-- Ejemplo de uso
main :: IO ()
main = do
    let lista = [1, 2, 3, 4, 5, 6]
    let sumaPares = productoria lista esPar
    print sumaPares  -- Esto debería imprimir 3, ya que hay 3 números pares en la lista (2, 4, 6)

--let lista = [1, 2, 3, 4, 5, 6]
--sumatoria lista esPar
-}
-- chekiado !

--lab 8 skip

-- Lab 9)
-- a)
todosPares :: [Int] -> Bool
todosPares = all even

-- chekiado ! 

-- b)
hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo x = any (\y -> y `mod` x == 0)

-- chekiado ! 
-- c)
sumaCuadrados :: Int -> Int
sumaCuadrados n = sum (map (^2) [0..(n-1)])

-- Chekiado ! 
-- d)
existeDivisor :: Int -> [Int] -> Bool
existeDivisor n = any (\x -> n `mod` x == 0)

-- Chekiado !
-- e)
existeDivisor2 :: Int -> [Int] -> Bool
existeDivisor2 n = any (\x -> n `mod` x == 0)

esPrimo :: Int -> Bool
esPrimo n = n > 1 && not (existeDivisor2 n [2..(n-1)])

-- Por que me dice me fije si n es primo si me pide ver una lista? en todo caso hecho antes.
-- f)

factorial1 :: Int -> Int
factorial1 n = product [1..n]

-- Chekiada !

-- g)
existeDivisor1 :: Int -> [Int] -> Bool
existeDivisor1 n = any (\x -> n `mod` x == 0)

esPrimo3 :: Int -> Bool
esPrimo3 n = n > 1 && not (existeDivisor1 n [2..(n-1)])

multiplicaPrimos :: [Int] -> Int
multiplicaPrimos xs = product (filter esPrimo xs)

--chekiada !
-- h)

esFib :: Int -> Bool
esFib n = n >= 0 && n == fib (fibIndex n)
  where
    fibIndex x = length (takeWhile (< x) (fibs)) - 1
    fibs = 0 : 1 : zipWith (+) fibs (tail fibs) -- ??? chatgpt

todosFib :: [Int] -> Bool
todosFib xs = all esFib xs

--chekiada !
-- MAP
map :: (a -> b) -> [a] -> [b]

-- definida:
map f xs = map f xs

-- La función map:
--     Toma 2 argumentos, uno de los cuales es una función
--     Aplica f a cada elemento de xs
--     El resultado es una lista con la aplicación en el mismo orden

-- EJ:

-- Prelude> map succ [1,2,3,4]
-- [2,3,4,5]
-- Prelude> map not [False, False, True]
-- [True,True,False]

-- FILTER
filter :: (a -> Bool) -> [a] -> [a]

-- definida:

filter p [] = []
filter p (x:xs) | p x = x : filter p xs
                | otherwise = filter p xs

-- La función filter:
--     Toma 2 argumentos, uno de los cuales es un predicado
--     El resultado es una lista con los elementos que cumplen el predicado

-- Prelude> filter (<2) [3,1,0,6,9]
-- [1,0]
-- Prelude> filter even [8,2,3,6,11]
-- [8,2,6]

-- b)

-- Prelude> map succ [1,-4, 6, 2, -8]
-- [3, -1, 8, 4, -6]

-- c)
-- Prelude> filter esPositivo [1, -4, 6, 2, -8]
-- [1, 6, 2]

-- 29. lab 10 

duplicaValorXS :: [Int] -> [Int]
duplicaValorXS xs = map (* 2) xs

-- b) 

duplicaValorXS1 :: [Int] -> [Int]
duplicaValorXS1 [] = []
duplicaValorXS1 (x:xs) = map (* 2 ) xs

-- chekiado !

-- lab 11)
-- Laboratorio 11 Program ́a una funci ́on que dada una lista de n ́umeros xs, calcula una lista que tiene como
-- elementos aquellos n ́umeros de xs que son primos.


-- c) Revis ́a tu definici ́on del ejercicio g. ¿C ́omo podes mejorarla?

-- a) Definila usando recursi ́on.
esPrimo2 :: Int -> Bool
esPrimo2 n | n < 2 = False
          | otherwise = all (\x -> n `mod` x /= 0) [2..(n-1)]

primosRec :: [Int] -> [Int]
primosRec [] = []
primosRec (x:xs)
    | esPrimo x = x : primosRec xs
    | otherwise = primosRec xs

-- chekiado !

-- b) Definila utilizando la funci ́on filter.

esPrimo1 :: Int -> Bool
esPrimo1 n | n < 2 = False
          | otherwise = all (\x -> n `mod` x /= 0) [2..(n-1)]

primosFilter :: [Int] -> [Int]
primosFilter = filter esPrimo

-- chekiado !

-- Lab 12)
-- a)
primIgualesA :: Eq a => a -> [a] -> [a]
primIgualesA n [] = []
primIgualesA n (x:xs) | n == x = x : primIgualesA n xs
                      | otherwise = []

-- chekiado !

-- b)
primIgualesA1 :: Eq a => a -> [a] -> [a]
primIgualesA1 n = takeWhile (== n)

-- chekiado !

-- Takewhile toma elementos de una lista mientras se cumple la condicion dada en ()

-- lab 13) 
-- DA ES LO MISMO

primIgualesA2 :: Eq a => [a] -> [a]
primIgualesA2 [] = []
primIgualesA2 (x:xs) = x : takeWhile (==x) xs

-- Chekiado !

primIgualesA3 :: Eq a => [a] -> [a]
primIgualesA3 [] = []
primIgualesA3 [x] = [x]
primIgualesA3 (x:xs)
    | x == head xs = x : primIgualesA3 xs
    | otherwise = [x]

-- chekiado !

--b)

primIguales :: Eq a => [a] -> [a]
primIguales xs
    | null xs = []
    | otherwise = primIgualesA3 (takeWhile (== head xs) xs)


-- chekiado !

-- 30, lab 14) pasa palabra

-- lab 15)

primQueCumplen :: [a] -> (a -> Bool) -> [a]
primQueCumplen [] _ = []
primQueCumplen (x:xs) p
    | p x       = x : primQueCumplen xs p
    | otherwise = []

--     esta esta cool

primQueCumplen1 :: [a] -> (a -> Bool) -> [a]
primQueCumplen1 ls p = takeWhile p ls

-- lab 16) https://prnt.sc/42X9B29JjDxH

-- lab 17)
-- a)  f :: (a -> Bool) -> [[a]] -> [a]

-- b) [[a]] -> [a]

--c) f :: (a -> b) -> a -> b
--f a b = a b

--d)
--f :: (a -> b) -> [a] -> [b]
--f a b = [] []


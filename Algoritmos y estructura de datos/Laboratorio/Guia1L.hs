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
paraTodo (x:xs) | x == False = False                    --2
                | otherwise = paraTodo xs               --3

{-
chekiado !

Dada la lista Paratodo[True , False, True]

    paraTodo[True , False, True]
={Notacion en terminos de constructores}
    paraTodo True:False:True:[]
={Caso 3}
    paraTodo False:True[]
={Caso 2}
    False == False = False
={False}
    False

Dada la lista paraTodo[True, True]

    paraTodo[True, True]
={Notacion en terminos constructores}
    paraTodo True:True:[]
={caso 3}
    paraTodo True:[]
={Caso 3}
    paraTodo []
={Caso 1, caso base}
    True
-}

--b) sumatoria :: [Int] -> Int, que calcula la suma de todos los elementos de una lista de enteros.
-- <Sum i : 0 <= i ^ i < length.xs : xs.i> 

sum :: [Int] -> Int
sum [] = 0                          --1
sum (x:xs) = x + sum xs             --2

--chekiado !

{-
sum [1, 5, -4]

    sum [1, 5, -4]
={Notacion en terminos de constructores}
    sum 1:5:-4:[]
={Caso 2}
    1 + sum 5:-4:[]
={Caso 2}
    1 + (5 + sum -4:[])
={Caso 2}
    1 + (5 + ((-4) sum []))
={Caso 1, caso base}
    1 + 5 + (-4) + 0
={Aritmentica}
    2

c) productoria :: [Int] -> Int, que calcula el producto de todos los elementos de la lista de enteros.
<Prod i : 0 <= i ^ i < length.xs : xs.i > 
-}

prod :: [Int] -> Int
prod [] = 0                           --1
prod (x:xs) = x * prod xs             --2

{-
prod [2, 4, 1]

   prod [2, 4, 1]
={Notacion en terminos de constructores}
    prod 2:4:1[]
={Caso 2}
    2 * prod 4:1:[]
={Caso 2}
    2 * (4 * prod 1:[])
={Caso 2}
    2 * (4 * (1 prod []))
={Caso 1, caso base}
    2 * 4 *  1 * 0
={Aritmentica}
    8

d) factorial :: Int -> Int, que toma un n ́umero n y calcula n!.
<A i : 0 <= i ^ i < length.xs : n * n-1>                (?)
-}

factorial :: Int -> Int
factorial 0 = 1 
factorial n = n * factorial (n-1)

--chekiado!
{-
e) Utiliza la funci ́on sumatoria para definir, promedio :: [Int] -> Int, que toma una lista de
n ́umeros no vacia y calcula el valor promedio (truncado, usando divisi ́on entera).

<sum i : 0 <= i ^ i < length.xs : xs.i 'div' lenght.xs >
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
varC _ _ = False
varC (x:xs) (y:ys) = (x == y) && varC xs ys

--    d) La variable libre es xs

varD :: [Int] -> Bool
varD [] = False                                             --1
varD (x:y:xs) = (x == y + 1) && varD xs                --2

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

prod :: Int -> Int -> Int -> Bool
prod i j n | i > n = False
           | j > n = False
           | i * j == n = True
           | otherwise = False 


--10 y lab 5)

--10. Definı recursivamente una funci ́on todos : [Bool] → Bool que verifica que todos los elementos de una lista
--son True, es decir, que satisface la siguiente especificaci ́on:
--
--todos.xs ≡ ⟨ ∀ i : 0 ≤ i < #xs : xs.i ⟩

todosxs :: [Bool] -> Bool 
todosxs [] = True 
todosxs (x:xs) = x && todos xs

--11 y lab 6)

--b) n es el elemento mas grande de xs

-- <Max n : n pert xs : n >

--variable libre xs

esMaximo :: [Int] -> Bool
esMaximo [] = True 
esMaximo (x:xs) = max(xs) esMaximo xs 

--chekiado !

--c) El producto de los elementos pares de xs

-- -<prod i : 0 ≤ i < length(xs) ∧ mod 2 (xs !! i) : (xs !! i)>

-- variable libre xs 

productoPar :: [Int] -> Int
productoPar [] = 1  
productoPar (x:xs)
                  | mod 2 x = x * productoPar xs
                  | otherwise = productoPar xs

--chekiado !

-- d) La suma de los elementos en posicion par de xs 

-- <sum i : 0 <= i < length xs ^ mod 2 (xs !! i) : xs !! i >

--variable libre xs

sumPar :: [Int] -> Int
sumPar [] = 0
sumPar (x:xs) | mod 2 x = x + sumPar xs 
              | otherwise = sumPar xs 

--chekiado !

--lab clase 2

--27 y lab 7. Defin ́ı recursivamente las siguientes funciones.
--a) La funci ́on paratodo, que dada una lista de valores xs : [A] y un predicado T : A → Bool, determina
--si todos los elementos en xs hacen verdadero el predicado T, es decir:
--
--paratodo.xs.T ≡ ⟨ ∀ i : 0 ≤ i < #xs : T.(xs.i) ⟩
--
--todos.xs ≡ ⟨ ∀ i : 0 ≤ i < #xs : xs.i ⟩

-- --func ej 10
todosxs :: [Bool] -> Bool 
todosxs [] = True 
todosxs (x:xs) = x && todos xs

paraTodo :: [a] -> (a -> Bool) -> Bool
paraTodo [] _ = True
paraTodo (x:xs) t = t x && paraTodo xs t

-- chekiado !

-- b) La función existe, que dada una lista de valores xs : [A] y un predicado T : A → Bool, determina si
-- algún elemento en xs hace verdadero el predicado T, es decir:

-- existe : [A] → (A → Bool) → Bool
-- existe.xs.T ≡ ⟨ ∃ i : 0 ≤ i < #xs : T.(xs.i) ⟩

-- Puede ser de ayuda recordar la función del ejercicio 9.

-- --ej 9 

algunof :: [A] -> Bool
algunof.[] = False
algunof.(x:xs) = f.x || algunof.xs

-- ->

existe :: [a] -> (a -> Bool) -> Bool
existe [] _ = True
existe (x:xs) t = t x && paraTodo xs t

-- chekiado !

-- c)

-- La función sumatoria, que dada una lista de valores xs : [A] y una función T : A → Num (toma
-- elementos de A y devuelve números), calcula la suma de la aplicación de T a los elementos en xs es
-- decir:

-- sumatoria : [A] → (A → Num) → Num
-- sumatoria.xs.T = ⟨sum i : 0 ≤ i < #xs : T.(xs.i) ⟩

sumatoria :: [a] -> (a -> Int) -> Int 
sumatoria [] _ = 0
sumatoria (x:xs) t = t x + sumatoria xs t

-- chekiado !

-- d)

-- d) La función productoria, que dada una lista de valores xs : [A] y una función T : A → Num, calcula
-- el producto de la aplicación de T a los elementos de xs, es decir:

-- productoria : [A] → (A → Num) → Num
-- productoria.xs.T = ⟨Prod i : 0 ≤ i < #xs : T.(xs.i) ⟩

productoria :: [a] -> (a -> Int) -> Int
productoria [] _ = 0
productoria (x:xs) t = t x + productoria xs t

-- chekiado !

-- lab 8)

paraTodo :: [a] -> (a -> Bool) -> Bool
paraTodo [] _ = True                            -- 1
paraTodo (x:xs) t = t x && paraTodo xs t        -- 2

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
sumaCuadrados n = n >= 0 && sum (map (^2) [0..(n-1)])

-- noanda
-- d)
existeDivisor :: Int -> [Int] -> Bool
existeDivisior n (x:xs) = (\x -> x /= 0 && n `mod` x == 0)

-- como lo hago recursivo sin usar recursividad

-- e)
esPrimo :: Int -> Bool
esPrimo n = n mod 2 /= 0 && esPrimo n

-- Por que me dice me fije si n es primo si me pide ver una lista? en todo caso hecho antes.

-- f)

factorial :: Int -> Int
factorial 0 = 1 
factorial n = n * factorial (n-1)

-- CREO que esta evitada 

-- sino

factorial :: Int -> Int
factorial n = product [1..n]

-- g)
esPrimo :: Int -> Bool
esPrimo n
  | n <= 1    = False
  | n == 2    = True
  | even n    = False
  
multiplicaPrimos :: [Int] -> Int 
multiplicaPrimos (x:xs) = product (filter esPrimo xs) 

-- h)

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

esFib :: Int -> Int
esFib n
  | n < 0     = esFib n 
  | otherwise = fib n 

-- MAP
map :: (a -> b) -> [a] -> [b]

-- definida:
map f [] = []
map f (x:xs) = f x : map f xs

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

-- 29.

duplicaValorXS :: [Int] -> [Int]
duplicaValorXS [] = []
duplicaValorXS (x:xs) = x * 2 : duplicaValorXS xs 

-- b) 

duplicaValorXS :: [Int] -> [Int]
duplicaValorXS [] = []
duplicaValorXS (x:xs) = map (* 2 ) xs  


-- chekiado !

-- lab 10 hecho arriba lol)

-- lab 11)

esPrimo :: Int -> Bool
esPrimo n | n < 2 = False
          | otherwise = all (\x -> n `mod` x /= 0) [2..(n-1)]

primosRec :: [Int] -> [Int]
primosRec [] = []
primosRec (x:xs)
    | esPrimo x = x : primosRec xs
    | otherwise = primosRec xs

-- chekiado !

-- con filter:

esPrimo :: Int -> Bool
esPrimo n | n < 2 = False
          | otherwise = all (\x -> n `mod` x /= 0) [2..(n-1)]

primosFilter :: [Int] -> [Int]
primosFilter xs = filter esPrimo xs


-- chekiado !


-- Lab 12)
-- a)
primIgualesA :: a -> [a] -> [a]
primIgualesA n [] = []
primIgualesA n (x:xs) | n == x = x : primIguales n xs 
                      | otherwise = []


-- chekiado !

-- b)
primIgualesA :: Eq a => a -> [a] -> [a]
primIgualesA n = takeWhile (== n)


-- chekiado !

-- Takewhile toma elementos de una lista mientras se cumple la condicion dada en ()

-- lab 13) 
-- DA ES LO MISMO

primIguales :: [a] -> [a]
primIguales [] = []
primIguales (x:xs) = x : takeWhile (==x) xs 

-- Chekiado !

primIguales :: Eq a => [a] -> [a]
primIguales [] = []
primIguales (x:xs) = primIgualesA x (x:xs)

-- chekiado !

-- 30, lab 14) pasa palabra

-- lab 15)

primQueCumplen :: [a] -> (a -> Bool) -> [a]
primQueCumplen [] _ = []
primQueCumplen (x:xs) p
    | p x       = x : primQueCumplen xs p
    | otherwise = []

--     esta esta cool

primQueCumplen :: [a] -> (a -> Bool) -> [a]
primQueCumplen ls p = takeWhile p ls

-- lab 16) https://prnt.sc/42X9B29JjDxH

-- lab 17)
-- a) f :: (a -> Bool) -> [[a]] -> [a]

-- b) [[a]] -> [a]

--c) f :: (a -> b) -> a -> b
--f a b = a b

--d)
--f :: (a -> b) -> [a] -> [b]
--f a b = [] []


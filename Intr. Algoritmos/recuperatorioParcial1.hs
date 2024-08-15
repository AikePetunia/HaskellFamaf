

--2 funciones recursivas. Tipo, Caso base, recursion.
--1 punto Induccion.
-- todas deben de tener evaluaciones manuales. 

-- Practico 2, 3

{- 
length, longitud, toma una lista xs y devuelve su cantidad de elementos. Ej: length [1,2,0,5] = 4.

!! toma una lista xs (a izquierda) y un natural n que indica una posición, y devuelve el elemento de la
lista que se encuentra en la posición n (contando a partir de la posición 0). Ej: [1,3,3,6,2,3,4,5] !!
4 = 2. Este operador, llamado índice, asocia a izquierda, por lo tanto xs !! n !! m se interpreta como
(xs !! n) !! m.

take (tomar) dada un natural n y una lista xs devuelve la sublista con los primeros n elementos de xs.
Ej: take 2 [1,2,3,4,5,6] = [1,2].

drop (tirar) dada un natural n y una lista xs devuelve la sublista sin los primeros n elementos de xs. Ej:
drop 2 [1,2,3,4,5,6] = [3,4,5,6].

++ toma dos listas xs (a izquierda) e ys (a derecha), y devuelve la lista con todos los elementos de xs
seguidos de los elementos de ys. Ej: [1,2,4] ++ [1,0,7] = [1,2,4,1,0,7]. Este operador, llamado
concatenación, es asociativo por lo que podemos escribir sin ambigüedad expresiones sin paréntesis, como
xs ++ ys ++ zs.

head, llamada cabeza, toma una lista xs y devuelve su primer elemento. Ej: head [1,2,3] = 1.

tail, llamada cola, toma una lista xs y devuelve la sublista que resulta de eliminar el primer elemento.
Ej: tail [1,2,3] = [2,3].
-}

{-
soloPares :: [Int] -> [Int], que dada una lista de enteros xs devuelve una lista sólo con los
números pares contenidos en xs, en el mismo orden y con las mismas repeticiones (si las hubiera).
Por ejemplo: soloPares [3,0,-2,12] = [0,-2, 12]
-}

--3a

soloPares :: [Int] -> [Int]
soloPares [] = []
soloPares (x:xs) | mod x 2 == 0 = x : soloPares xs
                | otherwise = soloPares xs


{-
mayoresQue10 :: [Int] -> [Int], que dada una lista de enteros xs devuelve una lista sólo con los
números mayores que 10 contenidos en xs,
Por ejemplo: mayoresQue10 [3,0,-2, 12] = [12]
-}
--b 

mayoresQue10 :: [Int] -> [Int]
mayoresQue10 [] = []
mayoresQue10 (x:xs) | x > 10 = x : mayoresQue10 xs
                    | otherwise = mayoresQue10 xs 

--COPILA
{-
mayoresQue :: Int -> [Int] -> [Int], que dado un entero n y una lista de enteros xs devuelve
una lista sólo con los números mayores que n contenidos en xs,
Por ejemplo: mayoresQue 2 [3,0,-2, 12] = [3,12]
-}

--3c

mayoresQue :: Int -> [Int] -> [Int] 
mayoresQue n [] = []
mayoresQue _ [] = []
mayoresQue n (x:xs) | x > n = x : mayoresQue n xs 
                    | otherwise = mayoresQue n xs

--COPILA
{-
sumar1 :: [Int] -> [Int], que dada una lista de enteros le suma uno a cada uno de sus elementos.
Por ejemplo: sumar1 [3,0,-2] = [4,1,-1]
-}

sumar1 :: [Int] -> [Int]
sumar1 [] = []
sumar1 (x:xs) = (x + 1) : sumar1 xs 

--COPILA

{-
duplica :: [Int] -> [Int], que dada una lista de enteros duplica cada uno de sus elementos.
Por ejemplo: duplica [3,0,-2] = [6,0,-4]
-}

duplica :: [Int] -> [Int]
duplica [] = []
duplica (x:xs) = (x * 2) : duplica xs  

{-
multiplica :: Int-> [Int] -> [Int], que dado un número n y una lista, multiplica cada uno de
los elementos por n.
Por ejemplo: multiplica 3 [3,0,-2] = [9,0,-6]
-}

multiplica :: Int-> [Int] -> [Int]
multiplica n [] = []
multiplica n (x:xs) = (x * n) : multiplica n xs 

{- 5
todosMenores10 :: [Int] -> Bool, que dada una lista devuelve True si ésta consiste sólo de nú-
meros menores que 10.
Por ejemplo: todosMenores10 [1,3,9] = True
-}

todosMenores10 :: [Int] -> Bool
todosMenores10 [] = True 
todoMenores10 (x : xs)
  | x >= 10 = True
  | x <= 10 = False
  | otherwise = todosMenores10 xs


{-
hay0 :: [Int] -> Bool, que dada una lista decide si existe algún 0 en ella.
Por ejemplo: hay0 [1,0,3] = True
-}

hay0 :: [Int] -> Bool
hay0 [] = False 
hay0 (x:xs) | x /= 0 = hay0 xs 
            | x == 0 = True

{-
sum :: [Int] -> Int, que dada una lista devuelve la suma de todos sus elementos.
Por ejemplo: suma [1,2,3] = 6
-}

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x : xs) = x + sumatoria xs


{- 6
funcion zip
-}

zip2 :: [a] -> [b] -> [(a,b)]
zip2 xs [] = []
zip2 [] ys = []
zip2 (x:xs) (y:ys) = (x, y) : zip2 xs ys

{- 7
. Una función de tipo unzip es aquella que dada una lista de tuplas devuelve una lista de alguna de las
proyecciones de la tupla. Por ejemplo, si tenemos una lista de ternas donde el primer elemento representa
el nombre de un alumno, el segundo el apellido, y el tercero la edad, la función que devuelve la lista de
todos los apellidos de los alumnos en una de tipo unzip.
Denir la función apellidos :: [(String, String, Int)] -> [String].
Ej: apellidos [("Juan","Dominguez",22), ("Maria","Gutierrez",19), ("Damian","Perez",43)]
["Dominguez","Gutierrez","Perez"]
Dení la función recursivamente.
-}

apellidos :: [(String, String, Int)] -> [String]
apellidos [] = [""]
apellidos ( (x,y,z): xs) = y : apellidos xs

{-
8. Definí recursivamente los operadores básicos de listas: length, !!, take, drop, ++. Para los operadores
take y drop deberás hacer recursión en ambos parámetros, en el parámetro lista y en el parámetro
numérico.
-}

--Length

myLength :: [a] -> Int
myLength [] = 0
myLength ( _ : xs) = 1 + myLength xs

-- !! 

quitar :: [a] -> Int -> a
quitar (x : _) 0 = x
quitar (_ : xs) n = quitar xs (n - 1)



--take

tomarNum :: Int -> [a] -> [a]
tomarNum 0 _ = []
tomarNum _ [] = []
tomarNum n (x : xs) = x : tomarNum (n - 1) xs

--drop

dejarLista :: Int -> [a] -> [a]
dejarLista 0 xs = xs
dejarLista _ [] = []
dejarLista n (_ : xs) = dejarLista (1 - n) xs

-- ++

sumarListas :: [a] -> [a] -> [a]
sumarListas [] ys = ys
sumarListas (x : xs) ys = x : (xs sumarListas ys)

{-
(i) Dení funciones por recursión para cada una de las siguientes descripciones. (ii) Evaluá los ejem-
plos manualmente (iii) Identicá si las funciones son de algún tipo ya conocido (lter, map, fold). (iv)
Programálas en haskell y vericá los resultados obtenidos.
-}

{-
maximo :: [Int] -> Int, que calcula el máximo elemento de una lista de enteros.
Por ejemplo: maximo [2,5,1,7,3] = 7
Ayuda: Ir tomando de a dos elementos de la lista y `quedarse' con el mayor.
-}

maximo :: [Int] -> Int
maximo [x] = x                         --1
maximo (x:xs) = max x : (maximo xs)     --2

{- 
maximo [2,5,1,7,3]
≡{notación de constructores}
maximo 2:5:1:7:3:[]
≡{def. de máximo caso recursivo, con x=2 , xs=5:1:7:3:[]}
max 2 : (maximo 5:1:7:3:[])
≡{def. de máximo caso recursivo, con x=5 , xs=1:7:3:[]}
max 2 : (max 5 : (maximo 1:7:3:[]))
≡{def. de máximo caso recursivo, con x=1 , xs=7:3:[]}
max 2 (max 5 (max 1 (maximo 7:3:[])))
≡{def. de máximo caso recursivo, con x=7 , xs=3:[]}
max 2 (max 5 (max 1 (max 7 (maximo 3:[]))))
≡{def. de máximo caso base, con x=[3])}
max 2 (max 5 (max 1 (max 7 3)))
≡{def. de max con 7 y 3}
max 2 (max 5 (max 1 7)
≡{def. de max con 1 y 7}
max 2 (max 5 7)
≡{def. de max con 5 y 7}
max 2 7
≡{def. de max con 2 y 7}
7 
-}

{-
sumaPares :: [(Int, Int)] -> Int, que dada una lista de pares de números, devuelve la suma-
toria de todos los números de todos los pares.
Por ejemplo: sumaPares [(1,2)(7,8)(11,0)] = 29
-}

sumaPares :: [(Int, Int)] -> Int  
sumaPares [(x,y)] = 0                                   --1
sumaPares (x:xs) = (fst x) + (snd x) + sumaPares xs     --2

--Evaluacion manual
{-
  sumaPares [(1,2)(7,8)(11,0)]
={Notacion en terminos de constructores}
  sumaPares (1,2):(7,8):(11,0):[]
={Por def. sumaPares Caso 2}
  (1) + (2) + (sumaPares (7,8):(11,0):[])
={Por def. sumaPares caso 2}
  3 + ((7) + (8) + sumaPares (11,0):[])
={Por def. sumaPares caso 2}
  3 + 15 + ((11) + (0) sumaPares [])
={Def. Suma}
  29
-}

{-
todos0y1 :: [Int] -> Bool, que dada una lista devuelve True si ésta consiste sólo de 0s y 1s.
Por ejemplo: todos0y1 [1,0,1,2,0,1] = False, todos0y1 [1,0,1,0,0,1] = True
-}

todos0y1 :: [Int] -> Bool
todos0y1 [] = True                       --1
todos0y1 (x:xs) | x == 0 = todos0y1 xs    --2
                | x == 1 = todos0y1 xs    --3
                | otherwise = False       --4
{-
  todos0y1 [1,0,1,0,0,1]
={Notacion en terminos de constructores}
  todos0y1 1:0:1:0:0:1:[]
={Def. Caso 3}
  1 == 1 = todos0y1 0:1:0:0:1:[]
={Def. caso 2}
  0 == 0 = todos0y1 1:0:0:1:[]
={Def. Caso 3}
  1 == 1 = todos0y1 0:0:1:[]
={Def. caso 2}
  0 == 0 = todos0y1 0:1:[]
={Def. caso 2}
  0 == 0 = todos0y1 1:[]
={Def. Caso 3}
  1 == 1 = todos0y1 []
={Def. caso base 1}
  True
-}

{-
quitar0s :: [Int] -> [Int] que dada una lista de enteros devuelve la lista pero quitando todos
los ceros.
Por ejemplo quitar0s [2,0,3,4] = [2,3,4]
-}

quitar0s :: [Int] -> [Int]
quitar0s [x] = [x]                              --1
quitar0s (x:xs) | x /= 0 = x : quitar0s xs      --2
                | otherwise = quitar0s xs       --3

                
{-
  quitar0s [2,0,3,4]
={Notacion en terminos constructores}
  quitar0s 2:0:3:4[]
={Def. Caso 2}
  2 /= 0 = 2 : quitar0s [2:0:3:4]
={Def. caso 3}
  2 : quitar0s [3:4]
={Def. Caso 3}
  2 : (3 /= 0 = 3 : quitar0s [4] )
={Def. caso 3}
    2 : 3 : (4 /= 0 = 4 : quitar0s [] )
={Pegado a lista }
  [2,3,4]
-}

{-
ultimo :: [a] -> a, que devuelve el último elemento de una lista.
Por ejemplo: ultimo [10,5,3,1] = 1
-}

ultimo :: [a] -> a
ultimo [x] = x                  --1
ultimo (x:xs) = ultimo xs       --2

{-
	ultimo [“abc”]
≡ {notacion en terminos de constructores}
ultimo ‘a’:’b’:’c’:[]
≡{def. caso 2, x=a, xs=’b’:’c’:[]}
	ultimo ‘b’:’c’:[]
≡{def. caso 2, x=b, xs=’c’:[]}
ultimo ’c’:[]
≡{def. caso 1, x=c}
	c
-}

{-
repetir :: Int-> Int-> [Int], que dado un número n mayor o igual a 0 y un número k arbitrario
construye una lista donde k aparece repetido n veces.
Por ejemplo: repetir 36 = [6,6,6]
-}

repetir :: Int -> Int -> [Int]
repetir n 0 = []
repetir n k = n : repetir n (k-1)

{-
	repetir 2 3
≡{def. de n y k, siendo n el que se repetira k veces. n=2, k=3}
	repetir 3 2 = 3 : repetir 3 (2-1)
≡{def. de repetir caso 2 siendo 3 el repetir, disminuyo n 1 vez y guarda a 3 }
	repetir 3 2 = 3 : repetir 3 (2-1)
≡{def. de repetir caso 2 siendo 3 el repetir, disminuyo n 1 vez y guarda a 3 }
repetir 3 1 = 3 : repetir 3 (1-1)
≡{def. de repetir caso 2 siendo 3 pero }
repetir 3 0 = []
≡{lista completa}
	[3,3]

-}

{-
concat :: [[a]] -> [a] que toma una lista de listas y devuelve la concatenación de todas ellas.
Por ejemplo: concat [[1,4],[],[2]] = [1,4,2]
-}

concat :: [[a]] -> [a]
concat [] = []
concat (xs:xss) = xs ++ concat xss

{-
concat [[1,4], [], [2]] 
={Notación de construcción de lista}
concat ([1,4] : [[ ], [2]])
={Def 2 de concat}
[1,4] ++ concat [[ ], [2]]
={Notación de construcción de lista}
[1,4] ++ concat [ ] : [[2]] 
={Def 2 de concat, xs = [ ], xss = [ [2] ] }
[1,4] ++ ([ ] ++ concat [ [2] ])
={Notación de construcción de lista}
[1,4] ++ ([ ] ++ concat [2] : [ ])
={Def 2 de concat, xs = [ 2 ], xss = [ ] }
[1,4] ++ ([ ] ++ ([2] ++ concat [ ]))
={Def 1 de concat}
[1,4] ++ ([ ] ++ ([2] ++ [ ]))
={Def de ++}
[1,4, 2]
-}

rev :: [a] -> [a]
rev [] = []                           1
rev (x:xs) = rev xs ++ [x]            2      

rev [1,2,3] 
≡{Notacion en terminos de constructores}
	rev 1:2:3:[]
≡{def. caso 2 , con x=1, xs = 2:3[] guarda 1}
	[1] ++ rev 3:[] ++ [2]
≡{def. caso 2 , con x=2, xs = 3[] guarda 2}
	[1] ++ [2] ++ rev [] ++ [3]
≡{def. caso 2 con x= 3, xs = [] guarda 3}
	[1] ++ [2] ++ [3] rev [] = []
≡{def. caso 2 con x = []}
	[1] ++ [2] ++ [3] 


--induccion
--10

sumar1 :: [Int] -> [Int]
sumar1 [] = []                            1
sumar1 (x:xs) = (x + 1) : sumar1 xs       2

sumatoria :: [Int] -> Int   
sumatoria [] = 0                          3
sumatoria (x : xs) = x + sumatoria xs     4

Length :: [a] -> Int
Length [] = 0                             5
Length ( _ : xs) = 1 + Length xs        6


sumatoria (sumar1 xs) = sumatoria xs + (length xs)

--1) Caso base 
  sumatoria (sumar1 []) = sumatoria [] + (length [])
={Def. Caso 1 y 5 base}
  sumatoria ([]) = sumatoria [] + (0)
={Def. Caso base sumatoria 3}
  0 = 0 

  --2) Planteo de hipotesis inductiva

  sumatoria (sumar1 xs) = sumatoria xs + (length xs)

  --3) Demuestro que vale para P(x:xs)

    sumatoria (sumar1 (x:xs)) = sumatoria (x:xs) + lenght(x:xs)
≡ {Def. sumar1, sum, length}
	sumatoria((x+1):sumar1 xs) = x + sumatoria xs + 1 +lenght + xs 
≡ {Def. de sum}
	(x+1) + sumatoria(sumar1 xs) = x + sumatoria xs + 1 + length + xs
≡{Aritmetica, cancelo 1 y x}
	sumatoria(sumar1 xs) = sumatoria xs + length + xs
≡{Hipotesis inductiva.}
	    True


--b) 
   

duplica :: [Int] -> [Int]
duplica [] = []                         1
duplica (x:xs) = (x * 2) : duplica xs   2

    sumatoria :: [Int] -> Int   
sumatoria [] = 0                          3
sumatoria (x : xs) = x + sumatoria xs     4

 sum (duplica xs) = 2 * sum xs

 --1) Caso base

  sumatoria (duplica []) = 2 * sumatoria []
={Caso base 1 y 3}
  sumatoria [] = 2 * []
={Sumatoria caso base}
  0 = 0

  --2) Planteo de Hi

  sumatoria (duplica xs) = 2 * sumatoria xs

  --3) Demuestro que vale para P(x:xs)

  sumatoria (duplica x:xs) = 2 * sumatoria x:xs
={Def. Duplica caso 2}
    sumatoria ((x * 2) : duplica xs) = 2 * sumatoria x:xs
={Def. Sumatoria caso 4}
    sumatoria ((x * 2) : duplica xs) = 2 * (x + sumatoria xs)
={Def. sumatoria caso 4}
    (x * 2) + sumatoria (duplica xs) = 2 * (x + sumatoria xs)
={Distributividad de 2 *}
    (x * 2) + sumatoria (duplica xs) = 2 * x + 2 * sumatoria xs
={tachado de 2 * x + }
   sumatoria (duplica xs) =  2 * sumatoria xs
={Valido por HI}

--c 

Length :: [a] -> Int
Length [] = 0                           1
Length ( _ : xs) = 1 + Length xs        2

duplica :: [Int] -> [Int]
duplica [] = []                         3
duplica (x:xs) = (x * 2) : duplica xs   4


    length (duplica xs) = length xs

--1) Caso base, xs = []

  length (duplica []) = length []
={Def. Caso base duplica y length 1 3}
  length (0) = 0
={Def. Caso base de legnth 1}
  0 = 0

--2) Hipotesis inductiva 

  length (duplica xs) = length xs

--3) Demuestro que vale para P (x:xs)

  length (duplica x:xs) = length x:xs
={Def. Caso recursivo duplica 4}
  length ((x * 2) : duplica xs) = length x:xs
={Def. caso recursivo length xs}
  length ((x * 2) : duplica xs) = 1 + Length xs
={Def. Caso recursivo de length}
    1 + Length (duplica xs) = 1 + Length xs
={Tachado}
    Length (duplica xs) = Length xs

{-
12. 
-}

sumatoria :: [Int] -> Int   
sumatoria [] = 0                          1
sumatoria (x : xs) = x + sumatoria xs     2

quitarCeros :: [Int] -> [Int]
quitarCeros [] = []                     3
quitarCeros (x:xs)            
| x /= 0 = x:quitarCeros xs             4
| x == 0 = quitarCeros xs               5

sum (quitarCeros xs) = sum xs

--1) caso base, xs = []

  sum (quitarCeros []) = sum [] 
={Caso base, 1}
  sum (quitarCeros []) = 0 
={Caso base, quitarCeros 3}
  sum ([]) = 0
={Caso base, 1}
  0 = 0 

  True

--2) Hipotesis inductiva

  sum (quitarCeros xs) = sum xs

--3) Paso inductivo, demuestro que vale para P (x:xs)

  sum (quitarCeros x:xs) = sum x:xs
={Caso recursivo 2 sumatoria}
  sum (quitarCeros x:xs) = x + sumatoria xs 
={Caso recursivo, quitar 0, que se divide en 2}

  --Caso 4)

  sum (quitarCeros x:xs) = x + sum xs 
={Caso recursivo 4} 
  sum (x : quitarCeros xs) = x + sum xs 
={Caso recursivo de sum }
  x + sum xs = x + sum xs 
={Hipotesis inductiva}
  x + sum (quitarCeros xs) = x + sum xs 
={Tachado de x +}
  sum (quitarCeros xs) = sum xs 


  True por HI

  --Caso 5)
  sum (quitarCeros xs) = x + sum xs 
={Caso recursivo quitar0}
  x + sum xs = x + sum xs 
={HI}
  x + sum (quitarCeros) = x + sum xs
={Tachado 0}
  sum (quitarCeros) = sum xs


--14
sumatoria :: [Int] -> Int   
sumatoria [] = 0                          1
sumatoria (x : xs) = x + sumatoria xs     2

:: [Int] -> [Int] -> [Int]
(++) [ ] ys = ys
(++) (x:xs) ys = x : (xs ++ ys       

  sum (xs ++ ys) = sum xs + sum ys

Caso base, xs = []
  sum ([] ++ ys) = sum [] + sum ys
={Concat a lista vacia}
  sum (ys) = sum ys 

  Igualdad True 

--2) Planteo de HI

    sum (xs ++ ys) = sum xs + sum ys

--3) Paso inductivo, muestro que vale para P(x:xs)

sum ((x:xs) ++ ys) sum (x:xs) + sum ys
≡{def. de el paso inductivo xs = x:xs, ys = ys}
	sum ( x : (xs ++ ys)) = x : (xs ++ ys) + sum ys
≡{def. de caso recursivo de ++ y sum x=x xs= xs ++ ys}
	x + sum xs ++ ys = x + sum xs + sum ys
≡{def. def de sum media rara xd}
	sum xs ++ ys = sum xs + sum ys
≡{HI}

--13

(++) :: [Int] -> [Int] -> [Int]
(++) [ ] ys = ys                          1
(++) (x:xs) ys = x : (xs ++ ys)           2

soloPares [] = []                             3
soloPares (x:xs)
| mod x 2 == 0 = x:(soloPares xs)             4
| mod x 2 /= 0 = soloPares xs                 5

  soloPares (xs ++ ys) = (soloPares xs) ++ (soloPares ys)

--1) Caso base, xs = []

    soloPares ([] ++ ys) = (soloPares []) ++ (soloPares ys)
={Caso base de ++ 1}
    soloPares (ys) = (soloPares []) ++ (soloPares ys)
={Caso base de soloPares [] 3}
    soloPares(ys) = [] ++ (soloPares ys)
={Caso 1 de ++ }
    soloPares(ys) = soloPares ys 

--2)  Planteo de hipotesis indutiva
    soloPares (xs ++ ys) = (soloPares xs) ++ (soloPares ys)

--3) Paso inductivo, demuestro que vale para P(x:xs)

    soloPares (x:xs ++ ys) = (soloPares x:xs) ++ (soloPares ys)
  ={Caso recursivo 2  de ++}
    soloPares (x : (xs ++ ys) ) = (soloPares x:xs) ++ (soloPares ys)
    

Divido en 2 casos, ya que se trata de 2 casos.

  --Caso de 4)
    soloPares (x : (xs ++ ys) ) = (soloPares x:xs) ++ (soloPares ys)
  ={Caso recursivo 4}
       x:(soloPares (xs ++ ys)) = (soloPares x:xs) ++ (soloPares ys)
  ={Caso recursivo 4}
      x:(soloPares (xs ++ ys)) = x:(soloPares xs) ++ (soloPares ys)
  ={Tachado de x:}
      soloPares (xs ++ ys) = (soloPares xs) ++ (soloPares ys)

  --Caso de 5)
    soloPares (x : (xs ++ ys) ) = (soloPares x:xs) ++ (soloPares ys)
  ={Caso recursivo 5 }
    soloPares (xs ++ ys) = (soloPares x:xs) ++ (soloPares ys)
  ={Caso recursivo 5}
    soloPares (xs ++ ys) = soloPares xs ++ (soloPares ys)
  ={HI}


https://docs.google.com/document/d/1H2DJuIOqFwgTf3Jwhs6-sXgQoBeDGpgwAMv80j1__bU/edit


https://docs.google.com/document/d/1Ya7mdH0dZUu-OVe_sRUPVZUdL4FNvfmlJR9mA7fSiYE/edit

{-
Parciales. 
-}

Simulacro de Parcial 1 - Introducci ́on a los Algoritmos - 13 de abril de 2024
https://drive.google.com/file/d/1a3ZkJAIkSS3oTYyx96h8p0FbjQCpT1sH/view
Correcion: 
file:///C:/Users/aikeb/Desktop/facultosa/Primer%20a%C3%B1o/Primer%20Cuatrimestre/Intr.%20Algoritmos/Soluci%C3%B3n%20de%20simulacro%20-%20parcial%201.pdf

{-
1. (a) Defina la funci ́on recursiva concatenarTernas :: [(String, String, String)] → [String], que
toma una lista de ternas de cadenas y devuelve una lista de cadenas donde cada elemento
de la terna se concatena y se devuelve como una sola cadena.
Ayuda: puede usar (sin definir) la funci ́on ++ .
-}
--1

concatenarTernas :: [(String, String, String)] -> [String]
concatenarTernas [] = []                                                1
concatenarTernas ((x,y,z):xs) = (x ++ y ++ z) : concatenarTernas xs     2

--2. Evaluacion manual
  concatenarTernas [(“ho”,”l”,”a”),(“p”,”ep”,”e”)]

  concatenarTernas [(“ho”,”l”,”a”),(“p”,”ep”,”e”)]
={Definicion en terminos de constructores}
  concatenarTernas (“ho”,”l”,”a”):[(“p”,”ep”,”e”)]
={Matcheo en caso 2}
  ("ho" ++ "l" ++ "a") : concatenarTernas [(“p”,”ep”,”e”)]
={Def. Concatenar}
  ("Hola") : concatenarTernas [(“p”,”ep”,”e”)]
={Def. En terminos de constructores}
  ("Hola") : (concatenarTernas (“p”,”ep”,”e”):[])
={Matcheo caso 2 }
  ("Hola") : ((“p” ++ ”ep” ++ ”e”) : concatenarTernas [])
={Def. Concatenar (++)}
  ("Hola") : (("pepe") : concatenarTernas [])
={Caso base 1}
    ("Hola") : ("pepe") : []
={Def. de :}
     ["Hola", "pepe"]
     

{-
2. (a) Defina una funci ́on llamada divisoresDeN :: Int → [Int] → Bool que dada un entero n y una

lista de enteros, verifica si todos los elementos de la lista son divisores de n. Si todos los ele-
mentos son divisores de n, la funci ́on debe devolver True. De lo contrario, debe devolver False.

Ejemplo: divisoresDeN 10 [2, 3] devuelve False. divisoresDeN 10 [2, 5] devuelve True.
-}

divisoresDeN :: Int -> [Int] -> Bool
divisoresDeN n [] = True                                  1
divisioresDeN n (x:xs) | mod n x /= 0 = False             2
                       | otherwise = divisioresDeN n xs      3

--b) Evaluacion manual en divisoresDeN 10 [2, 5]

  divisoresDeN 10 [2, 5]
={Notacion en terminos de constructores}
  divisoresDeN 10 2:5:[]
={Matcheo caso 3}
  divisioresDeN 10 5:[]
={Matcheo caso 3}
  divisioresDeN 10 []
={Matcheo caso 1 (base)}
  True 

--3) Dadas las siguientes funciones

soloPares :: [Int] -> [Int]
soloPares [] = [] -- (1)
soloPares (x:xs)
| mod x 2 == 0 = x : soloPares xs -- (2)
| mod x 2 /= 0 = soloPares xs -- (3)

triplica :: [Int] -> [Int]
triplica [] = [] -- (4)
triplica (x:xs) = 3*x : triplica xs -- (5)


length :: [a] -> Int
length [] = 0 -- (6)
length (x:xs) = 1 + length xs -- (7)

length (soloPares xs) = length (soloPares (triplica xs))

--1) Caso base xs = []

  length (soloPares []) = length (soloPares (triplica []))
={Caso base de soloPares y Triplica}
  length ([]) = length (soloPares [])
={Caso base de length y soloPares}
  0 = length ([])
={Caso base de length}
  0 = 0

--2) Planteo de la Hipotesis inductiva

length (soloPares xs) = length (soloPares (triplica xs))

--3) 

  length (soloPares x:xs) = length (soloPares (triplica x:xs))
={Caso recursivo Triplica}
  length (soloPares x:xs) = length (soloPares (3*x : triplica xs))

Divido ahora en 2 casos por SoloPares que toma 2 casos extra

--Caso  de 2)

    length (soloPares x:xs) = length (soloPares (3*x : triplica xs))
={Caso 2 de SoloPares x:xs}
    length (x: soloPares xs) = length (soloPares (3*x : triplica xs))
={Caso 7 de length}
    1 + length (soloPares xs) = length (soloPares (3*x : triplica xs))
={Caso 2 soloPares}
    1 + length (soloPares xs) = length (3*x : soloPares (triplica xs))
={Uso de HI}
    1 + length (soloPares (triplica xs)) = length (3*x : soloPares (triplica xs))
={Caso recursivo de Lenght en 7}
    1 + length (soloPares (triplica xs)) = 1 + length (soloPares (triplica xs))
={Tachado de 1 +}
    length (soloPares (triplica xs)) = length (soloPares (triplica xs))
={Hi}
    length (soloPares xs) = length (soloPares (triplica xs))
={Valido por HI}
      True 

--Caso de 3)
    length (soloPares x:xs) = length (soloPares (3*x : triplica xs))
  ={Caso 3 de SoloPares}
    length (soloPares xs) = length (soloPares (3*x : triplica xs))
  ={Caso 3 de SoloPares}
    length (soloPares xs) = length (soloPares (triplica xs))
  ={Valido por HI}
      True 


--https://docs.google.com/document/d/1yCawd_814Ow9Kcp5ufcvkvWhZClXyNk9DjjLybtBSI4/edit
--repaso para parcial com6
--1

pesifica :: [Int] -> Int -> [Int]
pesifica [] n = []                            1
pesifica (x:xs) n = x * n : pesifica xs n     2

--b) Evaluacion manual con el ejemplo 

pesifica [2, 100, 5] 400

  pesifica [2, 100, 5] 400
={Notacion en terminos de constructores}
  pesifica 2:100:5:[] 400
={Matcheo caso 2}
  2 * 400 : pesifica 100:5:[] 400
={Aritmetica}
  800 : (pesifica 100:5:[] 400)
={Matcheo caso 2}
  800 : (100 * 400 : pesifica 5:[] 400)
={Aritmetica}
  800 : 40000 :  (pesifica 5:[] 400)
={Matcheo caso 2}
  800 : 40000 : ( 5 * 400 (pesifica [] 400))
={Aritmetica}
  800 : 40000 : ( 2000 (pesifica [] 400))
={Caso base 1}
  800 : 40000 : 2000 : [] 
={construccion de lista}
  [800, 40000, 2000]

--2
--a)

cuentaVacia :: [[a]] -> Int 
cuentaVacia [] = 0                                          1
cuentaVacia (xs:xss) | length xs /= 0 = cuentaVacia xss       2
                     | length xs == 0 = 1 + cuentaVacia xss   3

--b) Evaluacion manual

cuentaVacia [[2,3], [], [1], []] = 2

  cuentaVacia [[2,3], [], [1], []]
={notacion en terminos de constructores}
  cuentaVacia [2,3]:[[],[1],[]]
={Matcheo caso 2}
  cuentaVacia [[],[1],[]]
={Notacion en terminos de constructores}
  cuentaVacia []:[,[1],[]]
={Matcheo caso 3}
  1 + cuentaVacia [[1],[]]
={Notacion en terminos de constructores}
  1 + cuentaVacia [1]:[[]]
={Matcheo caso 2}
  1 + (cuentaVacia [[]])
={Notacion en terminos de constructores}
  1 + (cuentaVacia []:[])
={Matcheo caso 3}
  1 + (1 + cuentaVacia [])
={Matcheo caso base}
  1 + 1 + 0
={Aritmetica}
  2


--3)

checkMayor :: [(Int, Int)] -> [Bool]
checkMayor [] = []                                                1
checkMayor ((x,y): xs) | (x>y) = True : (checkMayor xs)           2
                       | (x<=y) = False : (checkMayor xs)         3

length :: [a] -> Int
length [] = 0                                                     4
length (x:xs) = 1 + length xs                                     5

length (checkMayor xs) = length xs 

--1) Caso base xs = []

  length (checkMayor []) = length [] 
={Caso base de CheckMayor 1}
  length ([]) = length []
={Caso base de length de 4}
  0 = 0

--2) Hipotesis inductiva 
  lenght (checkMayor xs) = length xs 

--3) Paso inductivo, demuestro que vale para P(x:xs)
    lenght (checkMayor (x,y):xs) = length (x,y):xs 
  ={Caso recursivo de length}
    length (checkMayor (x,y):xs) = 1 + length xs 
  
  Como checkMayor se divide en 2 casos hago 2 casos

--Caso 2) x>y 

    length (checkMayor (x,y):xs) = 1 + length xs 
  ={Caso 2 checkMayor }
    length (True : (checkMayor xs)) = 1 + length xs 
  ={Caso recursivo length 5}
    1 + length (checkMayor xs) = 1 + length xs 
  ={Cancel de 1+ y valido por HI}
    length (checkMayor xs) = length xs 

--Caso 3) x<=y

    length (checkMayor (x,y):xs) = 1 + length xs 
  ={Caso 3 recursivo de checkMayor xs}
    length (False : (checkMayor xs)) = 1 + length xs 
  ={Caso recursivo de length }
    1 + length (checkMayor xs) = 1 + length xs 
  ={Cancelo de 1+ }
    length (checkMayor xs) = length xs 
  ={Valido por HI}

--Parcial 2017 
--1a)

chequearSuma :: [(Int, Int, Int)] -> Bool 
chequearSuma [] = True                  1
chequearSuma ((x, y, z):xs) 
  | x + y == z = chequearSuma xs            2
  | otherwise  = False                      3

--b)
  lista inventada lol 
  chequearSuma [(1,2,3)]

  chequearSuma [(1,2,3)]
={Notacion en constructor de listas}
    chequearSuma (1,2,3):[]
={Caso 2, x = 1, y = 2, z = 3}
    1 + 2 == 3 = chequearSuma []
={Caso base}
  True 


--2) 
duplica :: [Int] -> [(Int, Int)]
duplica [] = []                             1
duplica (x:xs) = (x, x) : duplica xs        2 

  duplica [3,7]
={Notacion en terminos de constructores}
  duplica 3:7:[]
={Caso 2}
  (3, 3) : duplica 7:[] 
={Caso 2}
  (3, 3) : ((7,7) duplica [])
={Caso base 1}
  (3,3) : (7,7) : []
={Coso}
  [(3,3), (7,7)]

--4) las inducciones son raras, paso, no las entiendo

-- Parcial 2018 
--1 a

esMultiplo :: [(Int, Int)] -> Bool
esMultiplo [] = True                                          1
esMultiplo ((x,y): xs) | mod x y == 0 = esMultiplo xs       2 
                       | mod x y /= 0 = False                         3

  esMultiplo [(9,27)]
--b Hago evaluacion manual

  esMultiplo [(9,27)]
={Notacion en terminos de consturcotres }
  esMultiplo (9,27):[]
={Caso 2}
  mod 9 27 == 0 esMultiplo []
={Caso base}
  True 

--2) 

--Definir la funicion recursiva dividir :: [(Int, Int)] -> [(Int, Int)]
--que dada una lista de pares de numeros, constriye una lista de pares con los repsectivos cociente y resto de cada par

dividir :: [(Int, Int)] -> [(Int, Int)]
dividir [] = []
dividir ((x, y):xs) = (x `div` y, x `mod` y) : dividir xs

--Parcial 2019

--1

esCumple :: [(Int, Int, Int)] -> [(Int, Int, Int)] -> Bool 
esCumple  [] [] = True                                                              1
esCumple ((x,y,z):xs) ((a,b,c):ys) = (x  == a) && (y == b) && esCumple xs ys        2

  esCumple[(21,12,2006)] [(21,12,2024)]
={Notacion en terminos de constructores}
  esCumple (21,12,2006):[] (21,12,2024):[]
={Caso 2}
  (21 == 21) && (12 == 12) && esCumple [] [] 
={Caso base}
  True 

--2 Maximopar

maximoPar [(Int, Int)] -> [Int] 
maximoPar [] = []                                 1
maximoPar ((x,y):xs) = max x y : maximoPar xs     2

--b) evaluacion manual

maximoPar [(3, -5), (0,1), (7,12)] = [3,1,12]

  maximoPar [(3, -5), (0,1), (7,12)]
={Notacion en terminos de constructores}
  maximoPar (3, -5):(0,1):(7,12):[]
={Caso 2}
  max (3, -5) : maximoPar (0,1): (7,12):[]
={Notacion en terminos de constructores y funcion Max}
  3 : ( maximoPar (0,1): (7,12):[])
={Caso 2}
  3 : (max (0,1) : maximoPar  (7,12):[])
={Notacion en terminos de constructores y funcion Max}
  3 : 1 (maximoPar  (7,12):[])
={Caso 2}
  3 : 1 (max (7,12) : maximoPar [])
={Caso base, funcion max}
  3 : 1 : 12 : []
={Notacion}
  [3,1,12]

--4) Induccion

aprueba1 :: [Int] -> [Bool]
aprueba1 [] = []                                        1
aprueba1 (x:xs) | (x>=50) = True : (aprueba1 xs)        2
               | (x<70) = False : (aprueba1 xs)       3

aprueba2 :: [Int] -> [Bool] 
aprueba2 [] = []                                        4
aprueba2 (x:xs) = (x>=50) : (aprueba2 xs)                 5

aprueba1 xs = aprueba2 xs 

--1) Caso base xs = []

  aprueba1 [] = aprueba2 [] 
={Caso base de aprueba 1 y2}
  [] = []
={Valido}

--2) Hipotesis inductiva

  aprueba1 xs = aprueba2 xs 

--3) Paso inductivo, demuestro que vale para P(x:xs)

  aprueba1 x:xs = aprueba2 x:xs 
={caso recursivo 5}
  aprueba1 x:xs = (x>=50) : (aprueba2 xs)

Como aprueba 1 se separa en 2 casos, separo

--caso 2)

  aprueba1 x:xs = (x>=50) : (aprueba2 xs)
={Caso recursivo 2}
  (x>=50) = True : (aprueba1 xs) = (x>=50) : (aprueba2 xs)
={Neutro de True} 
  (x>=50) : (aprueba1 xs) = (x>=50) : (aprueba2 xs)
={Tachado de x>=50, y valido por HI}
    (aprueba1 xs) = (aprueba2 xs)

    otra opcion (creo) : 

={Caso recursivo 2}
  (x>=50) = True : (aprueba1 xs) = (x>=50) : (aprueba2 xs)
={HI}
  (x>=50) = True : (aprueba2 xs) = (x>=50) : (aprueba2 xs)
={una conmutatividad}
  (x>=50) : (aprueba2 xs) = (x>=50) : (aprueba2 xs)  = True 
  
  --caso 3

  aprueba1 x:xs = (x>=50) : (aprueba2 xs)
={Caso recursivo 3}
  (x<70) = False : (aprueba1 xs) = (x>=50) : (aprueba2 xs)
={Conmutatividad} 
  (x<70): (aprueba1 xs) = (x>=50) : (aprueba2 xs)  = False  

  creeria q es asi :p

--Parcial 2020

--1)

noPasa :: [Int] -> Int -> [Int]
noPasa [] n = []                                    1
noPasa (x:xs) n | x /= n = x : noPasa xs n                  2 
                | x == n = noPasa xs n                        3

--b Evaluacion manual

noPasa [3,2,3] 3 = 2

  noPasa [3,2,3] 3 
={Notacion de constructores}
  noPasa 3:2:3:[] 3 
={Caso 3}
  3 == 3 = noPasa [2,3] 3
={Caso 2}
  2 /= 3 = 2 : noPasa [3] 3
={Caso 3}
  2 : (3 == 3 =  noPasa [] 3)
={Caso base}
  2: []
={coso}
 [2]

--2)

  suma3 :: [Int] -> [Int]
  suma3 [] = []                                     1   
  suma3 (x:xs) = (x+3) : (suma3 xs)              2

  sum :: [Int] -> Int 
  sum [] = 0                                      3
  sum (x:xs) = x + sum xs                         4

  Length :: [a] -> Int
  Length [] = 0                             5
  Length (x : xs) = 1 + Length xs        6

  sum(suma3 xs) = 3 * length xs + sum xs 

  --1) Caso base xs = []

  sum (suma3 []) = 3 * length [] + sum []
={Caso base de sum y suma 3}
  sum [] = 3 * 0 + []
={Caso base de [] y aritmetica}
  0 = 0

  --2) Hipotesis inductiva 

    sum(suma3 xs) = 3 * length xs + sum xs 

  --3) Paso inductivo, demuestro que vale para P(x:xs)

      sum(suma3 x:xs) = 3 * length x:xs + sum x:xs 
    ={Caso recursivo de suma3}
      sum((x+3) : (suma3 xs)) = 3 * length x:xs + sum x:xs 
    ={Caso recursivo de sum 4}
      sum((x+3) : (suma3 xs)) = 3 * length x:xs + x + sum xs
    ={Caso recursivo de length en 6}
      sum((x+3) : (suma3 xs)) =  3 * 1 + Length xs + x + sum xs
    ={Aritmetica}
      sum((x+3) : (suma3 xs)) =  3 + Length xs + x + sum xs
    ={Caso recursivo de sum}
      (x+3) + sum (suma3 xs) =  3 + Length xs + x + sum xs
    ={Conmutatividad }
      (x+3) + sum (suma3 xs) =  3 + x + Length xs + sum xs
    ={HI}
      (x+3) + sum (suma3 xs) =  3 + x + sum (suma3 xs)
    ={Tachado}
      sum (suma3 xs) =  sum (suma3 xs)
    ={HI}
      sum (suma3 xs) =  3 * length xs + sum xs
    

---Parcial 2016

dosIguales :: Eq a [(a, a, a)] -> Bool 
dosIguales [X] = True                                          1
dosIguales ((x,y,z):xs) | (x==y) || (x==z) = dosIguales xs      2
                        | (y==z) = dosIguales xs                    3
                        | otherwise = False                     4
                
--Evaluacion manual dosIguales [(1,2,3)]

  dosIguales [(1,2,3)]
={Notacion en terminos de constructores}
  dosIguales (1:2:3)[]
={Caso 4}
  False 

--Evaluacion manual dosIguales [(1,2,2)]
  dosIguales [(1,2,2)]
={Notacion en terminos de constructores}
  dosIguales (1:2:2)[]
={Caso 3}
  dosIguales  2 == 2 = dosIguales [1]
={Caso base}
  True 

--2) 

sumaPares [(Int, Int)] -> [Int] 
sumaPares [] = []                                       1
sumaPares ((x,y):xs) = (x + y) : sumaPares xs                 2

--Evaluacion manuakl con sumaPares [(3,4),(1,13),(2,2)]

  sumaPares [(3,4),(1,13),(2,2)]
={Notacion en terminos de constructores}
 sumaPares  (3,4):(1,13):(2,2):[]
={Caso 2 sumaPares}
  3 + 4 : sumaPares (1,13):(2,2):[]
={Airmetica y notacion en constructores}
  7 : (sumaPares (1,13):(2,2):[])
={Caso 2 sumaPares}
  7 : ((1 + 13) sumaPares (2,2):[])
={Aritmetica y notacion en constructores}
  7 : ((14) : sumaPares (2,2):[])
={Caso 2 sumaPares}
  7 : 14 : (2+2 : sumaPares [])
={Aritmetica y caso base}
  7 : 14 : 4 : []
={Construccion de lista}
  [7,14,4]

--3) 

cuantos :: Int -> [Int] -> Int 
cuantos n [] = 0                                  1
cuantos n (x:xs) | n == x = 1 + cuantos n xs      2 
                 | otherwise = cuantos n xs             3

--b) Evaluacion manual
cuantos 1 [1,1,2,1] = 3

  cuantos 1 [1,1,2,1] 
={Notacion en terminos de constructores}
  cuantos 1 1:1:2:1:[]
={Caso 2}
  1 == 1 = 1 + cuantos 1 1:2:1[]
={Notacion en terminos de consturcotres }
  1 + (cuantos 1 1:2:1:[])
={Caso 2}
  1 + (1 == 1 = 1 + cuantos 1 2:1[])
={Notacion en terminos de consturcotres}
 1 + 1 + (cuantos 1 2:1[])
={caso 3} 
  1 + 1 + (cuantos 1 1:[])
={Caso 2 }
  1 + 1 + (1 == 1 = 1 + cuantos 1 [])
={Caso base}
  1 + 1 + 1 + 0 
={Aritmetica }
  3

--Parcial 2017 

--3 

noAparece :: Char -> [Char] -> Bool
noAparece _ [] = True                         1
noAparece n (x:xs)                
  | n == x    = False                   2 
  | otherwise = noAparece n xs                3


--b Evaluacion manual

noAparece "z" "Famaf" = True 
  noAparece "z" ["Famaf"]
={Notacion en terminos constructores}
  noAparece "z" 'f':'a':'m':'a':'f':[]
={caso 3}
  noAparece z 'a':'m':'a':'f':[]
={caso 3}
  noAparece z 'm':'a':'f':[]
={caso 3}
  noAparece z 'a':'f':[]
={caso 3}
  noAparece z 'f':[]
={caso 3}
  noAparece z []
={Caso base }
  True 


--2)

siguientes : [Int] -> [(Int, Int)]
siguientes [] = []                              1
siguientes (x:xs) = (x, x + 1) : siguientes xs  2

--b) evaluacion manual

  siguientes [11,7]
={Notacion en terminos constructores}
  siguientes 11:7:[]
={Caso 2}
  (11, 11 + 1) : siguientes 7:[] 
={Aritmetica y notacion en terminos de constructroes}
  (11,12) : (siguientes 7:[])
={Caso 2}
  ((11,12) : (7, 7+1) : siguientes [])
={caso base, aritmetica}
  (11,12) : (7,8) : []
={Construccion de lista}
  [(11,12), (7,8)]

--1 

distancia [(Int, Int)] -> Int
distancia [] = 0
distancia ((x,y): xs) =  abs (x - y) + distancia xs 

--Parcial 2021

pegarEn3 :: [(String, String)] -> [(String, String, String)]
pegarEn3 [] = []                                                       1 
pegarEn3 ((x,y): xs) = (x,y, x ++ y) : pegarEn3 xs                         2  

pegarEn3 [("ab", "cd"), ("fg", "hi")]

--b) evaluacion manual

  pegarEn3 [("ab", "cd"), ("fg", "hi")]
={notacion en terminos constructores}
  pegarEn3 ("ab", "cd"):("fg", "hi"):[]
={caso 2 pegarEn3}
  ("ab","cd", "ab" ++ "cd") : pegarEn3 ("fg", "hi"):[]
={Func. Concatenar. Notacion en terminos constructores}
  ("ab","cd", "abcd") : (pegarEn3 ("fg", "hi"):[])
={Caso 2 pegarEn3}
  ("ab","cd", "abcd") : (("fg", "hi", "fg" ++ "hi") : pegarEn3 [])
={Funcion concatenar y caso base }
  ("ab","cd", "abcd") : ("fg", "hi", "fghi") :[]
={construccion}
   pegarEn3 [("ab", "cd"), ("fg", "hi")]


cocientes :: Int -> [Int] -> [Int]
cocientes n [] = []
cocientes n (x:xs) = (x `div` n) : cocientes n xs 


--3 induccionn

concatena :: [[a]] -> [a]
concatena [] = [] --- (1)
concatena (xs:xss) = xs ++ (concatena xss) --- (2)

sum :: [Int] -> Int
sum [] = 0 --- (3)
sum (x:xs) = x + sum xs --- (4)

cuenta :: [[Int]] -> Int
cuenta [] = 0 --- (5)
cuenta (xs:xss) = (sum xs) + (cuenta xss) --- (6)

--demuestre por inducci´on la siguiente propiedad

sum (concatena xss) = (cuenta xss)

--1 Caso base, xss = []

  sum (concatena []) = (cuenta [])
={Caso base concatena y cuenta}
  sum ([]) = 0
={caso base sum 3}
  0 = 0

--2) Hipotesis inductiva

  sum (concatena xss) = (cuenta xss)

--3) Paso indcutivoi, demuestro que vale para p(xs:xss)

  sum (concatena xs:xss) = (cuenta xs:xss)
={Caso recursivo de concatena (2)}
    sum (xs ++ (concatena xss)) = (cuenta xs:xss)
={Caso recursivo de cuenta 6}
    sum (xs ++ (concatena xss)) = (sum xs) + (cuenta xss)
={por sum caso 4}
    sum(xs) + sum(concatena xss) = (sum xs) + (cuenta xss)
={Hi}
    sum(xs) + (cuenta xss) = (cuenta xss)


--5) 

sacaUnos :: [Int] -> [Int]
sacaUnos [] = []                                  1
sacaUnos (x:xs) | x == 1 = sacaUnos xs            2 
                | x != 1 = x :( sacaUnos xs)          3   

productoria :: [Int] -> Int 
productoria [] = 1                                4
productoria (x:xs) = x * (productoria xs)             5

  productoria (sacaUnos xs) = productoria xs 

--1C Caso base xs = []
   productoria (sacaUnos []) = productoria [] 
={Caso base de sacaUnos 1 }
  productoria ([]) = productoria []
={Caso base de productoria}
  1=1

--2) Hipotesis inductiva 
  productoria (sacaUnos xs) = productoria xs 

--3) Paso indutivo, demuestro que vale para P(x:xs)

    productoria (sacaUnos x:xs) = productoria x:xs 
={Caso recursivo de productoria caso 5}
    productoria (sacaUnos x:xs) = x * (productoria xs)

Divido en 2 casos ya que sacaUnois tiene dos casos

caso 2) 
    productoria (sacaUnos x:xs) = x * (productoria xs)
={Caso 2 }
      productoria (sacaUnos xs) = x * (productoria xs)
={Caso 5 }
     x * (productoria (sacaUnos xs)) = x * (productoria xs)
={Tachado}
    (productoria (sacaUnos xs)) = (productoria xs)
={valido por HI}


caso 3)

    productoria (sacaUnos x:xs) = x * (productoria xs)
={Caso 3}
        productoria (x : (sacaUnos xs)) = x * (productoria xs)
={Caso 5 productoria}
    x * productoria (sacaUnos xs) = x * (productoria xs)
={Tachado de x *}
  productoria (sacaUnos xs ) = productoria xs
={Valido por HI }

--parcial 2023

dolariza :: [Int] -> Int -> [Int]
dolariza [] n = []                              1
dolariza (x:xs) n = x / n : dolariza xs n       2

PUSE MULTIPLICACION EN VEZ DE DIVISON AIOUJSDHQWIOJU 

--b) evaluacion manual

  dolariza [400,2000,10000] 400
={Notacion en terminos de constructores}
  dolariza 400:2000:10000:[] 400
={Matcheo caso 2} 
  300 / 400 : dolariza 2000:10000:[] 400
={Aritmetica, notacion en terminos consturctores}
  7000 : (dolariza 2000:10000:[] 400)
={Matcheo caso 2}
  7000 : (2000 / 400 : dolariza 10000:[] 400)
={Aritmetica, notacion en terminos consturcotres}
  7000 : (8000 :( dolariza 10000:[] 400))
={Matcheo caso 2}
  7000 : (8000 : (10000 / 400) dolariza [] 400)
={Aritmetica y notacion en terminos constructores}
  7000 : (8000 : (40000) dolariza [] 400)
={Caso base}
  7000 : 8000 : 40000 : []
={Notacion}
  [7000,8000,40000]


topes :: [[a]] -> [a]
topes [] = []
topes (xs:xss) | lenght xs /= 0 = head xs : topes xss
               | length xs == 0 = topes xss 

--3

contarOtros :: [Int] -> Int
contarOtros [] = 0
contarOtros (x:xs) | x == 0 = contarOtros xs 
                   | x /= 1 + contarOtros xs  

contarCeros :: [Int] -> Int 
contarCeros [] = 0 
contarCeros (x:xs) | x == 0 = 1 + contarCeros xs 
                   | x /= 0 = contarCeros xs +

length :: [Int] -> Int 
length [] = 0
length (x:xs) = 1 + length xs

contarCeros xs = length xs - contarOtros xs 

--Caso base xs = []

  contarCeros[] = length[] - contarOtros []
={Caso base de contarCeros }
  0 = length [] - 0
={Caso base length }
  0 = 0 

--Hipotesis inductiva

contarCeros xs = length xs - contarOtros xs 

--Paso inductivo, demuestro que vale para P(x:xs) 

  contarCeros x:xs = length x:xs - contarOtros x:xs   
={Caso 7 de length}
  contarCeros x:xs = 1 + length xs - contarOtros x:xs   

Como veo que hay 2 casos en 2 codigos distintos, debo hacer 4 casos separados 

--1) Caso de 2 con 5

  contarCeros x:xs = 1 + length xs - contarOtros x:xs   
={Caso recursivo contarOtros 2}
  contarCeros x:xs = 1 + length xs - contarOtros xs 
={ContarCeros caso 5}
  1 + contarCeros xs = 1 + length xs - contarOtros xs 
={Tachado de 1 +}
  contarCeros xs = length xs - contarOtros xs 
={Valido por HI}

--2) Caso de 2 con 6

  contarCeros x:xs = 1 + length xs - contarOtros x:xs   
={Caso recursivo contarOtros 2}
  contarCeros x:xs = 1 + length xs - contarOtros xs 
={Caso recursivo contarCeros  en 6}
  contarCeros xs = 1 + length xs - contarOtros xs +
  
  ?

--3) caso de 3 con 5

  contarCeros x:xs = 1 + length xs - contarOtros x:xs     
={Caso 3 contarCeros y caso 6 de contarOtros}
  1 + contarCeros xs = 1 + length xs - 1 + contarOtros xs
={Tachado}
  contarCeros xs = 1 + length xs - contarOtros xs 
 
 ?

--4) caso de 3 con 6
  contarCeros x:xs = 1 + length xs - contarOtros x:xs     
={Caso 3 contarCeros, caso 6 contarOtros }
  1 + contarCeros xs = 1 + length xs - contarOtros xs
={Tachado 1 +} 
  contarCeros xs = length xs - contarOtros xs
={Valido por HI}


--Parcial 2024

empiezaConA :: [String] -> [String]
empiezaConA [] = []
empiezaConA (xs:xss) | xs = "" = comienzaConA xss
                     | head xs == `A` = xs : empiezaConA xss 
                     | otherwise = empiezaConA xss

aparea :: [Int] -> [(Int, Int)]
aparea [x,y]  = [(x,y)]
aparea (x:y:xs) = (x,y) : aparea  (y:xs)

--Parcial 2016

algunOrden :: [(Int, Int, Int)] -> Bool
algunOrden [] = False
algunOrden ((x, y, z) : xs)
  | (x > y && y > z) && algunOrden xs || (x < y && y < z) && algunOrden xs = True
  | otherwise = False

  algunOrden [(10, 3, 1)]
={Notacion en termnos de constructores}
  algunOrden 10:3:1[]
={Matcheo caso 2 parte izq}
  (10 > 3 && 3 > 1) && algunOrden []
={Caso 2 true}
  True 


superaNota :: Int -> [Int] -> Int 
superaNota n [] = 0                             1
superaNota n (x:xs) | x > n = 1 + superaNota n xs   2 
                    | otherwise = superaNota n xs     3

  superaNota 3 [2,3,4]
={Notacion en terminos constructores}
  superaNota 3 2:3:4:[]
={Matcheo caso 3}
  otherwise = superaNota 3 3:4[]
={Matcheo caso 3}
  otherwise = superaNota 3 4:[]
={Matcheo caso 2}
  4 > 3 = 1 + superaNota 3 []
={Caso base }
  1 + 0
={Aritmetica}
  1

empiezaConA :: [String] -> [String]
empiezaConA [] = []                                                 1
empiezaConA (xs:xss) | null xs = empiezaConA xss                    2
                   | head xs == ´A´ = xs : empiezaConA xss            3 
                   | otherwise = empiezaConA xss              4

empiezaConA ["Ana", "asado", ""] = ["Ana"]

  empiezaConA ["Ana", "asado", ""]
={Notacion en terminos constructores}
  empiezaConA "Ana":"asado":"":[]
={Matcheo caso 3}
  head xs == ´A´ = "Ana" : empiezaConA "asado":"":[]
={Matcheo caso 4}
  "Ana" : (otherwise = empiezaConA "":[])
={Matcheo caso 1}
  "Ana" : ( null "" = empiezaConA [])
={matcheo caso base}
  "Ana" : []
={construccion de lista}
  ["Ana"]

--2

aparea :: [Int] -> [(Int, Int)]
aparea [x,y] = [(x,y)]                      1
aparea (x:y:xs) = (x,y) : aparea (y:xs)     2

  aparea [1,2,3]
={Notacion en terminos de constructores}
  aparea 1:2:3:[]
={Matcheo caso 2}
  (1,2) : aparea (2:3:[])
={Matcheo caso 1}
  (1,2) : ([(2,3)])
={Construccion de listas}
  [(1,2), (2,3)]

toList :: [(Int, Int)] -> [Int] 
toList [] = []                                1
toList ((x,y):xs) = x:y:(toList xs)         2

length :: [a] -> Int 
length [] = 0                                 3
length (x:xs) = 1 + length xs                 4

length (toList xs) = 2 * (length xs)

--1) Caso base

  length (toList []) = 2 * (length [])
={Caso base de length y toList}
  length ([]) = 2 * 0
={caso base de length, y aritmetica}
  0 = 0

--2) Planteo de HI

length (toList xs) = 2 * (length xs)

--3) Paso inductivo, demuestro que vale para P(x:xs) -> Noto que toList hace uso de x,y y x,y es un solo elemento, pero debe ser implementado

  length (toList (x,y):xs) = 2 * (length (x,y):xs)
={Caso recursivo de length 4}
  length (toList (x,y):xs) = 2 * (1 + length xs)
={Caso recursivo de toList 2}
  length ((x:y):(toList xs)) = 2 * (1 + length xs)
={Caso recursivo de length}
  1 + length (toList xs ) = 2 * (1 + length xs)
={Tachado de 1}
  length (toList xs) = 2 * (length xs) 
={Valido por HI }

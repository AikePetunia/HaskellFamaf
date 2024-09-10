0)
1)-- p ∧ p ≡ p.

    p ∧ p ≡ p.
={A6 dorada}
    p = p = p v p ≡ p.
={Metateorema true}
    p = p = true = p
={igualdad de p = p, = p}
    p = true = p
={A3 verdadero neutro equiv}

b)
--p ∧ True ≡ p.

    p ∧ True ≡ p.
={A12 dorada}
    p = true = p v true = p
={Abosrbente}
    p = true = true = p
={A9 idempotencia}
    p = true = p
={verdadero por a3}

c)
--p ∧ (p ∨ q) ≡ p

    p ∧ (p ∨ q) ≡ p
={A12 dorada}
    p = p v q = p v p v q = p 
={p v p = p }
    p = p v q = p v q = p 
={tachado}
    p v q = p v q 
={Valido t1}

para q hacerlos si los hice hace 1 mes...

Lab 1)
a)--esCero :: Int -> Bool, que verifica si un entero es igual a 0.

esCero :: Int -> Bool
esCero n | n == 0    = True
         | otherwise = False

chekiado !

b)--esPositivo :: Int -> Bool, que verifica si un entero es estrictamente mayor a 0.

esPositivo :: Int -> Bool
esPositivo n | n == 0 = False
             | n > 0 = True
             | otherwise = False

chekiado !

c) --esVocal :: Char -> Bool, que verifica si un caracter es una vocal en min ́uscula.

esVocal :: Char -> Bool
esVocal c | c == 'a' = True
          | c == 'e' = True
          | c == 'i' = True
          | c == 'o' = True
          | c == 'u' = True
          | otherwise = False

chekiado !

d) ya lo hice en otra ocacion cuatri pasado

--ej 1)

xs = {Lista de figuras}. No se que tanta explicites hay que tener.
a) ⟨ ∀ i : 0 ≤ i < #xs : rojo.(xs.i) ⟩
"Para toda i en el rango del 0 a el lenght de la lista xs, hay una figura roja en algun lugar de la lista
b) ⟨ ∃ i : 0 ≤ i < #xs : rombo.(xs.i) ⟩
"Existe un i en el rango del 0 a el lenght de la lista xs, tal que es un rombo"
c) ⟨ ∃ i : 0 ≤ i < #xs : ⟨ ∃ j : 0 ≤ j < #xs : xs.i = xs.j ⟩ ⟩
"Existe un elemento i en el rango del 0 al length de la lista xs, en rango que existe un j desde 0 al length de xs tal que el elemento de xs.i es igual al elemento de xs.j"
d) ⟨ ∃ i : 0 ≤ i < #xs : ⟨ ∃ j : i < j < #xs : xs.i = xs.j ⟩ ⟩
"Existe un i, en rango de 0 al lenght de xs, en rango que existe un j que sea menor al elkemento de i hasta el lenght de xs tal que el xs.i es igual a xs.j"
e)⟨Sum i : 0 ≤ i < #xs : tam.(xs.i) ⟩
"La suma de los elemenots de i en el rango de 0 al length de xs, en termino de la suma es el tamaño de xs.i" (?)

2. Escribi formulas para las siguientes expresiones en lenguaje natural.

a) Todas las figuras de xs son amarillas.
<Ax: : amarillo.xs>

b) La suma de los tama ̃nos de todas las figuras de xs es mayor a 10.
<Sum i : 0 <= i < #.xs : tam.(xs.i) > 10>

c) Ninguna figura de xs tiene tama ̃no menor a 7.
<min i : 0 <= i < #.xs : tam.(xs.i) < 7>                            (?)

3. y lab 2.
 Para cada una de las siguientes funciones escrib ́ı una expresi ́on que las describa formalmente. Por otro
lado, escrib ́ı un programa recursivo que compute la funci ́on.

a) paratodo :: [Bool] -> Bool, que verifica que todos los elementos de una lista sean True.
<Ai : 0 <= i < #.xs: xs !! i == true>

paraTodo :: [Bool] -> Bool
paraTodo [] = True                                      --1
paraTodo (x:xs) | x == False = False                    --2
                | otherwise = paraTodo xs               --3

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

b) sumatoria :: [Int] -> Int, que calcula la suma de todos los elementos de una lista de enteros.
<Sum i : 0 <= i ^ i < length.xs : xs.i> 

sum :: [Int] -> Int
sum [] = 0                          --1
sum (x:xs) = x + sum xs             --2

chekiado !

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

prod :: [Int] -> Int
prod [] = 0                           --1
prod (x:xs) = x * prod xs             --2

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

factorial :: Int -> Int
factorial 0 = 1 
factorial n = n * factorial (n-1)

chekiado!

e) Utiliza la funci ́on sumatoria para definir, promedio :: [Int] -> Int, que toma una lista de
n ́umeros no vacia y calcula el valor promedio (truncado, usando divisi ́on entera).

<sum i : 0 <= i ^ i < length.xs : xs.i 'div' lenght.xs >

promedio :: [Int] -> Int
promedio [] = 0
promedio xs = sum xs `div` length xs

chekiado !

4. Para cada una de las siguientes f ́ormulas, describ ́ı su significado utilizando el lenguaje natural.
5. Para cada uno de los  ́ıtems del ejercicio anterior, evalu ́a la f ́ormula en las siguientes listas:
a) 
⟨∀ i : 0 ≤ i < #xs : xs.i > 0⟩
"Todo elemento de la lista xs debe ser mayor a cero"
xs = [−5, −3, 4, 8]

={Especificacion}
    ⟨ ∀ i : 0 ≤ i < #xs : xs.i > 0 ⟩
≡ {Calculo de rango, sabiendo  que #xs = 4 }    //Noto el length para el rango.
    ⟨ ∀ i : i ∈ {0, 1, 2, 3} : xs.i > 0 ⟩                  
≡ {Aplico el termino a cada elemento del rango }
    (xs.0 > 0) ∧ (xs.1 > 0) ∧ (xs.2 > 0) ∧ (xs.3 > 0)
≡ {Evaluacion de las indecciones con xs = [−5, −3, 4, 8] }
    (−5 > 0) ∧ (−3 > 0) ∧ (4 > 0) ∧ (8 > 0)
≡ {Evaluo las indecciones }
    False ∧ False ∧True ∧ True
≡ {resolucion por logica de predicados}
    False

xs = [11, 2, 5, 8]

= {Especificacion}
    ⟨∀ i : 0 ≤ i < #xs : xs.i > 0⟩
≡ {Calculo de rango, sabiendo  que #xs = 4 }        //Noto el length para el rango.
    ⟨ ∀ i : i ∈ {0, 1, 2, 3} : xs.i > 0 ⟩       
≡ {Aplico el termino a cada elemento del rango }
    (xs.0 > 0) ∧ (xs.1 > 0) ∧ (xs.2 > 0) ∧ (xs.3 > 0) // xs en posicion 1, 2, 3, ektgywijfiu etc 
≡ {Evaluacion de las indecciones con xs = [11, 2, 5, 8] }
    (11 > 0) ∧ (2 > 0) ∧ (5 > 0) ∧ (8 > 0)
={Evaluacion x digesto}
    True 


b) ⟨∃ i : 0 ≤ i < #xs : xs.i = x ⟩
"Existe un elemento i tal que hay un elemento igual"

xs = [−5, −3, 4, 8]

    ⟨ ∃ i : 0 ≤ i < #xs : xs.i = x ⟩
≡ {Calculo de rango, sabiendo  que #xs = 4 }        //Noto el length para el rango.
    ⟨ E i : i ∈ {0, 1, 2, 3} : xs.i = 0 ⟩          
≡ {Aplico el termino a cada elemento del rango }
    (xs.0 = 0) ∧ (xs.1 = 0) ∧ (xs.2 = 0) ∧ (xs.3 = 0)
≡ {Evaluacion de las indeccioness con xs = [−5, −3, 4, 8] }
    (−5 = 0) ∧ (−3 = 0) ∧ (4 = 0) ∧ (8 = 0)
={ todo false}
    False

xs = [11, 2, 5, 8]

    ⟨ ∃ i : 0 ≤ i < #xs : xs.i = x ⟩
≡ {Calculo de rango, sabiendo  que #xs = 4 }        //Noto el length para el rango.
    ⟨ E i : i ∈ {0, 1, 2, 3} : xs.i = 0 ⟩           //son 4 elementos.
≡ {Aplico el termino a cada elemento del rango }
    (xs.0 = 0) ∧ (xs.1 = 0) ∧ (xs.2 = 0) ∧ (xs.3 = 0)
≡ {Evaluacion de las indecciones con xs = [11, 2, 5, 8] }
    (11 = 0) ∧ (2 = 0) ∧ (5 = 0) ∧ (8 = 0)
={Todo false}
    False

c) ⟨ ∀ i : 0 ≤ i < #xs : ⟨ ∃ j : 0 ≤ j < #ys : xs.i = ys.j ⟩ ⟩
"Para todo elemento i desde el elemento 0 hasta el length de xs, en termino Existe un elemento j desde el elemento 0 hasta el length de xs, tal que hayan dos elementos iguales"

Desconozco si uso las dos listas, creo k si pq son 2 justamente y aca pide dos listas PD: NO LEI EL DE YS Na ya esta perdon 
xs = [−5, −3, 4, 8] y ys = [11, 2, 5, 8]

    ⟨ ∀ i : 0 ≤ i < #xs : ⟨ ∃ i : 0 ≤ i < #ys : xs.i = ys.j⟩ ⟩
≡ {Calculo de rango, sabiendo  que #xs = 4 }        //Noto el length para el rango.
    ⟨ ∀ i : i ∈ {0, 1, 2, 3} : ⟨ ∃ j : j ∈ {0, 1, 2, 3} : xs.i = ys.j⟩ ⟩           //son 4 elementos.
≡ {Aplico el termino a cada elemento del rango }
    (xs.0 = ys.0) ∧ (xs.1 = ys.1) ∧ (xs.2 = ys.2) ∧ (xs.3 = ys.3) 
≡ {Evalulo las indecciones con xs = [−5, −3, 4, 8] y ys = [11, 2, 5, 8] }
    (-5 = 11) ^ (-3 = 2) ^ ( 4 = 5) ^(8 = 8)
={Evaluo}
    false ^ false ^ False ^ True 
={coso}
    false 

d) ⟨ ∀ i : 0 ≤ i < #xs − 1 : xs.i = xs.(i + 1) ⟩
"Para todo elemento i desde el elemento 0 hasta el penultimo elemento del length de xs, en termino de que un elemento de xs.i es igual a xs.i mas uno."

xs = [−5, −3, 4, 8]

    ⟨ ∀ i : 0 ≤ i < #xs : xs.i > 0 ⟩
≡ {Calculo de rango, sabiendo  que #xs = 4 }        //Noto el length para el rango.
    ⟨ ∀ i : i ∈ {0, 1, 2, 3} : xs.i > 0 ⟩           //son 4 elementos.
≡ {Aplico el termino a cada elemento del rango }
    (xs.0 = xs.0 + 1) ∧ (xs.1 = xs.1 + 1) ∧ (xs.2 = xs.2 + 1) ∧ (xs.3 = xs.3 + 1)
={Evaluo las indecciones xs = [−5, −3, 4, 8]}
    (-5 = -4) ∧ (-3 = -2) ∧ (4 = 5) ∧ (8 = 9)
={Coso de false}
    false 

xs = [11, 2, 5, 8]
    ⟨ ∀ i : 0 ≤ i < #xs : xs.i > 0 ⟩
≡ {Calculo de rango, sabiendo  que #xs = 4 }        //Noto el length para el rango.
    ⟨ ∀ i : i ∈ {0, 1, 2, 3} - 1: xs.i > 0 ⟩       // elementos, no se como interpretar ese -1 la vdd, serian 3 elemetnos evaluado contra 4?? idk
≡ {Aplico el termino a cada elemento del rango }
    (xs.0 = xs.0 + 1) ∧ (xs.1 = xs.1 + 1) ∧ (xs.2 = xs.2 + 1) ∧ (xs.3 = xs.3 + 1)
={Evaluo las indecciones xs = [11, 2, 5, 8]}
    (11 = 12) ∧ (2 = 3) ∧ (5 = 6) ∧ (8 = 9)
={Coso de false}
    false 

Lab 3. 
a y b y c)
    La variable libre no necesariamente tiene que ser un i, j, puede ser una lista.
    a) La variable libre es xs

varA :: [Int] -> Bool   
varA [] = True                                     --1
varA (x:xs) | x == 0 = False                        --2
            | x > 0 = varA xs                          --3
            | otherwise = False                     --4

chekiado !

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



    b) La variable libre es x, xs
    x == n

varB :: Eq a => [a] -> a -> Bool
varB [] n = False                               1
varB (x:xs) n | n == x = True                   2
              | otherwise = varB xs n           3

chekiado !

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

varC :: Eq a => [a] -> [a] -> Bool
varC [] [] = True
varC _ _ = False
varC (x:xs) (y:ys) = (x == y) && varC xs ys

    d) La variable libre es xs

varD :: [Int] -> Bool
varD [] = False                                             1
varD (x:y:xs) = (x == y + 1) && varD xs                2

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

6. Escribi f ́ormulas para las siguientes expresiones en lenguaje natural.
a) Todos los elementos de xs e ys son iguales (¡ojo! ¡sujeta a interpretaci ́on!).
<Ai: 0 <= i ^ i < lenght.xs : <Aj : 0 <= j ^ j < lenght.ys : xs !! i == ys !! j>

b) Todos los elementos de xs ocurren en ys.
<Ai: 0 <= i ^ i < lenght.xs : <Aj : 0 <= j ^ j < lenght.ys : take i xs == take j xs>

c) Todos los elementos de xs ocurren en ys en la misma posici ́on.
<Ai: 0 <= i ^ i < lenght.xs : <Aj : 0 <= j ^ j < lenght.ys : drop xs i == drop ys j>

(dudo de b y c, aùn.)

7 y 8, lab 4)

Para cada una de las siguientes f ́ormulas, describ ́ı su significado utilizando el lenguaje natural.

7 a) ⟨Prod i : 1 ≤ i ≤ n : i ⟩
El producto de todos los elementos del 1 a n.

8 a)

    ⟨ ∀ i : 1 ≤ i < n : i ⟩
≡ {Implemento n = 5}
    ⟨ ∀ i : 1 ≤ i < 5 : i ⟩                           //son elementos de n
≡ { aplico el t ́ermino a cada elemento del rango }
    (1 * 2 * 3 * 4 * 5)
={aritmetica}
    120

    variable libre: n 

prod :: Int -> Int
prod n = n * prod 

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

sum :: [Int] -> Int
sum [] = 0                                          1
sum (x:xs) = x + sum xs 'div' lenght xs             2


c) ⟨Max i : 0 ≤ i < #xs : xs.i ⟩ < ⟨Min i : 0 ≤ i < #ys : ys.i ⟩
El maximo elemento en la lista xs es menor que el minimo elemento en la lista ys

    ⟨Max i : 0 ≤ i < #xs : xs.i ⟩ < ⟨Min i : 0 ≤ i < #ys : ys.i ⟩
={Imp xs y ys}
    ⟨Max i : i e  {-3, 9, 8} : xs.i ⟩ < ⟨Min i : i e {6, 7, 8} : ys.i ⟩
={Impl func. max y min.}
    max(xs.0, xs.1, xs.2) < min(xs.0, xs.1, xs.2)
={Impl. xs.i y ys.i}
    max(-3, 9, 8) < min(6, 7, 8)
={func max y min}
    9 < 6
    false

    Variable libre xs, ys

esMenorMaxQueMin :: [Int] -> [Int] -> Bool
esMenorMaxQueMin xs ys = maximum xs < minimum ys  --Asumo a maximum y minimum como funcionas ya establecidas de haskell, no las defini. Pero en todo caso serian por casos

d) ⟨ ∃ i, j : (2 ≤ i < n) ∧ (2 ≤ j < n) : i ∗ j = n ⟩
Existen 2 elementos tal que su producto es igual a n 

    ⟨ ∃ i, j : (2 ≤ i < n) ∧ (2 ≤ j < n) : i ∗ j = n ⟩
={Impl. de n}
    ⟨ ∃ i, j : (2 ≤ i < 5) ∧ (2 ≤ j < 5) : i ∗ j = 5 ⟩
={aritmeticamente, no hay un numero enero tq i * j = 5}
    False

    variable libre n

prod :: Int, Int, Int -> Bool
prod i j n | i > n = False
           | j > n = False
           | i * j == n = True
           | otherwise = False 

9)
Suponiendo que f : A → Bool es una funcion fija cualquiera, y xs : [A], caracteriz ́a con una cuantificaci ́on
la siguiente funcion recursiva:

f.x :: a -> Bool

algunof : [a] -> Bool
algunof [] = False
algunof (x:xs) = f.x || algunof xs

si me dice alguno, de entrada me doy cuenta que es un E (existe)
devuelve un bool
parece que pide que si esta en una funcion f o en algunof algun tipo de valor A (cuaql)

<E i : 0 <= i ^ i < length.xs : f(xs.i)>        (?)

10 y lab 5)

10. Definı recursivamente una funci ́on todos : [Bool] → Bool que verifica que todos los elementos de una lista
son True, es decir, que satisface la siguiente especificaci ́on:

todos.xs ≡ ⟨ ∀ i : 0 ≤ i < #xs : xs.i ⟩

todosxs :: [Bool] -> Bool 
todosxs [] = True 
todosxs (x:xs) = x && todos xs

chekiado !!

11 y lab 6)

a) n es potenica de 2

<Ax :  x pert xs : n = 2^x >

b) n es el elemento mas grande de xs

<Max n : n pert xs : n >

variable libre xs

esMaximo :: [Int] -> Bool
esMaximo [] = True 
esMaximo (x:xs) = max(xs) esMaximo xs 

chekiado !

c) El producto de los elementos pares de xs

<prod i : 0 ≤ i < length(xs) ∧ mod 2 (xs !! i) : (xs !! i)>

variable libre xs 

productoPar :: [Int] -> Int
productoPar [] = 1  
productoPar (x:xs)
                  | mod 2 x = x * productoPar xs
                  | otherwise = productoPar xs

chekiado !

d) La suma de los elementos en posicion par de xs 

<sum i : 0 <= i < length xs ^ mod 2 (xs !! i) : xs !! i >

variable libre xs

sumPar :: [Int] -> Int
sumPar [] = 0
sumPar (x:xs) | mod 2 x = x + sumPar xs 
              | otherwise = sumPar xs 

chekiado !

12) facil pero q flojera dio esMaximo --de aca para abajo no corregi mas

a) 
    <Prod i : 1 <= i <= n ^ i mod 3 = 1 : i>
={Impl. n = 10}
    <Prod i : 1 <= i <= 10 ^ i mod 3 = 1 : i>
={Aritmetica, busco los i tq mod 3 = 1}
    4, 7, 10 cumplen
={Aritmetica}
    4* 7 * 10
={aritmetica}
    280

b)

    <Sum i, j : 0 <= i < #xs ^ 0 <= j <#ys : xs.i*ys.j>
={Impl. xs = [-3, 9, 8, 9] y ys = [6,9,3]}
    <Sum i, j : 0 <= i < 4 ^ 0 <= j < 3 : xs.i * ys.j>
={uso length xs y ys, impl. i va de 0 a 4, y j de 0 a 3}
    [-3, 9, 8, 9].i * [6,9,3].j
={Impl i y j}
    [-3, 9, 8, 9].0 * [6,9,3].0 ^ [-3, 9, 8, 9].1 * [6,9,3].1 ^[-3, 9, 8, 9].2 * [6,9,3].2 ^[-3, 9, 8, 9].3 * [6,9,3].3 ^[-3, 9, 8, 9].4 * [6,9,3].4(?)
={Impl. i y j}
    -3 * 6 ^ 9 * 9 ^ 8 * 3 ^ 9
={Aritmetica y ns cuanto da}

c) 

    ⟨ ∀ i, j : 0 ≤ i < j < #xs : xs.i ̸= xs.j ⟩
={Impl. xs = [-3, 9, 8, 9] y uso length}
    ⟨ ∀ i, j : 0 ≤ i < j < 4 : xs.i ̸= xs.j ⟩
={Impl. Termino}
    [-3, 9, 8, 9].i /= [-3, 9, 8, 9].j ^[-3, 9, 8, 9].i /= [-3, 9, 8, 9].j ^[-3, 9, 8, 9].i /= [-3, 9, 8, 9].j ^[-3, 9, 8, 9].i /= [-3, 9, 8, 9].^
={Impl i y j}
    -3 /= -3 ^ 9 /= 9 ^ 8 /= 8 ^ 9 /= 9 
={Logica proposiciona}
    FALSE

d)
    <Max as, bs : xs = as ++ bs : sum.as>
={Impl de xs = [-3, 9, 8, 9]}
    <Max as, bs : [-3, 9, 8, 9] = as ++ bs : sum.as>
={Si xs = as ++ bs, entonces as = [-3, 9] y bs=[8,9]}
    <Max as, bs : [-3, 9, 8, 9] = as ++ bs : sum.[-3,9]>
={Aritmetica}
    6

e)
    ⟨Sum i : 1 ≤ i + 1 < #xs + 1 : (x ▷ xs).(i + 1) ⟩
={Impl de xs}
    ⟨Sum i : 1 ≤ i + 1 < #[-3, 9, 8, 9] + 1 : (x ▷ [-3, 9, 8, 9]).(i + 1) ⟩
={Length xs}
    ⟨Sum i : 1 ≤ i + 1 < 4 + 1 : (x ▷ [-3, 9, 8, 9]).(i + 1) ⟩
={Aritmetica}
    ⟨Sum i : 1 ≤ i + 1 < 5 : (x ▷ [-3, 9, 8, 9]).(i + 1) ⟩

creo q esta bien asi
    
    
13)

a) 
    ⟨ ∃ i : i = 3 ∧ i mod 2 = 0 : 2 ∗ i = 6 ⟩
={Rango unitario}
    ⟨ ∃ i : 3 mod 2 = 0 : 2 ∗ 3 = 6 ⟩
={Rango vacio}
    ⟨ ∃ i : False : 2 ∗ 3 = 6 ⟩
={Neutro de existe es False}    
    False

b)
    ⟨Sum i : 5 ≤ i ∧ i ≤ 5 : −2 ∗ i ⟩
={Rango unitario}
    ⟨Sum i : i = 5 : −2 ∗ 5 ⟩
={Rango unitario}
    ⟨Sum i : i = 5 : −10 ⟩
={termino de constante}
    -10

c)

    ⟨Prod i : 0 < i < 1 : 34 ⟩
={A5 Termino de constante}
    34          

d) 

    ⟨Min i : i ≤ 0 ∨ i > 10 : n ∗ (i + 2) − n ∗ i ⟩
={Deberia de ser particion de rango, pero no se puede usar. asi que}
    ⟨Min i : i = 0 v i < 0 ∨ i > 10 : n ∗ (i + 2) − n ∗ i ⟩
={Rango unitario}
    ⟨Min i : False : n ∗ (0 + 2) − 0 ∗ i ⟩
={Rango vacio}
    False

en todo caso:
Rango es i pert {-inf, -1, 0} y i pert {11, 12, inf+}

-> min primer termino es -inf, = 0
-> min segundo termino es n * (11 + 2) - n * 11

e) ⟨Max a, as : a:as = [ ] : length (as) ⟩

max length as (?) o 0


14 y 15. Aplica partici ́on de rango si es que se puede, y si no se puede, explic ́a porqu ́e.
a) ⟨Sum i : i = 0 ∨ 4 > i ≥ 1 : n ∗ (i + 1) ⟩

⟨Sum i : 4 > 0 ≥ 1 : n ∗ (0 + 1) ⟩ 

n 

n = 5 

5

En el orden de los axiomas, el rango unitario esta primero.

b) ⟨∀ i : 3 ≤ |i| ≤ 4 ∨ 0 < i < 4 : ¬f.i ⟩

⟨∀ i : 3 <= i < 4 : ¬f.i ⟩

Redundatnte el 3 ≤ |i| ≤ 4, simplificado

si |x| < 4

3 <= 4 <= 4  v 0 < i < 4 : -f.i

-> ⟨∀ i : 3 ≤ |4| ≤ 4  : ¬f.i ⟩ v ⟨∀ i : 0 < i < 4 : ¬f.i ⟩

c) ⟨Sum i : |i| ≤ 1 ∨ 0 ≤ 2 ∗ i < 7 : i ∗ n ⟩

⟨Sum i : |i| ≤ 1 ∨ 0 ≤ 2 ∗ i < 7 : i ∗ n ⟩

 0 ya es menor o igual que 2.
 El absoluto sera positivo siempre. Hay false 

⟨Sum i : i < 7 : i ∗ n ⟩

si f.x = |x| < 4

⟨Sum i : |4| ≤ 1 ∨ 0 ≤ 2 ∗ 4 < 7 : 4 ∗ n ⟩

⟨Sum i : false v  4 < 7 : 4 ∗ n ⟩

d) ⟨Prod i : 0 ≤ i < #xs ∧ (i mod 3 = 0 ∨ i mod 3 = 1) : 2 ∗ xs.i + 1 ⟩

⟨Prod i : (0 ≤ i < #xs ∧ i mod 3 = 0 ) v ( 0 ≤ i < #xs ^ i mod 3 = 1) : 2 ∗ xs.i + 1 ⟩

⟨Prod i : (0 ≤ i < #xs ∧ i mod 3 = 0 )  : 2 ∗ xs.i + 1 ⟩ v ⟨Prod i : (0 ≤ i < #xs ^ i mod 3 = 1 )  : 2 ∗ xs.i + 1 ⟩

xs = [-1, 1, 0, 3]

-1, 1 no son mod de 3. Primer termino descartado

0 <= 3 < 4 ^ 3 mod 3 = 0 : 2 * 3 + 1 = 7
0 <= 0 < 4 ^ 0 mod 3 = 0 : 2 * 0 + 1 = 1

3, 0, no distinto de 0 en mod 3.

0 <= -1 < 4 ^ 0 mod 3 /= 0 : 2 * -1 + 1 = -3
0 <= 1 < 4 ^ 0 mod 3 /= 0 : 2 * 1 + 1 = 3

16)

La particion de rango que se hizo es un atentado a los axiomas

xs = []

17) y 18)

a) ⟨Sum i : i = 0 ∨ 4 > i ≥ 1 : n ∗ (i + 1) ⟩

={ i = 0}
    ⟨Sum i : 4 > 0 ≥ 1 : n ∗ (0 + 1) ⟩
={Distirbutividad n y aritmetica}
⟨Sum i : 4 > 0 ≥ 1 : n ⟩

False 
si n = 3 
3

sino
 
 ⟨Sum i : i = 0 ∨ 4 > i ≥ 1 : n ∗ (i + 1) ⟩

  ⟨Sum i : i = 0 ∨ 4 > i ≥ 1 : i + 1 ⟩ * n

b) ⟨Prod i : 3 ≤ |i| ≤ 4 ∨ 0 < i < 4 : n + i ⟩

⟨Prod i : 3 ≤ |i| ≤ 4 ∨ 0 < i < 4 :  i ⟩ + n

f.x(x = 0), n = 3

0 + 3 

3

c) ⟨ ∀ i : i = 0 ∨ 4 > i ≥ 1 : ¬(f.i ∧ f.n) ⟩

⟨ ∀ i : i = 0 ∨ 4 > i ≥ 1 : ¬f.i v -f.n ⟩ {Morgan}

⟨ ∀ i : 4 > 0 ≥ 1 : ¬f.i v -f.n  ⟩ { i = 0 }

False 

si f.x = (x = 0)

⟨ ∀ i : 4 > 0 ≥ 1 : ¬0 v -0  ⟩ 

True   (?)

d)  ⟨Max i : 0 ≤ i < #xs : xs.i ⟩ + x
⟨Max i : 0 ≤ i < #xs : xs.i ⟩ + x

si x = -1, xs = [1, 0, 3]

= { x = -1}
⟨Max i : 0 ≤ i < #xs : xs.i ⟩ -1
={Length xs }
⟨Max i : i pert {0, 1, 2} : xs.i ⟩ -1
={Asignacion de xs.i}
⟨Max i : i pert {0, 1, 2} : xs.0, xs.1, xs.2 ⟩ -1
={Logica}
⟨Max i : i pert {0, 1, 2} : 1, 0, 3 ⟩ -1
={Aritmetica}
0, -1, 2

19)

19. Aplic ́a el cambio de variable indicado, si es que se puede. Explic ́a porqu ́e puede o no puede aplicarse.
a) ⟨Sum i : |i| < 5 : i div 2 ⟩                         con i → 2 ∗ i (o sea f.i = 2 ∗ i)

⟨Sum 2 * i : |2 * i| < 5 : 2 * i div 2 ⟩

¿aplicable pero con los i = -inf, 0, 1, 2 ? 2 * i es div de 2 siemrpe? 

b) ⟨Sum i : i mod 2 = 0 ∧ |i| < 5 : i div 2 ⟩           con i → 2 ∗ i (o sea f.i = 2 ∗ i)

⟨Sum (2 * i) : (2 * i) mod 2 = 0 ∧ |(2 * i)| < 5 : (2 * i) div 2 ⟩

Cambio de variable aplicable, con menor rango de i para |(2 * i)| < 5, con i siendo (-inf, 0, 1, 2]

c) ⟨Prod : 0 < i ≤ #(x ▷ xs) : (x ▷ xs).i ⟩           con i → i + 1 (o sea f.i = i + 1)

⟨Prod (i + 1): 0 < (i + 1) ≤ lenght(x:xs) : (x:xs).(i + 1) ⟩

No es posible por que se pega un elemento de una lsita que se le suma un item por asi decirlo, que no estara en el rango de la lista

d) ⟨Max as : as ̸= [ ] : #as ⟩                           con (a, as) → a ▷ as  (la funci ́on es f.(a, as) = a ▷ as)

⟨Max as : as ̸= [ ] : #as ⟩

No existe tal variable

20. Simplific ́a el rango y aplic ́a alguna de las reglas para la cuantificaci ́on de conteo:
a) ⟨N a, as : a ▷ as = xs ∧ xs = [ ] : #as = 1 ⟩

={Reescritura}
    ⟨N a, as : a:as = xs ∧ xs = [ ] : length.as = 1 ⟩
={Axioma de coso q es xs ^xs = xs}
    <N a, as : a:as = xs = [ ] : length.as = 1 ⟩
={xs = []}
    <N a, as : a:as = [ ] : length.as = 1 ⟩
={a:as no es una lista vacia, false} 
    <N a, as : False : length.as = 1 ⟩
={Rango vacio}
    0

b) ⟨N i : i − n = 1 : i mod 2 = 0 ⟩

={AN11 Definicion de conteo}
    ⟨Sum i : i − n = 1 ^ i mod 2 = 0: 1 ⟩
={Aritmetcia )?)}
    ⟨Sum i : i = 1 + n ^ i mod 2 = 0: 1 ⟩
={Cambio de variable}
    ⟨Sum i : i = 1 + n ^ 1 + n mod 2 = 0: 1 ⟩
={False para un conjunto tq n mod 2 = 0}
    ⟨Sum i : i = 1 + n ^ False = 0: 1 ⟩
={Abs de false en ^}
    ⟨Sum i : False : 1 ⟩
={A1 Rango vacio}
    e

c) ⟨N i : i = 0 ∨ 1 ≤ i < #xs + 1 : ((x ▷ xs).i) mod 2 = 0 ⟩

={TN5 Particion de rango}
    ⟨N i : i = 0 : ((x : xs).i) mod 2 = 0 ⟩ + ⟨N i : 1 ≤ i < #xs + 1 : ((x : xs).i) mod 2 = 0 ⟩
={Cambio de variable}
    ⟨N i : i = 0 : ((x : xs).0) mod 2 = 0 ⟩ + ⟨N i : 1 ≤ i < #xs + 1 : ((x : xs).i) mod 2 = 0 ⟩
={AN 11 Definicion de conteo}
    ⟨Sum i : i = 0 ^ ((x : xs).0) mod 2 = 0  : 1⟩ + ⟨Sum i : 1 ≤ i < #xs + 1 ^ ((x : xs).i) mod 2 = 0 : 1 ⟩

21) 
⟨Sum i: 0 ≤ i < #(x:xs) : T.((x:xs).i) ⟩ = T.x + ⟨Sum i : 0 ≤ i < #xs : T.(xs.i) ⟩

22. (*) (Separacion de un t ́ermino) Demostr ́a los siguientes teoremas  ́utiles para la materia.
Supon ́e que CG es un cuantificador asociado a un operador generico ⊕, que es conmutativo y asociativo
(asi como el ∀ es el cuantificador asociado a la conjunci ́on ∧) y n : Nat.

a) ⟨CG i : 0 ≤ i < n + 1 : T.i ⟩ = ⟨CG i : 0 ≤ i < n : T.i ⟩ ⊕ T.n

asumo el +

    ⟨CG i : 0 ≤ i < n + 1 : T.i ⟩ = ⟨CG i : 0 ≤ i < n : T.i ⟩ + T.n
={}

???


b) ⟨CG i : 0 ≤ i < n + 1 : T.i ⟩ = T.0 ⊕ ⟨CG i : 0 ≤ i < n : T.(i + 1) ⟩

??



23. (Rango unitario generalizado) Sea ⊕ un cuantificador asociado a un operador conmutativo y asocia-
tivo. Proba la siguiente regla de rango unitario generalizado (Z no depende de i ni de j):

⟨CG i, j : i = Z ∧ R.i.j : T.i.j ⟩ = ⟨CG j : R.Z.j : T.Z.j ⟩ .

    <CG i, j : i = Z ∧ R.i.j : T.i.j ⟩ = ⟨CG j : R.Z.j : T.Z.j ⟩
={A7 Anidado}  
    <CG i : i = Z <CG j: R.i.j : T.i.j>⟩ = ⟨CG j : R.Z.j : T.Z.j ⟩>
={A2 Unitario}
    <CG i : i = Z <CG j: R.z.j : T.z.j>⟩ = ⟨CG j : R.Z.j : T.Z.j ⟩>
={A2 unitario}
    <CG j: R.z.j : T.z.j> = <CG j: R.z.j : T.z.j>

kreo k esta bien

24. Podemos definir un cuantificador de conteo N utilizando la sumatoria:

⟨N i : R.i : T.i ⟩ = ⟨Sum i : R.i ∧ T.i : 1 ⟩

Demostra que ⟨Sum i : R.i ∧ T.i : k⟩ = ⟨Ni : R.i : T.i⟩ ∗ k

    ⟨Sum i : R.i ∧ T.i : k⟩ = ⟨Ni : R.i : T.i⟩ ∗ k
={Termino de constante}
    k = ⟨Ni : R.i : T.i⟩ ∗ k
={Distributividad a6}
    k = ⟨Ni : R.i : T.i ∗ k⟩ 

creo q asi no es, pero es mas facil si asumo q k es 1

entonces queda:
    ⟨Sum i : R.i ∧ T.i : k⟩ = ⟨Ni : R.i : T.i⟩ ∗ k
={Asumo k = 1}
    ⟨Sum i : R.i ∧ T.i : 1⟩ = ⟨Ni : R.i : T.i⟩ ∗ 1
={ * 1 es neutro}
    ⟨Sum i : R.i ∧ T.i : 1⟩ = ⟨Ni : R.i : T.i⟩
={Definicion de conteo}
    ⟨N i : R.i : T.i⟩ = ⟨Ni : R.i : T.i⟩

sino bue qsy

25. (*) Demostr ́a la siguiente relaci ́on entre los cuantificadores de m ́aximo y m ́ınimo cuando R es no vac ́ıo:

n = ⟨Min i : R.i : −T.i⟩ ≡ n = −⟨Max i : R.i : T.i⟩

me recuerda a algo... 
a uno del cuatri pasado... 



26. (*) Demostr ́a los siguientes teoremas sobre ∀, utilizando los axiomas y teoremas del digesto:
a) Intercambio de ∀ (generalizada):
⟨∀i : R.i ∧ S.i : T.i⟩ ≡ ⟨∀i : R.i : S.i ⇒ T.i⟩

b) Instanciaci ́on de ∀:
⟨∀i : : T.i⟩ ⇒ T.x, cuando x no esta cuantificada.
¿Como seria la regla de instanciacion para ∃? Enunciala y demostrala.

//lab clase 2

27 y lab 7. Defin ́ı recursivamente las siguientes funciones.
a) La funci ́on paratodo, que dada una lista de valores xs : [A] y un predicado T : A → Bool, determina
si todos los elementos en xs hacen verdadero el predicado T, es decir:


paratodo.xs.T ≡ ⟨ ∀ i : 0 ≤ i < #xs : T.(xs.i) ⟩


todos.xs ≡ ⟨ ∀ i : 0 ≤ i < #xs : xs.i ⟩

--func ej 10
todosxs :: [Bool] -> Bool 
todosxs [] = True 
todosxs (x:xs) = x && todos xs


paraTodo :: [a] -> (a -> Bool) -> Bool
paraTodo [] _ = True
paraTodo (x:xs) t = t x && paraTodo xs t

chekiado !

b)La funci ́on existe, que dada una lista de valores xs : [A] y un predicado T : A → Bool, determina si
alg ́un elemento en xs hace verdadero el predicado T, es decir:

    existe : [A] → (A → Bool) → Bool
    
    existe.xs.T ≡ ⟨ ∃ i : 0 ≤ i < #xs : T.(xs.i) ⟩

Puede ser de ayuda recordar la funci ́on del ejercicio 9.

--ej 9 

algunof : [A] -> Bool
algunof.[] = False
algunof.(x:xs) = f.x || algunof.xs

->

existe : [a] -> (a -> Bool) -> Bool
existe [] _ = True
existe (x:xs) t = t x && paraTodo xs t

chekiado !

c)

La funci ́on sumatoria, que dada una lista de valores xs : [A] y una funci ́on T : A → Num (toma
elementos de A y devuelve n ́umeros), calcula la suma de la aplicaci ́on de T a los elementos en xs es
decir:

sumatoria : [A] → (A → Num) → Num
sumatoria.xs.T = ⟨sum i : 0 ≤ i < #xs : T.(xs.i) ⟩

sumatoria :: [a] -> (a -> Int) -> Int 
sumatoria [] _ = 0
sumatoria (x:xs) t = t x + sumatoria xs t

chekiado !

d)

d) La funci ́on productoria, que dada una lista de valores xs : [A] y una funci ́on T : A → Num, calcula
el producto de la aplicaci ́on de T a los elementos de xs, es decir:

productoria : [A] → (A → Num) → Num
productoria.xs.T = ⟨Prod i : 0 ≤ i < #xs : T.(xs.i) ⟩

productoria :: [a] -> (a -> Int) -> Int
productoria [] _ = 0
productoria (x:xs) t = t x + productoria xs t

chekiado !

lab 8)


paraTodo :: [a] -> (a -> Bool) -> Bool
paraTodo [] _ = True                            1
paraTodo (x:xs) t = t x && paraTodo xs t        2

evaluado:

esCero -> Funcion que hace descarte de un elemento para ver si es 0 o no, y para todo verificara en una lista entera

    paraTodo [0,0,0,0] esCero
={Notacion en terminos de constructores}
    paraTodo 0:0:0:0[] esCero
={Caso 2}
    esCero 0 && paraTodo 0:0:0[] esCero
={Caso 2}
    esCero 0 && paraTodo 0:0[] esCero
={Caso 2}
    esCero 0 && paraTodo 0[] esCero
={Caso 2}
    esCero 0 && paraTodo [] esCero
={Caso 1}
    True

    paraTodo [0,0,1,0] esCero
={Notacion en terminos de construcotres}
    paraTODO 0:0:1:0:[] esCero
={Caso 2}
    esCero 0 && paraTodo 0:0:1[] esCero
={Caso 2}
    esCero 0 && paraTodo 0:1[] esCero
={Caso 2}
    esCero 0 && paraTodo 1:[] esCero
={Caso 2}
    esCero 1 && paraTodo [] esCero
False

    paraTodo "hola" esVocal
={Notacion en terminos de contrcutores}
    paraTodo 'h':'o':'l':'a':[] esVocal
={Caso 2}
    esVocal 'h' && paraTodo 'o':'l':'a':[] esVocal
False

existe : [a] -> (a -> Bool) -> Bool
existe [] _ = True
existe (x:xs) t = t x && paraTodo xs t

    existe "hola" esVocal
={Notacion en terminos de constructors}
    existe 'h':'o':'l':'a':[] esVocal
={Caso 2}
    esVocal 'h' && existe 'o':'l':'a':[] esVocal
False 


Lab 9)
a)
todosPares :: [Int] -> Bool
todosPares = all even 

chekiado ! 

b)
hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo x = any (\y -> y `mod` x == 0)

chekiado ! 
c)
sumaCuadrados :: Int -> Int 
sumaCuadrados n = n >= 0 && sum (map (^2) [0..(n-1)])
 
 noanda
d)
existeDivisor :: Int-> [Int] -> Bool
existeDivisior n (x:xs) = (\x -> x /= 0 && n `mod` x == 0)

como lo hago recursivo sin usar recursividad

e)
esPrimo :: Int -> Bool
esPrimo n = n mod 2 /= 0 && esPrimo n

Por que me dice me fije si n es primo si me pide ver una lista? en todo caso hecho antes.

f)

factorial :: Int -> Int
factorial 0 = 1 
factorial n = n * factorial (n-1)

CREO que esta eviatada 

sino

factorial :: Int -> Int
factorial n = product [1..n]

g)
esPrimo :: Int -> Bool
esPrimo n
  | n <= 1    = False
  | n == 2    = True
  | even n    = False
  
multiplicaPrimos :: [Int] -> Int 
multiplicaPrimos (x:xs) = product (filter esPrimo xs) 

h)

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

esFib :: Int -> Int
esFib n
  | n < 0     = esFib n 
  | otherwise = fib n 

i)

PARAA q pedia

28)

MAP
map :: (a -> b) -> [a] -> [b]

definida:
map f [] = []
map f (x:xs) = f x : map f xs

La función map:
    Toma 2 argumentos, uno de los cuales es una función
    Aplica f a cada elemento de xs
    El resultado es una lista con la aplicación en el mismo orden

EJ:

Prelude> map succ [1,2,3,4]
[2,3,4,5]
Prelude> map not [False, False, True]
[True,True,False]

FILTER
filter :: (a -> Bool) -> [a] -> [a]

definida:

filter p [] = []
filter p (x:xs) | p x = x : filter p xs
                | otherwise = filter p xs

La función filter:
    Toma 2 argumentos, uno de los cuales es un predicado
    El resultado es una lista con los elementos que cumplen el predicado

Prelude> filter (<2) [3,1,0,6,9]
[1,0]
Prelude> filter even [8,2,3,6,11]
[8,2,6]

b)

Prelude> map succ [1,-4, 6, 2, -8]
[3, -1, 8, 4, -6]

c)
Prelude>filter esPositivo [1, -4, 6, 2, -8]
[1, 6, 2]

29.

duplicaValorXS :: [Int] -> [Int]
duplicaValorXS [] = []
duplicaValorXS (x:xs) = x * 2 : duplicaValorXS xs 

b) 

duplicaValorXS :: [Int] -> [Int]
duplicaValorXS [] = []
duplicaValorXS (x:xs) = map (* 2 ) xs  


chekiado !

lab 10 hecho arriba lol)

lab 11)

esPrimo :: Int -> Bool
esPrimo n | n < 2 = False
          | otherwise = all (\x -> n `mod` x /= 0) [2..(n-1)]

primosRec :: [Int] -> [Int]
primosRec [] = []
primosRec (x:xs)
    | esPrimo x = x : primosRec xs
    | otherwise = primosRec xs


chekiado !

con filter:

esPrimo :: Int -> Bool
esPrimo n | n < 2 = False
          | otherwise = all (\x -> n `mod` x /= 0) [2..(n-1)]

primosFilter :: [Int] -> [Int]
primosFilter xs = filter esPrimo xs


chekiado !


Lab 12)
a)
primIgualesA :: a -> [a] -> [a]
primIgualesA n [] = []
primIgualesA n (x:xs) | n == x = x : primIguales n xs 
                      | otherwise = []


chekiado !

b)
primIgualesA :: Eq a => a -> [a] -> [a]
primIgualesA n = takeWhile (== n)


chekiado !

Takewhile toma elementos de una lista mientras se cumple la condicion dada en ()

lab 13) 
DA ES LO MISMO

primIguales :: [a] -> [a]
primIguales [] = []
primIguales (x:xs) = x : takeWhile (==x) xs 

Chekiado !

primIguales :: Eq a => [a] -> [a]
primIguales [] = []
primIguales (x:xs) = primIgualesA x (x:xs)

chekiado !

30, lab 14) pasa palabra

lab 15)

primQueCumplen :: [a] -> (a -> Bool) -> [a]
primQueCumplen [] _ = []
primQueCumplen (x:xs) p
    | p x       = x : primQueCumplen xs p
    | otherwise = []

    esta esta cool

primQueCumplen :: [a] -> (a -> Bool) -> [a]
primQueCumplen ls p = takeWhile p ls

lab 16) https://prnt.sc/42X9B29JjDxH

lab 17)
a) f :: (a, b) -> b
f (a, b)= b

b)f :: (a, b) -> c
f (a, b) = c

c) f :: (a -> b) -> a -> b
f a b = a b

d)
f :: (a -> b) -> [a] -> [b]
f a b = [] []

falto: 24-26
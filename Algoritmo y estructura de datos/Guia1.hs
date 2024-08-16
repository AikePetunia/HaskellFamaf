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

d)
--p ∨ (p ∧ q) ≡ p

    p ∨ (p ∧ q) ≡ p
={}

para q hacerlos si los hioce hace 1 mes...

Lab 1)
a)--esCero :: Int -> Bool, que verifica si un entero es igual a 0.

esCero :: Int -> Bool
esCero n | n == 0    = True
         | otherwise = False

b)--esPositivo :: Int -> Bool, que verifica si un entero es estrictamente mayor a 0.

esPositivo :: Int -> Bool
esPositivo n | n <= 0 = False
             | n > 0 = True

c) --esVocal :: Char -> Bool, que verifica si un caracter es una vocal en min ́uscula.

esVocal :: Char -> Bool
esVocal c | c == 'a' = True
          | c == 'e' = True
          | c == 'i' = True
          | c == 'o' = True
          | c == 'u' = True
          | otherwise = False

d) ya lo hice en otra ocacion cuatri pasado

--ej 1)

xs = {Lista de figuras}
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

2. Escrib ́ı f ́ormulas para las siguientes expresiones en lenguaje natural.

a) Todas las figuras de xs son amarillas.
<Ax: : amarillo.xs>
b) La suma de los tama ̃nos de todas las figuras de xs es mayor a 10.
<Sum i : 0 <= i ^ 0 < length.xs : tam.(xs.i) > 10 >
c) Ninguna figura de xs tiene tama ̃no menor a 7.
<min i : 0 <= i ^ i < lenght.xs : tam.(xs.i) < 7> (?)

3. y lab 2.
 Para cada una de las siguientes funciones escrib ́ı una expresi ́on que las describa formalmente. Por otro
lado, escrib ́ı un programa recursivo que compute la funci ́on.

a) paratodo :: [Bool] -> Bool, que verifica que todos los elementos de una lista sean True.
<Ai : 0 <= i ^ i < lenght.xs: xs !! i == true>

paraTodo :: [Bool] -> Bool
paraTodo [] = True                                      1
paraTodo (x:xs) | x == False = False                    2
                | otherwise = paraTodo xs               3

Dada la lista Paratodo[ True , False, True ]

    paraTodo[True , False, True]
={Notacion en terminos de constructores}
    paraTodo True:False:True:[]
={Caso 3}
    paraTodo False:True[]
={Caso 2}
    False == False = False
={False}

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
<Sum i : 0 <= i ^ i < length.xs : xs !! i > (?)

sum :: [Int] -> Int
sum [] = 0                          1
sum (x:xs) = x + sum xs             2

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
<Prod i : 0 <= i ^ i < length.xs : xs !! i > (?)

prod :: [Int] -> Int
prod [] = 0                           1
prod (x:xs) = x + prod xs             2

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
<Fact i : 0 <= i ^ i < length.xs : i>
factorial :: Int -> Int
factorial 0 = 1 
factorial n = n * factorial (n-1)

e) Utiliz ́a la funci ́on sumatoria para definir, promedio :: [Int] -> Int, que toma una lista de
n ́umeros no vacia y calcula el valor promedio (truncado, usando divisi ́on entera).

<sum i : 0 <= i ^ i < length.xs : xs.i 'div' lenght.xs >

promedio :: [Int] -> Int
promedio [] = 0
promedio xs = sum xs `div` length xs

4 y 5. Para cada una de las siguientes f ́ormulas, describ ́ı su significado utilizando el lenguaje natural.
a) 
⟨ ∀ i : 0 ≤ i < #xs : xs.i > 0 ⟩
"Para todo elemento i desde el elemento 0 hasta el length de xs, tal que un elemento es mayor que 0 "
xs = [−5, −3, 4, 8]

    ⟨ ∀ i : 0 ≤ i < #xs : xs.i > 0 ⟩
≡ { calculo rango sabiendo que #xs = 4 }
    ⟨ ∀ i : i ∈ {0, 1, 2, 3} : xs.i > 0 ⟩           //son 4 elementos.
≡ { aplico el t ́ermino a cada elemento del rango }
    (xs.0 > 0) ∧ (xs.1 > 0) ∧ (xs.2 > 0) ∧ (xs.3 > 0)
≡ { eval ́uo las indexaciones con xs = [−5, −3, 4, 8] }
    (−5 > 0) ∧ (−3 > 0) ∧ (4 > 0) ∧ (8 > 0)
≡ { eval ́uo las desigualdades }
    False ∧ False ∧True ∧ True
≡ { resuelvo las conjunciones }
    False

xs = [11, 2, 5, 8]

    ⟨ ∀ i : 0 ≤ i < #xs : xs.i > 0 ⟩
≡ { calculo rango sabiendo que #xs = 4 }
    ⟨ ∀ i : i ∈ {0, 1, 2, 3} : xs.i > 0 ⟩       // elementos 
≡ { aplico el t ́ermino a cada elemento del rango }
    (xs.0 > 0) ∧ (xs.1 > 0) ∧ (xs.2 > 0) ∧ (xs.3 > 0) // xs en posicion 1, 2, 3, ektgywijfiu etc 
≡ { eval ́uo las indexaciones con xs = [11, 2, 5, 8] }
    (11 > 0) ∧ (2 > 0) ∧ (5 > 0) ∧ (8 > 0)
={Evaluacion x digesto}
    True 


b) ⟨ ∃ i : 0 ≤ i < #xs : xs.i = x ⟩
"Existe un elemento i desde el elemento 0 hasta el length de xs, hay un elemento igual"

xs = [−5, −3, 4, 8]

    ⟨ ∃ i : 0 ≤ i < #xs : xs.i = x ⟩
≡ { calculo rango sabiendo que #xs = 4 }
    ⟨ E i : i ∈ {0, 1, 2, 3} : xs.i = 0 ⟩           //son 4 elementos.
≡ { aplico el t ́ermino a cada elemento del rango }
    (xs.0 = 0) ∧ (xs.1 = 0) ∧ (xs.2 = 0) ∧ (xs.3 = 0)
≡ { eval ́uo las indexaciones con xs = [−5, −3, 4, 8] }
    (−5 = 0) ∧ (−3 = 0) ∧ (4 = 0) ∧ (8 = 0)
={ todo false}
    False

xs = [11, 2, 5, 8]

    ⟨ ∃ i : 0 ≤ i < #xs : xs.i = x ⟩
≡ { calculo rango sabiendo que #xs = 4 }
    ⟨ E i : i ∈ {0, 1, 2, 3} : xs.i = 0 ⟩           //son 4 elementos.
≡ { aplico el t ́ermino a cada elemento del rango }
    (xs.0 = 0) ∧ (xs.1 = 0) ∧ (xs.2 = 0) ∧ (xs.3 = 0)
≡ { eval ́uo las indexaciones con xs = [11, 2, 5, 8] }
    (11 = 0) ∧ (2 = 0) ∧ (5 = 0) ∧ (8 = 0)
={ todo false}
    False

c) ⟨ ∀ i : 0 ≤ i < #xs : ⟨ ∃ j : 0 ≤ j < #ys : xs.i = ys.j ⟩ ⟩
"Para todo elemento i desde el elemento 0 hasta el length de xs, en termino Existe un elemento j desde el elemento 0 hasta el length de xs, tal que hayan dos elementos iguales"

Desconozco si uso las dos listas, creo k si pq son 2 justamente y aca pide dos listas PD: NO LEI EL DE YS Na ya esta perdon 
xs = [−5, −3, 4, 8] y ys = [11, 2, 5, 8]
    ⟨ ∀ i : 0 ≤ i < #xs : ⟨ ∃ i : 0 ≤ i < #ys : xs.i = ys.j⟩ ⟩
≡ { calculo rango sabiendo que #xs = 4 }
    ⟨ ∀ i : i ∈ {0, 1, 2, 3} : ⟨ ∃ j : j ∈ {0, 1, 2, 3} : xs.i = ys.j⟩ ⟩           //son 4 elementos.
≡ { aplico el t ́ermino a cada elemento del rango }
    (xs.0 = ys.0) ∧ (xs.1 = ys.1) ∧ (xs.2 = ys.2) ∧ (xs.3 = ys.3) 
≡ { eval ́uo las indexaciones con xs = [−5, −3, 4, 8] y ys = [11, 2, 5, 8] }
    (-5 = 11) ^ (-3 = 2) ^ ( 4 = 5) ^(8 = 8)
={Evaluo}
    false ^ false ^ False ^ True 
={coso}
    false 

d) ⟨ ∀ i : 0 ≤ i < #xs − 1 : xs.i = xs.(i + 1) ⟩
"Para todo elemento i desde el elemento 0 hasta el penultimo elemento del length de xs, en termino de que un elemento de xs.i es igual a xs.i mas uno."

xs = [−5, −3, 4, 8]

    ⟨ ∀ i : 0 ≤ i < #xs : xs.i > 0 ⟩
≡ { calculo rango sabiendo que #xs = 4 }
    ⟨ ∀ i : i ∈ {0, 1, 2, 3} : xs.i > 0 ⟩           //son 4 elementos.
≡ { aplico el t ́ermino a cada elemento del rango }
    (xs.0 = xs.0 + 1) ∧ (xs.1 = xs.1 + 1) ∧ (xs.2 = xs.2 + 1) ∧ (xs.3 = xs.3 + 1)
={ Evaluo las indexiones xs = [−5, −3, 4, 8]}
    (-5 = -4) ∧ (-3 = -2) ∧ (4 = 5) ∧ (8 = 9)
={ Obvio mas falso aksjl}
    false 

xs = [11, 2, 5, 8]
    ⟨ ∀ i : 0 ≤ i < #xs : xs.i > 0 ⟩
≡ { calculo rango sabiendo que #xs = 4 }
    ⟨ ∀ i : i ∈ {0, 1, 2, 3} - 1: xs.i > 0 ⟩       // elementos, no se como interpretar ese -1 la vdd, serian 3 elemetnos evaluado contra 4?? idk
≡ { aplico el t ́ermino a cada elemento del rango }
    (xs.0 = xs.0 + 1) ∧ (xs.1 = xs.1 + 1) ∧ (xs.2 = xs.2 + 1) ∧ (xs.3 = xs.3 + 1)
={ Evaluo las indexiones xs = [11, 2, 5, 8]}
    (11 = 12) ∧ (2 = 3) ∧ (5 = 6) ∧ (8 = 9)
={ Obvio mas falso aksjl }
    false 

Lab 3. 
a)
    a) No hay, sujetas a cuantficadores
    b) x
    c) No hay, sujetas a cuantficadores
    d) No hay, sujetas a cuantficadores
b)

???

c)

6. Escrib ́ı f ́ormulas para las siguientes expresiones en lenguaje natural.
a) Todos los elementos de xs e ys son iguales (¡ojo! ¡sujeta a interpretaci ́on!).
<Ai: 0 <= i ^ i < lenght.xs : <Aj : 0 <= j ^ j < lenght.ys : xs !! i == ys !! j>

b) Todos los elementos de xs ocurren en ys.
<Ai: 0 <= i ^ i < lenght.xs : <Aj : 0 <= j ^ j < lenght.ys : take i xs == take j xs>

c) Todos los elementos de xs ocurren en ys en la misma posici ́on.
<Ai: 0 <= i ^ i < lenght.xs : <Aj : 0 <= j ^ j < lenght.ys : drop xs i == drop ys j>

(dudo de b y c)

7 y 8, lab 4)

Para cada una de las siguientes f ́ormulas, describ ́ı su significado utilizando el lenguaje natural.
a) ⟨Prod i : 1 ≤ i ≤ n : i ⟩
El producto de todos los elementos del 1 a n.

    ⟨ ∀ i : 1 ≤ i < n : i ⟩
≡ { Implemento n }
    ⟨ ∀ i : 1 <= i < 5 : xs.i > 0 ⟩           //son elementos de n
≡ { aplico el t ́ermino a cada elemento del rango }
    1 * 2 * 3 * 4 * 5
={aritmetica}
    120

    variable libre: n 

prod :: Int -> Int
prod n = n * prod 

b) ⟨Sum i: 0 ≤ i < #xs : xs.i ⟩/ #xs
Promedio de los elementos de la lista xs en su sumatoria.

    ⟨Sum i: 0 ≤ i < #xs : xs.i ⟩ / #xs
={ Implemento xs }
    ⟨Sum i: i e {6, 9, 3, 9, 8} : xs.i ⟩/ 5
={Impl en xs}
    xs.1 + xs.2 + xs.3 + xs.4 + xs.5
={Aritmetica}
    (6 + 9 + 3 + 9 + 8 )/5
={Aritmetica}
    7 

    no hay variable libre


sum :: [Int] -> Int
sum [] = 0                          1
sum (x:xs) = x + sum xs 'div' lenght xs            2


c) ⟨Max i : 0 ≤ i < #xs : xs.i ⟩ < ⟨Min i : 0 ≤ i < #ys : ys.i ⟩
El mayor elemento en la lista xs es menor que el menor elemento en la lista ys

    ⟨Max i : 0 ≤ i < #xs : xs.i ⟩ < ⟨Min i : 0 ≤ i < #ys : ys.i ⟩
={Imp xs y ys}
    ⟨Max i : i e  {-3, 9, 8} : xs.i ⟩ < ⟨Min i : i e {6, 7, 8} : ys.i ⟩
={Impl func. max y min.}
    max(xs.1, xs.2, xs.3) < min(xs.1, xs.2, xs.3)
={Impl. xs.i y ys.i}
    max(-3, 9, 8) < min(6, 7, 8)
={func max y min}
    9 < 6
    false????????????????????????'''

    no hay variable libre, sujeta a min y max

esMenorMaxQueMin :: [Int] -> [Int] -> Bool
esMenorMaxQueMin xs ys = maximum xs < minimum ys


d) ⟨ ∃ i, j : (2 ≤ i < n) ∧ (2 ≤ j < n) : i ∗ j = n ⟩
Existen 2 elementos tal que su producto es igual a n 

    ⟨ ∃ i, j : (2 ≤ i < n) ∧ (2 ≤ j < n) : i ∗ j = n ⟩
={Impl. de n}
    ⟨ ∃ i, j : (2 ≤ i < 5) ∧ (2 ≤ j < 5) : i ∗ j = 5 ⟩
={aritmeticamente, no hay un numero enero tq i * j = 5}

    variable libre n

prod :: Int, Int, Int -> Bool
prod i j n | i > n = False
           | j > n = False
           | i * j == n = True
           | otherwise = False 

9)
Suponiendo que f : A → Bool es una funci ́on fija cualquiera, y xs : [A], caracteriz ́a con una cuantificaci ́on
la siguiente funci ́on recursiva:

algunof : [A] -> Bool
algunof.[] = False
algunof.(x:xs) = f.x || algunof.xs

si me dice alguno, de entrada me doy cuenta que es un E (existe)
devuelve un bool
parece que pide que si esta en una funcion f o en algunof algun tipo de valor A (cuaql)

<E i : 0 <= i ^ i < length.xs : f(xs.i)>

10 y lab 5)

10. Defin ́ı recursivamente una funci ́on todos : [Bool] → Bool que verifica que todos los elementos de una lista
son T rue, es decir, que satisface la siguiente especificaci ́on:

todos.xs ≡ ⟨ ∀ i : 0 ≤ i < #xs : xs.i ⟩

todosxs :: [Bool] -> Bool 
todosxs [] = True 
todos (x:xs) = x && todos xs
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

11 y lab 6)

a) n es potenica de 2

<Ax :  x pert xs : n = 2^x >

b) n es el elemento mas grande de xs

<Max n : n pert xs : n >

variable libre xs

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

    ⟨Max a, as : a:as = [ ] : length (as) ⟩
={Logica, si a:as es lista vacia, es false, pues una lista vacia es vacia y no se le pega un elemento}
    ⟨Max a, as : False : length (as) ⟩
={Rango vacio}
    -inf

14. 15 skip Aplica partici ́on de rango si es que se puede, y si no se puede, explic ́a porqu ́e.
a) ⟨Sum i : i = 0 ∨ 4 > i ≥ 1 : n ∗ (i + 1) ⟩

    ⟨Sum i : i = 0 ∨ 4 > i ≥ 1 : n ∗ (i + 1) ⟩
={Particion de rango}
    ⟨Sum i : 4 > i ≥ 1 : n ∗ (i + 1) ⟩ v     ⟨Sum i : i = 0: n ∗ (i + 1) ⟩

En el orden de los axiomas, el rango unitario esta primero.

b) ⟨∀ i : 3 ≤ |i| ≤ 4 ∨ 0 < i < 4 : ¬f.i ⟩

    ⟨∀ i : 3 ≤ |i| ≤ 4 ∨ 0 < i < 4 : ¬f.i ⟩
={Particion de rango}
    ⟨∀ i : 3 ≤ |i| ≤ 4 : ¬f.i ⟩ v ⟨∀ i : 0 < i < 4 : ¬f.i ⟩

c) ⟨Sum i : |i| ≤ 1 ∨ 0 ≤ 2 ∗ i < 7 : i ∗ n ⟩

    ⟨Sum i : |i| ≤ 1 ∨ 0 ≤ 2 ∗ i < 7 : i ∗ n ⟩
={Particion de rango}
    ⟨Sum i : 0 ≤ 2 ∗ i < 7 : i ∗ n ⟩ v ⟨Sum i : |i| ≤ 1 : i ∗ n ⟩

d) ⟨Prod i : 0 ≤ i < #xs ∧ (i mod 3 = 0 ∨ i mod 3 = 1) : 2 ∗ xs.i + 1 ⟩

={Distributividad de v con ^}
    ⟨Prod i : (0 ≤ i < #xs ∧ i mod 3 = 0 ) v ( 0 ≤ i < #xs ^ i mod 3 = 1) : 2 ∗ xs.i + 1 ⟩
={Particion de rango}
    ⟨Prod i : (0 ≤ i < #xs ∧ i mod 3 = 0 ) : 2 ∗ xs.i + 1 ⟩ v ⟨Prod i : (0 ≤ i < #xs ^ i mod 3 = 1 )  : 2 ∗ xs.i + 1 ⟩

xs = [-1, 1, 0, 3]

-1, 1 no son mod de 3. Primer termino descartado

0 <= 3 < 4 ^ 3 mod 3 = 0 : 2 * 3 + 1 = 7
0 <= 0 < 4 ^ 0 mod 3 = 0 : 2 * 0 + 1 = 1

3, 0, no distinto de 0 en mod 3.

0 <= -1 < 4 ^ 0 mod 3 /= 0 : 2 * -1 + 1 = -3
0 <= 1 < 4 ^ 0 mod 3 /= 0 : 2 * 1 + 1 = 3

16)

Particion de rango bien hecha.
Falla para xs = []

17) y 18)

a) ⟨Sum i : i = 0 ∨ 4 > i ≥ 1 : n ∗ (i + 1) ⟩

    ⟨Sum i : i = 0 ∨ 4 > i ≥ 1 : n ∗ (i + 1) ⟩
={particion de rango}
    ⟨Sum i : 4 > i ≥ 1 : n ∗ (i + 1) ⟩ v ⟨Sum i : i = 0 : n ∗ (i + 1)⟩
={Distributividad}
    ⟨Sum i : 4 > i ≥ 1 : n ∗ (i + 1) ⟩ v ⟨Sum i : i = 0 : i + 1⟩ * n

False 
si n = 3 
3

sino
 
 ⟨Sum i : i = 0 ∨ 4 > i ≥ 1 : n ∗ (i + 1) ⟩

 ⟨Sum i : i = 0 ∨ 4 > i ≥ 1 : i + 1 ⟩ * n

b) 
    ⟨Prod i : 3 ≤ |i| ≤ 4 ∨ 0 < i < 4 : n + i ⟩
={Distributividad}
    ⟨Prod i : 3 ≤ |i| ≤ 4 ∨ 0 < i < 4 : i ⟩ + n

f.x(x = 0), n = 3

0 + 3 

3

c) 
    ⟨ ∀ i : i = 0 ∨ 4 > i ≥ 1 : ¬(f.i ∧ f.n) ⟩
={Morgan}
    ⟨ ∀ i : i = 0 ∨ 4 > i ≥ 1 : ¬f.i v -f.n ⟩ 
={Distributividad}
    ⟨ ∀ i : 4 > 0 ≥ 1 : ¬f.i ⟩ v -fn (? en todo caso creo q no se puede)

False 

si f.x = (x = 0)

⟨ ∀ i : 4 > 0 ≥ 1 : ¬0 v -0  ⟩ 

True   

d)  
    ⟨Max i : 0 ≤ i < #xs : x + xs.i ⟩
={Distributividad}
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

19. Aplic ́a el cambio de variable indicado, si es que se puede. Explic ́a porqu ́e puede o no puede aplicarse.

a) 
    ⟨Sum i : |i| < 5 : i div 2 ⟩                         con i → 2 ∗ i (o sea f.i = 2 ∗ i)
={Cambio de variable}
    ⟨Sum 2 * i : |2 * i| < 5 : 2 * i div 2 ⟩

¿aplicable pero con los i = -inf, 0, 1, 2 ? 2 * i es div de 2 siemrpe? 

b) 
    ⟨Sum i : i mod 2 = 0 ∧ |i| < 5 : i div 2 ⟩           con i → 2 ∗ i (o sea f.i = 2 ∗ i)
={cambio de variable}
    ⟨Sum (2 * i) : (2 * i) mod 2 = 0 ∧ |(2 * i)| < 5 : (2 * i) div 2 ⟩

Cambio de variable aplicable, con menor rango de i para |(2 * i)| < 5, con i siendo (-inf, 0, 1, 2]

c) ⟨Prod : 0 < i ≤ #(x ▷ xs) : (x ▷ xs).i ⟩           con i → i + 1 (o sea f.i = i + 1)

⟨Prod (i + 1): 0 < (i + 1) ≤ lenght(x:xs) : (x:xs).(i + 1) ⟩

No es posible por que se pega un elemento de una lsita que se le suma un item por asi decirlo, que no estara en el rango de la lista

d) ⟨Max as : as ̸= [ ] : #as ⟩                           con (a, as) → a ▷ as  (la funci ́on es f.(a, as) = a ▷ as)

⟨Max as : as ̸= [ ] : #as ⟩

No existe tal variable, en todo caso a:as /= []

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
={Cambio de variable de i}
    ⟨Sum i : 1 + n mod 2 = 0: 1 ⟩
={False para un conjunto tq n mod 2 = 0}
    ⟨Sum i : False = 0: 1 ⟩
={Abs de false en ^}
    ⟨Sum i : False : 1 ⟩
={A1 Rango vacio}
     0

c) ⟨N i : i = 0 ∨ 1 ≤ i < #xs + 1 : ((x ▷ xs).i) mod 2 = 0 ⟩

={TN5 Particion de rango}
    ⟨N i : i = 0 : ((x : xs).i) mod 2 = 0 ⟩ + ⟨N i : 1 ≤ i < #xs + 1 : ((x : xs).i) mod 2 = 0⟩
={Cambio de variable}
    ⟨N i : : ((x : xs).0) mod 2 = 0 ⟩ + ⟨N i : 1 ≤ i < #xs + 1 : ((x : xs).i) mod 2 = 0⟩
={AN 11 Definicion de conteo}
    ⟨Sum i : ((x : xs).0) mod 2 = 0  : 1⟩ + ⟨Sum i : 1 ≤ i < #xs + 1 ^ ((x : xs).i) mod 2 = 0 : 1 ⟩
?

21) 
    ⟨Sum i: 0 ≤ i < #(x:xs) : T.((x:xs).i) ⟩ = T.x + ⟨Sum i : 0 ≤ i < #xs : T.(xs.i) ⟩
={0 <= i < length x:xs = i = 0 v 1 <= i < length x:xs + 1}
    ⟨Sum i: i = 0 v 1 ≤ i < #(x:xs) + 1 : T.((x:xs).i) ⟩ = T.x + ⟨Sum i : 0 ≤ i < #xs : T.(xs.i) ⟩
={Particion de rango}
    ⟨Sum i: i = 0 : T.((x:xs).i) ⟩ v ⟨Sum i: 1 ≤ i < #(x:xs) + 1 : T.((x:xs).i) ⟩= T.x + ⟨Sum i : 0 ≤ i < #xs : T.(xs.i) ⟩
={Rango unitario}
    ⟨Sum i: i = 0 : T.((x:xs).0) ⟩ v ⟨Sum i: 1 ≤ i < #(x:xs) + 1 : T.((x:xs).i) ⟩= T.x + ⟨Sum i : 0 ≤ i < #xs : T.(xs.i) ⟩
={indice 0}
    ⟨Sum i: i = 0 : T.x) ⟩ v ⟨Sum i: 1 ≤ i < #(x:xs) + 1 : T.((x:xs).i) ⟩= T.x + ⟨Sum i : 0 ≤ i < #xs : T.(xs.i) ⟩
={termino de constante}
    t x + ⟨Sum i: 0 ≤ i < #(x:xs) : T.((x:xs).i) ⟩= T.x + ⟨Sum i : 0 ≤ i < #xs : T.(xs.i) ⟩

?


22. (*) (Separacion de un t ́ermino) Demostr ́a los siguientes teoremas  ́utiles para la materia.
Supon ́e que CG es un cuantificador asociado a un operador generico ⊕, que es conmutativo y asociativo
(asi como el ∀ es el cuantificador asociado a la conjunci ́on ∧) y n : Nat.

a) ⟨CG i : 0 ≤ i < n + 1 : T.i ⟩ = ⟨CG i : 0 ≤ i < n : T.i ⟩ ⊕ T.n

??

b) ⟨CG i : 0 ≤ i < n + 1 : T.i ⟩ = T.0 ⊕ ⟨CG i : 0 ≤ i < n : T.(i + 1) ⟩

??

23. (Rango unitario generalizado) Sea ⊕ un cuantificador asociado a un operador conmutativo y asocia-
tivo. Proba la siguiente regla de rango unitario generalizado (Z no depende de i ni de j):

⟨CG i, j : i = Z ∧ R.i.j : T.i.j ⟩ = ⟨CG j : R.Z.j : T.Z.j ⟩ .

    <CG i, j : i = Z ∧ R.i.j : T.i.j ⟩ = ⟨CG j : R.Z.j : T.Z.j ⟩
={A7 Anidado}  
    <CG i : i = Z : <CG j: R.i.j : T.i.j>⟩ = ⟨CG j : R.Z.j : T.Z.j ⟩>
={A2 Unitario}
    <CG i : : <CG j: R.z.j : T.z.j>⟩ = ⟨CG j : R.Z.j : T.Z.j ⟩>
={A2 Rango unitario}
    <CG j: R.z.j : T.z.j> = <CG j: R.z.j : T.z.j>

24. Podemos definir un cuantificador de conteo N utilizando la sumatoria:

⟨N i : R.i : T.i ⟩ = ⟨Sum i : R.i ∧ T.i : 1 ⟩

Demostra que ⟨Sum i : R.i ∧ T.i : k⟩ = ⟨Ni : R.i : T.i⟩ ∗ k

   ⟨Sum i : R.i ∧ T.i : k⟩ = ⟨Ni : R.i : T.i⟩ ∗ k
={Definicion de sum}
    ⟨Sum i : R.i ∧ T.i : k⟩ = ⟨Sum i : R.i ^ T.i : 1 ⟩ * k 
={Distributividad}
    ⟨Sum i : R.i ∧ T.i : k⟩ = ⟨Sum i : R.i ^ T.i :  1 * k ⟩  

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
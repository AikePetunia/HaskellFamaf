--Lab 1)
--Laboratorio 1 Defin ́ı en Haskell las funciones derivadas en el ejercicio 2 y evalu ́a las mismas en los ejemplosutilizados en el ejercicio 3.
--La sumatoria de los números de una lista multiplicados por sí mismos

sumCuad :: [Int] -> Int
sumCuad [] = 0					--1
sumCuad (x:xs) = x * x + sumCuad xs		--2

--chekiada!

--[1,2,3]

	--sumCuad [1,2,3]
-- ={Notacion en terminos de constructores}
	--sumCuad 1:2:3:[]
-- ={Matcheo caso  2}
	--1 * 1 + sumCuad 2:3:[]
-- ={matcheo caso 2 }
	--1 + ( 2 * 2 + sumCuad 3: [])
-- ={Matcheo caso 2}
	--1 + ( 4 + ( 3 * 3 + sumCuad []))
-- ={Matcheo caso vacio y aritmetica }
	--1 

--Asumo que e = True 
--iga.e.xs = ⟨ ∀ i : 0 ≤ i < #xs : xs.i = e ⟩ 
--Para todo elemento en la lista xs, hay un elemento igual a true

igaE :: [Int] -> Bool
igaE [] = True					--1
igaE (x:xs) = x == x && igaE xs			--2

expXN :: Int -> Int -> Int
expXN x n = x^n + expXN

--sum par.n = ⟨ Sum i : 0 ≤ i ≤ n ∧ par.i : i⟩ donde par.i .= i mod 2 = 0. 
--Suma todo número par.

sumPar :: [Int] -> Int
sumPar [] = 0							--1
sumPar (x:xs) | x `mod` 2 == 0 = x + sumPar xs			--2
	      | otherwise = sumPar xs				--3

--cuantos.p.xs = ⟨N i : 0 ≤ i < #xs : p.(xs.i)⟩ 
--Cuenta cuantas p hay en una lista

cuantosP :: [Char] -> Int
cuantosP [] = 0						--1
cuantosP (x:xs) | x /= 'p' = cuantosP xs 		--2
		| x == 'p' = 1 + cuantosP xs		--3
	
--['p','p','a']

	--cuantosP ['p','p','a']
-- ={Notacion en terminos de consturcotres}
	--cuantosP 'p':'p':'a':[]
-- ={Matcheo caso 3}
	--1 + (cuantosP 'p':'a':[])
-- ={Matcheo caso 3 }
	--1 + (1 + (cuantosP 'a':[]))
-- ={Matcheo caso 2}
	--1 + (1 (cuantosP []))
-- ={Caso base 1 y aritmetica}
	--2

--lab 2)
--where, case, tipo de datos (data)

-- Laboratorio 2)
-- A) Implementa el tipo carrera
-- B) Defin ́ı la siguiente funci ́on, usando pattern matching: titulo :: Carrera -> String que devuelve el nombre completo de la carrera en forma de string. Por ejemplo, para el constructor Matematica, debe devolver ”Licenciatura en Matem ́atica”.

data Carrera = Matematica | Fisica | Computacion | Astronomia

titulo :: Carrera -> String
titulo n | n == "Matematica" = "Licenciatura en matematica"
	 | n == "Fisica" = "Licenciatura en fisica"
	 | n == "Computacion" = "Licenciatura en computacion"
	 | n == "Astronomia" = "Licenciatura en astronomia"

--Alternativamente

data Carrera = Matematica | Fisica | Computacion | Astronomia

titulo :: Carrera -> String
titulo n = case n of
    Matematica    -> "Licenciatura en matematica"
    Fisica        -> "Licenciatura en fisica"
    Computacion   -> "Licenciatura en computacion"
    Astronomia    -> "Licenciatura en astronomia"
    
--Alternativamente

data Carrera = Matematica | Fisica | Computacion | Astronomia 

titulo :: Carrera -> String
titulo    Matematica    = "Licenciatura en matematica"
titulo    Fisica        = "Licenciatura en fisica"
titulo    Computacion   = "Licenciatura en computacion"
titulo    Astronomia    = "Licenciatura en astronomia"

--C) Para escribir m ́usica se utiliza la denominada notaci ́on musical, la cual consta de notas (do, re, mi, ...).
--Adem ́as, estas notas pueden presentar alg ́un modificador ♯ (sostenido) o ♭ (bemol), por ejemplo do♯, si♭, etc.
--Por ahora nos vamos a olvidar de estos modificadores (llamados alteraciones) y vamos a representar las notas basicas.
--Defin ́ı el tipo NotaBasica con constructores Do, Re, Mi, Fa, Sol, La y Si
--D)El sistema de notaci ́on musical anglosaj ́on, tambi ́en conocido como notaci ́on o cifrado americano, relaciona
--las notas b ́asicas con letras de la A a la G. Este sistema se usa por ejemplo para las tablaturas de guitarra.
--Program ́a usando pattern matching la funci ́on:
--cifradoAmericano : : NotaBasica −> Char
--que relaciona las notas Do, Re, Mi, Fa, Sol, La y Si con los caracteres ’C’ , ’D’, ’E’, ’F’, ’G’, ’A’ y ’B’
--respectivamente.

data NotaBasicas = Do | Re | Mi | Fa | Sol | La | Si

cifradoAmericano :: NotaBasicas -> Char
cifradoAmericano Do = 'c'
cifradoAmericano Re = 'd'
cifradoAmericano Mi = 'e'
cifradoAmericano Fa = 'f'
cifradoAmericano Sol ='g'
cifradoAmericano La = 'a'
cifradoAmericano Si = 'b'

--Alternativamente

data NotaBasicas = Do | Re | Mi | Fa | Sol | La | Si

cifradoAmericano :: NotaBasicas −> Char
cifradoAmericano n = case n of 
			Do = 'c'
 			Re = 'd'
 			Mi = 'e'
 			Fa = 'f'
 			Sol ='g'
 			La = 'a'
 			Si = 'b'


--Lab 3)

--a) Complet ́a la definici ́on del tipo NotaBasica para que las expresiones


data NotaBasicas = Do | Re | Mi | Fa | Sol | La | Si
    deriving (Eq, Show, Ord, Bounded, Enum)
		
--Lab 4)

minimoElemento :: (Ord a, Num a) => [a] -> a
minimoElemento [] = 0
minimoElemento [x] = x
minimoElemento (x:xs) = min x (minimoElemento xs)

--a) Defin ́ı usando polimorfismo ad hoc la funci ́on minimoElemento que calcula (de manera recursiva) cu ́al es el
-- menor valor de una lista de tipo [a]. Asegurate que s ́olo est ́e definida para listas no vac ́ıas.

minimoElemento' :: (Ord a, Bounded a) => [a] -> a
minimoElemento' [] = 0
minimoElemento' [x] = x
minimoElemento' (x:xs) = min x (minimoElemento' xs)

--b) Defin ́ı la funci ́on minimoElemento’ de manera tal que el caso base de la recursi ́on sea el de la lista vac ́ıa.
-- Para ello revis ́a la clase Bounded. Ayuda: Para probar esta funci ́on dentro de ghci con listas vac ́ıas, indic ́a el
-- tipo concreto con tipos de la clase Bounded, por ejemplo: ([1,5,10]::[Int]), ([]::[Bool]), etc.

minimoElemento' :: (Bounded a, Ord a, Num a) => [a] -> a
minimoElemento' [] = maxBound --Nueutro Por la tablita de neutros
minimoElemento' [x] = x 
minimoElemento' (x:xs) = min x (minimoElemento' xs)

-- c) Us ́a la funci ́on minimoElemento para determinar la nota m ́as grave de la melod ́ıa: [Fa, La, Sol, Re, Fa]
-- En las definiciones de los ejercicios siguientes, deben agregar deriving s ́olo cuando sea estrictamente necesario.

--Lab 5)
--a)Implement ́a el tipo Deportista y todos sus tipos accesorios (NumCamiseta, Altura, Zona, etc) tal como est ́an definidos arriba.
-- Sinonimos de tipo
type Altura = Int
type NumCamiseta = Int

-- Tipos algebr ́aicos sin par ́ametros (aka enumerados)

data Zona = Arco | Defensa | Mediocampo | Delantera
data TipoReves = DosManos | UnaMano
data Modalidad = Carretera | Pista | Monte | BMX
data PiernaHabil = Izquierda | Derecha

-- Sin ́onimo

type ManoHabil = PiernaHabil

-- Deportista es un tipo algebraico con constructores param ́etricos

data Deportista = Ajedrecista −−Constructor sin argumentos
					| Ciclista Modalidad −− Constructor con un argumento
					| Velocista Altura −− Constructor con un argumento
					| Tenista TipoReves ManoHabil Altura −− Constructor con tres argumentos
					| Futbolista Zona NumCamiseta PiernaHabil Altura −− Constructor con cuatro argumentos

--b)  ¿Cu ́al es el tipo del constructor Ciclista?
Ciclista :: Modalidad -> Deportista

--c) Program ́a la funci ́on contar_velocistas :: [Deportista] -> Int que dada una lista de deportistas xs,
-- devuelve la cantidad de velocistas que hay dentro de xs. Programar contar_velocistas sin usar igualdad,
-- utilizando pattern matching.
contar_velocistas :: [Deportista] -> Int
contar_velocistas [] = 0
contar_velocistas = 1 + contar_velocistas xs 

--d y e) Program ́a la funci ́on contar_futbolistas :: [Deportista] -> Zona -> Int que dada una lista de deportistas xs, y una zona z, devuelve la cantidad de futbolistas incluidos en xs que juegan en la zona z. No
--usar igualdad, s ́olo pattern matching. el e) es usar filter. 

contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas xs zona = length (filter esFutbolistaEnZona xs)
															where
																esFutbolistaEnZona (Futbolista z _ _ _) = z == zona  
																esFutbolistaEnZona _ = False  lab 10)
-- LABORATORIO 10)
--a) Implement ́a la funci ́on sonidoNatural como est ́a definida arriba.
sonidoNatural :: NotaBasica -> Int
			sonidoNatural Do = 0
			sonidoNatural Re = 2
			sonidoNatural Mi = 4
			sonidoNatural Fa = 5
			sonidoNatural Sol = 7
			sonidoNatural La = 9
			sonidoNatural Si = 11

--b) Defin ́ı el tipo enumerado Alteracion que consta de los constructores Bemol, Natural y Sostenido.
data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si
data Alteracion = Bemol | Natural | Sostenido 

--c)Defin ́ı el tipo algebraico NotaMusical que debe tener un solo un constructor que llamaremos Nota el cual
-- toma dos par ́ametros. El primer par ́ametro es de tipo NotaBasica y el segundo de tipo Alteracion. De esta
-- manera cuando se quiera representar una nota alterada se puede usar como segundo par ́ametro del constructor
-- un Bemol o Sostenido y si se quiere representar una nota sin alteraciones se usa Natural como segundo par ́ametro.

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si
data Alteracion = Bemol | Natural | Sostenido 
type Nota = (NotaBasica, Alteracion)
data NotaMusical = Nota 

--d) Defin ́ı la funci ́on sonidoCromatico :: NotaMusical -> Int que devuelve el sonido de una nota, incre-
-- mentando en uno su valor si tiene la alteraci ́on Sostenido, decrementando en uno si tiene la alteraci ́on Bemol
-- y dejando su valor intacto si la alteraci ́on es Natural
data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si
data Alteracion = Bemol | Sostenido | Natural 
type Nota = (NotaBasica, Alteracion)
data NotaMusical = Nota 

sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota, Alteracion) = 
    let base = case nota of 			--Caso base de NotaMusical
                      Do  -> 0
                      Re  -> 2
                      Mi  -> 4
                      Fa  -> 5
                      Sol -> 7
                      La  -> 9
                      Si  -> 11
        ajuste = case Alteracion of		--Caso de alteracion, se agrega 1 o se descuenta 1.
                       Bemol     -> -1
                       Sostenido -> 1
                       Natural   -> 0
    in base + ajuste 		--Opera el 1.

--e) Inclu ́ı el tipo NotaMusical a la clase Eq de manera tal que dos notas que tengan el mismo valor de sonidoCromatico se consideren iguales.

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si
data Alteracion = Bemol | Sostenido | Natural 
type Nota = (NotaBasica, Alteracion)
data NotaMusical = Nota 
				deriving(Eq)

sonidoCromatico :: Eq => NotaMusical -> Int
sonidoCromatico (Nota, Alteracion) = 
    let base = case nota of 			--Caso base de NotaMusical
                      Do  -> 0
                      Re  -> 2
                      Mi  -> 4
                      Fa  -> 5
                      Sol -> 7
                      La  -> 9
                      Si  -> 11
        ajuste = case Alteracion of		--Caso de alteracion, se agrega 1 o se descuenta 1.
                       Bemol     -> -1
                       Sostenido -> 1
                       Natural   -> 0
    in base + ajuste 		--Opera el 1.

instance Eq Nota 
	where 
		Natural == Natural = sonidoCromatico Bemol == Bemol = sonidoCromatico Sostenido == Sostenido

--f) Inclu ́ı el tipo NotaMusical a la clase Ord definiendo el operador <=. Se debe definir que una nota es me-
-- nor o igual a otra si y s ́olo si el valor de sonidoCromatico para la primera es menor o igual al valor de
-- sonidoCromatico para la segunda.

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si
data Alteracion = Bemol | Sostenido | Natural 
type Nota = (NotaBasica, Alteracion)
data NotaMusical = Nota 
				deriving(Eq, Ord)

sonidoCromatico :: (Eq, Ord) => NotaMusical -> Int
sonidoCromatico (Nota, Alteracion) = 
    let base = case nota of 			--Caso base de NotaMusical
                      Do  -> 0
                      Re  -> 2
                      Mi  -> 4
                      Fa  -> 5
                      Sol -> 7
                      La  -> 9
                      Si  -> 11
        ajuste = case Alteracion of		--Caso de alteracion, se agrega 1 o se descuenta 1.
                       Bemol     -> -1
                       Sostenido -> 1
                       Natural   -> 0
    in base + ajuste 		--Opera el 1.

instance Eq Nota 
	where 
		Natural == Natural = sonidoCromatico Bemol == Bemol = sonidoCromatico Sostenido == Sostenido

instance Ord Nota
	where
		Bemol >= Natural >= Sostenido


--codigo de chat gipiti 
-- instance Eq NotaMusical where
--    (==) n1 n2 = sonidoCromatico n1 == sonidoCromatico n2

-- instance Ord NotaMusical where
--    (<=) n1 n2 = sonidoCromatico n1 <= sonidoCromatico n2
--    (<)  n1 n2 = sonidoCromatico n1 <  sonidoCromatico n2
--    (>=) n1 n2 = sonidoCromatico n1 >= sonidoCromatico n2
--    (>)  n1 n2 = sonidoCromatico n1 >  sonidoCromatico n2
--    compare n1 n2 = compare (sonidoCromatico n1) (sonidoCromatico n2)

--lab 11)

--a) a) Defin ́ı la funci ́on primerElemento que devuelve el primer elemento de una lista no vac ́ıa, o Nothing si la lista es vac ́ıa.
-- data Maybe a = Nothing | Just a		esta en el preludio. No es necesario definirlo.
primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xs) = head primerElemento xs 

--Lab 12)
--i. Program ́a las siguientes funciones:
data Deportista = Ajedrecista | Ciclista  | Velocista  | Tenista   | Futbolista     
data Cola = VaciaC | Encolada Deportista Cola

--a)atender :: Cola -> Maybe Cola, que elimina de la cola a la persona que est ́a en la primer posici ́on
-- de una cola, por haber sido atendida. Si la cola est ́a vac ́ıa, devuelve Nothing.

data Deportista = Ajedrecista | Ciclista  | Velocista  | Tenista   | Futbolista  deriving(Show)   
data Cola = VaciaC | Encolada Deportista Cola deriving(Show)

atender :: Cola -> Maybe Cola
atender VaciaC = Nothing  
atender (Encolada _ resto) = Just resto --El resto es un nombre que doy yo, que da valor al resto de la cola.

y::Cola
y = Encolada Tenista (Encolada Ciclista VaciaC)

--atender Encolada Ajedrecista (Encolada Ciclista (Encolada Velocista VaciaC))
--b)encolar :: Deportista -> Cola -> Cola, que agrega una persona a una cola de deportistas, en la
-- ́ultima posici ́on.
data Deportista = Ajedrecista | Ciclista  | Velocista  | Tenista   | Futbolista deriving (Show, Eq)    
data Cola = VaciaC | Encolada Deportista Cola deriving (Show, Eq)
encolar :: Deportista -> Cola -> Cola
encolar d VaciaC = Encolada d VaciaC
encolar d (Encolada d' cola) = Encolada d cola

y :: Cola 
y = Encolada Tenista (Encolada Ciclista (Encolada Velocista (Encolada Futbolista VaciaC)))

--para probar:
-- encolar y

--c)busca :: Cola -> Zona -> Maybe Deportista, que devuelve el/la primera futbolista dentro de la
--cola que juega en la zona que se corresponde con el segundo par ́ametro. Si no hay futbolistas jugando en esa zona devuelve Nothing.

--Sinonimos de tipo
type Altura = Int
type NumCamiseta = Int

--Tipos algebraicos sin par ́ametros (aka enumerados)

data Zona = Arco | Defensa | Mediocampo | Delantera
data PiernaHabil = Izquierda | Derecha

--coso
data Deportista = Ajedrecista | Ciclista  | Velocista  | Tenista   | Futbolista Zona  deriving(Show)   
--Necesario poner zona, por que si no estaria pidiendo un parametro que no existe.
data Cola = VaciaC | Encolada Deportista Cola 		deriving(Show)


busca :: Cola -> Zona -> Maybe Deportista 
busca VaciaC _ = Nothing --caso base
busca (Encolada d Zona) zona =  
	case d of 							--SI Y SOLO SI es futbolista, entra en case.
		Futbolista z -> if z == zona 				-- si es futbolista, que se fije si la zona esta en las zonas.
		_ -> busca cola zona 				-- Busca la zona.

y :: Cola 
y = Encolada Futbolista Delantera (Encolada Futbolista Defensa (Encolada Velocista (Encolada Futbolista Arco VaciaC)))

--II) Tail? Head? Una lista? 

--Lab 13)
--I)i. ¿Como se debe instanciar el tipo ListaAsoc para representar la informaci ́on almacenada en una gu ́ıa telef ́onica?
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b)
type Padron = ListaAsoc Int String  --(a == Int, b == String) Irrelevant.


type GuiaTelefonica = ListaAsoc String String -- (a == string, b == string )
guia :: GuiaTelefonica
guia = Nodo "Alice" "123-4567" (Nodo "Bob" "234-5678" Vacia) --"Pattern matching"

--II) 
--a)  la_long :: ListaAsoc a b -> Int que devuelve la cantidad de datos en una lista.
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b)

la_long :: ListaAsoc a b -> Int 
la_long Vacia = 0
la_long (Nodo _ _ resto) = 1 + la_long resto 

--b)  la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b, que devuelve la concatena- ci ́on de dos listas de asociaciones.
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b)

la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia otraLista = otraLista --Si no tiene nada la primera, doy la segunda 
la_concat (Nodo _ _ resto) otraLista = noda a b (la_concat resto otraLista) --resto == (la_concat resto otraLista)

--c) la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b, que agrega un nodo a la lista de asociaciones si la clave no est ́a en la lista, o actualiza el valor si la clave ya se encontraba.
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving (Eq, Show)

la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia _ _ = Nodo _ _ Vacia -- _ _ son a y b
la_agregar (Nodo a b resto) _ _ =
	| a == clave = nodo a valor resto 
	| otherwise = Nodo a b (la_agregar _ _ valor) --recursividad

--d) la_pares :: ListaAsoc a b -> [(a, b)] que transforma una lista de asociaciones en una lista de pares clave-dato.
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) 

la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia a b = [] 
la_pares (Nodo a b resto) = (a,b) : la_pares resto 

--e)la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b que dada una lista y una clave devuelve el dato asociado, si es que existe. En caso contrario devuelve Nothing.
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving (Eq, Show)

la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b 
la_busca Vacia a = Nothing 
la_busca (Nodo a b resto) a --Es mejor "decir que es b y q es a?"
	| a == a = just b
	| otherwise = la_busca resto a

--f)la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b que dada una clave a elimina la entrada en la lista.
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving (Eq, Show)

la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar _ Vacia = Vacia  -- Si la lista está vacía, no hay nada que eliminar, devuelve Vacia.
la_borrar clave (Nodo a b resto)
  | clave == a = resto  -- Si la clave coincide, elimina el nodo actual (devuelve el resto de la lista).
  | otherwise = Nodo a b (la_borrar clave resto)  -- Si no coincide, sigue buscando en el resto de la lista.



{-
consulta / dudas:

Bounded. 				DONE
Derivacion en cuantificaciones 	DONE 
Explicar algunos teoremas 
Una buena diferencia entre Type y Data 
En una derivacion, que sea de listas, tengo que hacer un caso de lista vacia, uno de un elemento de lista y otro de lista pegado un elemento? 
Data constructores
¿Como concluyo una derivacion modularizacio lo q sea?
type sinonimo de tipo. 

¿Como lee haskell todo lo de coso? Ej, lab 13, c) NO ENTIENDO LA LOGICA DE HASKELL
chusmear que se ve en c 

PONER MAP; FOLD; FILTER; DATA; ETC.
-}

{- 

-- Constructor
-- Un constructor es una función que crea instancias de tipos de datos. Ejemplo:
data Carrera = Matematica | Fisica | Computacion | Astronomia
-- Define el tipo 'Carrera' con cuatro constructores: Matematica, Fisica, Computacion, Astronomia

-- Cada uno de los constructores genera un valor del tipo `Carrera`. Por ejemplo, `Matematica` es un valor válido de `Carrera`.


-- Filter
-- `filter` es una función que selecciona los elementos de una lista que cumplen una condición dada.

filter :: (a -> Bool) -> [a] -> [a]
filter _ [] = []
filter p (x:xs) 
    | p x       = x : filter p xs
    | otherwise = filter p xs
-- Filtra los elementos de la lista que cumplen con la condición dada por la función p

-- Ejemplo:
-- filter (> 2) [1,2,3,4] -- Devolverá [3,4]


-- Polimorfismo
-- El polimorfismo permite que funciones operen en diferentes tipos de datos.

-- Polimorfismo ad hoc:
-- Definir instancias específicas para clases de tipos.

sumatoria :: Num a => [a] -> a
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs
-- Función polimórfica que funciona con cualquier tipo numérico (Int, Float, etc.)


-- Definición de Tipo de Datos
-- En Haskell, podemos definir nuevos tipos de datos, como `NotaBasica` para representar notas musicales.

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si
-- Define el tipo 'NotaBasica' con siete constructores que representan las notas musicales


-- Recursión
-- Muchas funciones en Haskell se definen de manera recursiva.

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs
-- Suma todos los elementos de una lista de forma recursiva


-- Pattern Matching
-- Permite definir funciones en base a diferentes patrones.

titulo :: Carrera -> String
titulo Matematica   = "Licenciatura en Matemática"
titulo Fisica       = "Licenciatura en Física"
titulo Computacion  = "Licenciatura en Computación"
titulo Astronomia   = "Licenciatura en Astronomía"
-- Devuelve el nombre completo de una carrera utilizando pattern matching


-- Clases de Tipos
-- Las clases de tipos permiten agrupar tipos que comparten ciertas operaciones.

class Eq a where
    (==) :: a -> a -> Bool

class Ord a where
    (<=) :: a -> a -> Bool
    min  :: a -> a -> a
    max  :: a -> a -> a
-- 'Eq' para tipos que soportan igualdad, y 'Ord' para tipos que soportan orden


-- Cuantificadores en Haskell
-- Las expresiones cuantificadas se usan para formalizar la especificación de funciones.
-- Por ejemplo, una suma de cuadrados:

sumCuadrados :: [Int] -> Int
sumCuadrados xs = sum [x * x | x <- xs]
-- Calcula la suma de los cuadrados de los elementos de la lista


-- Case
-- La estructura `case` se utiliza para evaluar patrones de forma explícita.

esPar :: Int -> Bool
esPar n = case n `mod` 2 of
    0 -> True
    _ -> False
-- Evalúa si un número es par usando 'case'


-- Where
-- `where` permite definir expresiones auxiliares dentro de una función.

hipotenusa :: Float -> Float -> Float
hipotenusa a b = sqrt (cuadrado a + cuadrado b)
  where
    cuadrado x = x * x
-- Define una función auxiliar cuadrado dentro de hipotenusa usando 'where'


-- Take
-- `take` toma los primeros `n` elementos de una lista.

primeros :: Int -> [a] -> [a]
primeros n lista = take n lista
-- Devuelve los primeros n elementos de la lista


-- Head
-- `head` devuelve el primer elemento de una lista.

primero :: [a] -> a
primero lista = head lista
-- Devuelve el primer elemento de una lista


-- Tail
-- `tail` devuelve todos los elementos de una lista excepto el primero.

resto :: [a] -> [a]
resto lista = tail lista
-- Devuelve la lista sin el primer elemento
-}



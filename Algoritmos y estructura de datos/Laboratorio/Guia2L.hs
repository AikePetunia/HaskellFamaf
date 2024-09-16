Lab 1)
sum cuad.xs = ⟨ Sum i : 0 ≤ i < length.xs : xs.i ∗ xs.i⟩ 
La sumatoria de los números de una lista multiplicados por sí mismos

sumCuad :: [Int] -> Int
sumCuad [] = 0					1
sumCuad (x:xs) = x * x + sumCuad xs		2

chekiada!

[1,2,3]

	sumCuad [1,2,3]
={Notacion en terminos de constructores}
	sumCuad 1:2:3:[]
={Matcheo caso  2}
	1 * 1 + sumCuad 2:3:[]
={matcheo caso 2 }
	1 + ( 2 * 2 + sumCuad 3: [])
={Matcheo caso 2}
	1 + ( 4 + ( 3 * 3 + sumCuad []))
={Matcheo caso vacio y aritmetica }
	1 

Asumo que e = True 
iga.e.xs = ⟨ ∀ i : 0 ≤ i < #xs : xs.i = e ⟩ 
Para todo elemento en la lista xs, hay un elemento igual a true

igaE :: [Int] -> Bool
igaE [] = True					1
igaE (x:xs) = x == x && igaE xs			2

expXN :: Int -> Int -> Int
expXN x n = x^n + expXN

sum par.n = ⟨ Sum i : 0 ≤ i ≤ n ∧ par.i : i⟩ donde par.i .= i mod 2 = 0. 
Suma todo número par.

sumPar :: [Int] -> Int
sumPar [] = 0							1
sumPar (x:xs) | x `mod` 2 == 0 = x + sumPar xs			2
	      | otherwise = sumPar xs				3

cuantos.p.xs = ⟨N i : 0 ≤ i < #xs : p.(xs.i)⟩ 
Cuenta cuantas p hay en una lista

cuantosP :: [Char] -> Int
cuantosP [] = 0						1
cuantosP (x:xs) | x /= 'p' = cuantosP xs 		2
		| x == 'p' = 1 + cuantosP xs		3
	
['p','p','a']

	cuantosP ['p','p','a']
={Notacion en terminos de consturcotres}
	cuantosP 'p':'p':'a':[]
={Matcheo caso 3}
	1 + (cuantosP 'p':'a':[])
={Matcheo caso 3 }
	1 + (1 + (cuantosP 'a':[]))
={Matcheo caso 2}
	1 + (1 (cuantosP []))
={Caso base 1 y aritmetica}
	2

lab clase)
where, case, tipo de datos (data)

Laboratorio 2)
A, B)
data Carrera = Matematica | Fisica | Computacion | Astronomia

titulo :: Carrera -> String
titulo n | n == "Matematica" = "Licenciatura en matematica"
	 | n == "Fisica" = "Licenciatura en fisica"
	 | n == "Computacion" = "Licenciatura en computacion"
	 | n == "Astronomia" = "Licenciatura en astronomia"

Alternativamente

data Carrera = Matematica | Fisica | Computacion | Astronomia

titulo :: Carrera -> String
titulo n = case n of
    Matematica    -> "Licenciatura en matematica"
    Fisica        -> "Licenciatura en fisica"
    Computacion   -> "Licenciatura en computacion"
    Astronomia    -> "Licenciatura en astronomia"
    
Alternativamente

data Carrera = Matematica | Fisica | Computacion | Astronomia 

titulo :: Carrera -> String
titulo    Matematica    = "Licenciatura en matematica"
titulo    Fisica        = "Licenciatura en fisica"
titulo    Computacion   = "Licenciatura en computacion"
titulo    Astronomia    = "Licenciatura en astronomia"

C, D)

data NotaBasicas = Do | Re | Mi | Fa | Sol | La | Si

cifradoAmericano :: NotaBasicas -> Char
cifradoAmericano Do = 'c'
cifradoAmericano Re = 'd'
cifradoAmericano Mi = 'e'
cifradoAmericano Fa = 'f'
cifradoAmericano Sol ='g'
cifradoAmericano La = 'a'
cifradoAmericano Si = 'b'
Alternativamente

data NotaBasicas = Do | Re | Mi | Fa | Sol | La | Si

cifradoAmericano : : NotaBasicas −> Char
cifradoAmericano n = case n of 
			Do = 'c'
 			Re = 'd'
 			Mi = 'e'
 			Fa = 'f'
 			Sol ='g'
 			La = 'a'
 			Si = 'b'


Lab 3)

a)


data NotaBasicas = Do | Re | Mi | Fa | Sol | La | Si
    deriving (Eq, Show, Ord, Bounded, Enum)
		
Lab 4)

minimoElemento :: (Ord a, Num a) => [a] -> a
minimoElemento [] = 0
minimoElemento [x] = x
minimoElemento (x:xs) = min x (minimoElemento xs)



a)
minimoElemento' :: (Ord a, Bounded a) => [a] -> a
minimoElemento' [] = 0
minimoElemento' [x] = x
minimoElemento' (x:xs) = min x (minimoElemento' xs)

b)
minimoElemento' :: (Bounded a, Ord a, Num a) => [a] -> a
minimoElemento' [] = maxBound --Nueutro Por la tablita de neutros
minimoElemento' [x] = x 
minimoElemento' (x:xs) = min x (minimoElemento' xs)

Lab 5)
a)

−− Sinonimos de tipo
type Altura = Int
type NumCamiseta = Int

−− Tipos algebr ́aicos sin par ́ametros (aka enumerados)

data Zona = Arco | Defensa | Mediocampo | Delantera
data TipoReves = DosManos | UnaMano
data Modalidad = Carretera | Pista | Monte | BMX
data PiernaHabil = Izquierda | Derecha

−− Sin ́onimo

type ManoHabil = PiernaHabil

−− Deportista es un tipo algebraico con constructores param ́etricos

data Deportista = Ajedrecista −−Constructor sin argumentos
					| Ciclista Modalidad −− Constructor con un argumento
					| Velocista Altura −− Constructor con un argumento
					| Tenista TipoReves ManoHabil Altura −− Constructor con tres argumentos
					| Futbolista Zona NumCamiseta PiernaHabil Altura −− Constructor con cuatro argumentos

b) Ciclista :: Modalidad -> Deportista

c)
contar_velocistas :: [Deportista] -> Int
contar_velocistas [] = 0
contar_velocistas = 1 + contar_velocistas xs 

d y e)

contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas xs zona = length (filter esFutbolistaEnZona xs)
															where
																esFutbolistaEnZona (Futbolista z _ _ _) = z == zona  
																esFutbolistaEnZona _ = False  lab 10)

a)
sonidoNatural :: NotaBasica -> Int
			sonidoNatural Do = 0
			sonidoNatural Re = 2
			sonidoNatural Mi = 4
			sonidoNatural Fa = 5
			sonidoNatural Sol = 7
			sonidoNatural La = 9
			sonidoNatural Si = 11

b)
data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si
data Alteracion = Bemol | Natural | Sostenido 

c)
data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si
data Alteracion = Bemol | Natural | Sostenido 
type Nota = (NotaBasica, Alteracion)
data NotaMusical = Nota 

d)

--De esta manera cuando se quiera representar una nota alterada se puede usar como segundo par ́ametro del constructor
--un Bemol o Sostenido y si se quiere representar una nota sin alteraciones se usa Natural como segundo
--parametro.
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

e) 
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

f) 
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

lab 11)

a)
-- data Maybe a = Nothing | Just a		esta en el preludio. No es necesario definirlo.
primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xs) = head primerElemento xs 

Lab 12)
data Deportista = Ajedrecista | Ciclista  | Velocista  | Tenista   | Futbolista     
data Cola = VaciaC | Encolada Deportista Cola

a)

data Deportista = Ajedrecista | Ciclista  | Velocista  | Tenista   | Futbolista  deriving(Show)   
data Cola = VaciaC | Encolada Deportista Cola deriving(Show)

atender :: Cola -> Maybe Cola
atender VaciaC = Nothing  
atender (Encolada _ resto) = Just resto --El resto es un nombre que doy yo, que da valor al resto de la cola.

y::Cola
y = Encolada Tenista (Encolada Ciclista VaciaC)

--atender Encolada Ajedrecista (Encolada Ciclista (Encolada Velocista VaciaC))
b)
data Deportista = Ajedrecista | Ciclista  | Velocista  | Tenista   | Futbolista deriving (Show, Eq)    
data Cola = VaciaC | Encolada Deportista Cola deriving (Show, Eq)
encolar :: Deportista -> Cola -> Cola
encolar d VaciaC = Encolada d VaciaC
encolar d (Encolada d' cola) = Encolada d cola

y :: Cola 
y = Encolada Tenista (Encolada Ciclista (Encolada Velocista (Encolada Futbolista VaciaC)))

--para probar:
-- encolar y

c)

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

II) Tail? Head? Una lista? 

Lab 13)
I)
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b)
type Padron = ListaAsoc Int String  --(a == Int, b == String) Irrelevant.


type GuiaTelefonica = ListaAsoc String String -- (a == string, b == string )
guia :: GuiaTelefonica
guia = Nodo "Alice" "123-4567" (Nodo "Bob" "234-5678" Vacia) --"Pattern matching"

II) 
a) 
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b)

la_long :: ListaAsoc a b -> Int 
la_long Vacia = 0
la_long (Nodo _ _ resto) = 1 + la_long resto 

b) 
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b)

la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia otraLista = otraLista --Si no tiene nada la primera, doy la segunda 
la_concat (Nodo _ _ resto) otraLista = noda a b (la_concat resto otraLista) --resto == (la_concat resto otraLista)

c) 
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving (Eq, Show)

la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia _ _ = Nodo _ _ Vacia -- _ _ son a y b
la_agregar (Nodo a b resto) _ _ =
	| a == clave = nodo a valor resto 
	| otherwise = Nodo a b (la_agregar _ _ valor) --recursividad

d) 
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) 

la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia a b = [] 
la_pares (Nodo a b resto) = (a,b) : la_pares resto 

e)
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving (Eq, Show)

la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b 
la_busca Vacia a = Nothing 
la_busca (Nodo a b resto) a --Es mejor "decir que es b y q es a?"
	| a == a = just b
	| otherwise = la_busca resto a

f)
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving (Eq, Show)

la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar _ Vacia = Vacia  -- Si la lista está vacía, no hay nada que eliminar, devuelve Vacia.
la_borrar clave (Nodo a b resto)
  | clave == a = resto  -- Si la clave coincide, elimina el nodo actual (devuelve el resto de la lista).
  | otherwise = Nodo a b (la_borrar clave resto)  -- Si no coincide, sigue buscando en el resto de la lista.

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
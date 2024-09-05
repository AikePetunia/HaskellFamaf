0) Logica proposicional salteado, redundate.
1)
a)Dada una lista de números enteros, que devuelve un único elemento entero de forma recursiva, siendo el caso base una lista vacía de enteros devolviendo 0, siendo el 2 caso definido por como funciona la sumatoria en lenguaje matemático en programación.
b)
  <Sum i : 0<= i < n : xs.i>
c)
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

2 y lab 1) FALTA DERIVAR ESPEC. 
a) 
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

Derivacion:

La funcion sum y lenght estan definidas como:

sum [] = 0
sum (x:xs) = x + sum xs 

length [] = 0 
length (x:xs) = 1 + length xs 

Sabiendo esto puedo derivar la especifiacion:

sum cuad.xs = ⟨Sum i :0 ≤ i < length.xs: xs.i ∗ xs.i⟩ 

1) Caso base, asumo que xs = []

={xs = [], sustituyo }
	sumCuad [] = ⟨Sum i :0 ≤ i < length.[]: [].i ∗ [].i⟩
={Def. de length en lista vacia}
	sumCuad [] = ⟨Sum i :0 ≤ i < 0: [].i ∗ [].i⟩
={False}
	sumCuad [] = ⟨Sum i : False : [].i ∗ [].i⟩
={rango vacio}
	False --Alternativamente, 0

2)Paso inductivo, demuestro que vale para x:xs 

={xs = x:xs, sustituyo}
	sumCuad.xs = ⟨Sum i :0 ≤ i < length.(x:xs) : (x:xs).i ∗ (x:xs).i⟩ 
={ Definicion de length en caso recursivo}
	sumCuad.xs = ⟨Sum i :0 ≤ i <  1 + length.xs: (x:xs).i ∗ (x:xs).i⟩ 
= {Separacion de termino }
	sumCuad.xs = ⟨Sum i : i = 0 v 0 ≤ i <  length.xs: (x:xs).i ∗ (x:xs).i⟩ 
={Separacion de termino}
	sumCuad.xs  = (x:xs).0 +⟨Sum i : 0 ≤ i < length.xs: (x:xs).(i + 1) ∗ (x:xs).(i + 1)⟩ 
={Def de .}
	sumCuad.xs  = x +⟨Sum i : 0 ≤ i < length.xs: (x:xs).i ∗ (x:xs).i⟩ 

b) 
Asumo que e = True 
iga.e.xs = ⟨ ∀ i : 0 ≤ i < #xs : xs.i = e ⟩ 
Para todo elemento en la lista xs, hay un elemento igual a true

igaE :: [Int] -> Bool
igaE [] = True					1
igaE (x:xs) = x == x && igaE xs			2

[1,1,1]

	igaE [1,1,1]
={Notacion en terminos de constructores
	igaE 1:1:1:[]
={Matcheo caso 2}
	1 == 1 && igaE 1:1:[]
={Matcheo caso 2}
	1 == 1 && igaE 1:[]
={Matcheo caso 2}
	1 == 1 && igaE []
={Caso base}
	True
	
	Caso base: 
   iga.e.[  ]
= { especificación de iga }
〈 ∀ i : 0 ≤ i < #[ ] :  [ ] ! i = e 〉
= { def # }
〈 ∀ i : 0 ≤ i < 0 :  [ ] ! i = e 〉
= { lógica }
〈 ∀ i : False :  [ ] ! i = e 〉
= { rango vacío }
  True

Paso inductivo:
En la derivación, voy a partir de  “iga.e.(x►xs)”  y quiero llegar a algo que sea ejecutable / programable. En el medio, seguramente voy a necesitar hacer que aparezca la llamada recursiva  “iga.e.xs”. Para eso necesito plantear mi Hipótesis Inductiva:
H.I. :   iga.e.xs = 〈 ∀ i : 0 ≤ i < #xs :  xs ! i = e 〉
Vamos a eso:
  iga.e.(x►xs)
= { especificación }
  〈 ∀ i : 0 ≤ i < #(x►xs) :  (x►xs) ! i = e 〉
= { def # }
  〈 ∀ i : 0 ≤ i < #xs + 1 :  (x►xs) ! i = e 〉
= { APLICAMOS ESTRATEGIA: 
0 ≤ i < #xs + 1  es lo mismo que  (i = 0)  ∨ (1 ≤  i  < #xs+1)  }
  〈 ∀ i : (i = 0)  ∨ (1 ≤  i  < #xs+1) :  (x►xs) ! i = e 〉
= { partición de rango }
  〈 ∀ i : i = 0 :  (x►xs) ! i = e 〉 ∧
  〈 ∀ i : 1 ≤  i  < #xs+1 :  (x►xs) ! i = e 〉
= { probemos de nuevo cambio de variable i → i + 1}
  〈 ∀ i : i = 0 :  (x►xs) ! i = e 〉 ∧
  〈 ∀ i : 1 ≤  i + 1  < #xs+1 :  (x►xs) ! (i + 1) = e 〉
= { algebra (resto 1 en los tres miembros de la desigualdad) }
  〈 ∀ i : i = 0 :  (x►xs) ! i = e 〉 ∧
  〈 ∀ i : 0 ≤  i  < #xs :  (x►xs) ! (i + 1) = e 〉
= { def. ! }
  〈 ∀ i : i = 0 :  (x►xs) ! i = e 〉 ∧
  〈 ∀ i : 0 ≤  i  < #xs :  xs ! i = e 〉
= { llegamos a la Hipótesis Inductiva !! }
  〈 ∀ i : i = 0 :  (x►xs) ! i = e 〉 ∧  iga.e.xs
= {  rango unitario }
   (x►xs) ! 0 = e  ∧  iga.e.xs
= { acá ya es un programa correcto pero igual puedo simplificar aplicando def ! }
   x = e  ∧  iga.e.xs

Listo. Resultado final:

iga : Int -> [Int] -> Bool
iga.e.[  ] ≐ True
iga.e.(x ►xs) ≐ (x = e) ∧ iga.e.xs

c) 
exp.x.n = x^n 
número x elevado a un exponente positivo n

expXN :: Int -> Int -> Int
expXN x n = x^n + expXN

2 2

	expXN 2 2 
={Matcheo caso 2}
	2²
={Aritmetica}
	4

d) 
sum par.n = ⟨ Sum i : 0 ≤ i ≤ n ∧ par.i : i⟩ donde par.i .= i mod 2 = 0. 
Suma todo número par.

sumPar :: [Int] -> Int
sumPar [] = 0							1
sumPar (x:xs) | x `mod` 2 == 0 = x + sumPar xs			2
	      | otherwise = sumPar xs				3
	    
Chekiado !

[2,2, 3]
	sumPar [2, 2, 3]
={Notacion en terminos de constructores}
	sumPar 2:2:3[]
={Matcheo caso 2}
	2 + sumPar 2:3:[]
={Matcheo caso 2}
	 2 + (2 + sumPar 3:[])
={Matcheo caso 3}
	2 + 2 + (sumPar [])
={Matcheo caso 1 y aritmetica}
	4

e) 
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
3)
Evaludadas en el punto 2
a)[1,2,3]
b)[1,1,1]	
c)2 2 
d)[2,2,3]
e)['p','p','a']

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


consulta / dudas:
Bounded. 				DONE
Derivacion en cuantificaciones 	DONE 
Explicar algunos teoremas 

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
																esFutbolistaEnZona _ = False  

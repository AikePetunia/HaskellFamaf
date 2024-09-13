
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

d) 
	<Sum i : 0 <= i < #xs : xs.i >

1. Caso base, xs = []

	<Sum i : 0 <= i < #xs : xs.i >
={xs = []}
	<Sum i : 0 <= i < 0 : [].i >
={Def de legnth de lista vacia}
	<Sum i :False  : [].i >
={Rango vacio, neutro de sum}
	0

2. Hipotesis inductiva sum.xs = <Sum i : 0 ≤  i < #xs : xs.i >

3. Paso inductivo, demuestro que vale para xs=x:xs

	<Sum i : 0 <= i < #(x:xs) : (x:xs).i >
={Def. de length en recursion}
	<Sum i : 0 <= i < 1 + #xs : (x:xs).i >
={ (i = 0)  ∨ (1 ≤  i  < #xs+1) }
	<Sum i : (i = 0)  ∨ (1 ≤  i  < #xs+1) : (x:xs).i > (¿no entiendo, dice que es impotente pero no hay otra manera de seguirlo mas que haciendolo idempotante)
={Particion de rango} 
	<Sum i : 1 ≤  i  < #xs + 1 : xs.i > + <Sum i : i = 0 : (x:xs).i >
={Hago cambio de variable, i = i + 1}
	<Sum i : 1 ≤  i + 1  < #xs + 1 : (x:xs).(i + 1) > + <Sum i : i = 0 : (x:xs).i >
={Algebra, cancelo los +1 term izq}
	<Sum i : 0 ≤  i < #xs : (x:xs).(i + 1) > + <Sum i : i = 0 : (x:xs).i >
={Def de .i+1}
	<Sum i : 0 ≤  i < #xs : xs.i > + <Sum i : i = 0 : (x:xs).i >
={Term. Derecho, i = 0, entonces toma x}
	<Sum i : 0 ≤  i < #xs : xs.i > + <Sum i : i = 0 : x>
={termino de constante}
	<Sum i : 0 ≤  i < #xs : xs.i > + x


2 y lab 1) 
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

sumcuad.xs = ⟨Sum i :0 ≤ i < length.xs: xs.i ∗ xs.i⟩ 

1) Caso base, asumo que xs = []

={xs = [], sustituyo }
	sumCuad [] = ⟨Sum i :0 ≤ i < length.[]: [].i ∗ [].i⟩
={Def. de length en lista vacia}
	sumCuad [] = ⟨Sum i :0 ≤ i < 0: [].i ∗ [].i⟩
={Logica}
	sumCuad [] = ⟨Sum i : False : [].i ∗ [].i⟩
={Rango vacio para sum}
	0
	
2. Hipotesis inductiva, pues:
	sumcuad.xs = ⟨Sum i :0 ≤ i < #.xs: xs.i ∗ xs.i⟩ 
	
3.Paso inductivo, demuestro que vale para x:xs 
	⟨Sum i :0 ≤ i < length.xs: xs.i ∗ xs.i⟩ 
={xs = x:xs, sustituyo}
	⟨Sum i :0 ≤ i < length.(x:xs) : (x:xs).i ∗ (x:xs).i⟩ 
={ Definicion de length en caso recursivo}
	⟨Sum i :0 ≤ i <  1 + length.xs: (x:xs).i ∗ (x:xs).i⟩ 
= {(i = 0)  ∨ (1 ≤  i  < #xs+1) }
	⟨Sum i : (i = 0)  ∨ (1 ≤  i  < #xs+1): (x:xs).i ∗ (x:xs).i⟩ 
={Separacion de termino}
	⟨Sum i : (i = 0) : (x:xs).i ∗ (x:xs).i⟩ + ⟨Sum i : (1 ≤  i  < #xs+1): (x:xs).i ∗ (x:xs).i⟩ 
={Hago i = i +1 para hacer algebra}
	⟨Sum i : (i = 0) : (x:xs).i ∗ (x:xs).i⟩ + ⟨Sum i : 0 ≤  i  < #xs: (x:xs).(i + 1) ∗ (x:xs).(i + 1)⟩
={Aplico def de .i + 1}
	⟨Sum i : (i = 0) : (x:xs).i ∗ (x:xs).i⟩ + ⟨Sum i : 0 ≤  i  < #xs: xs.i * xs.i⟩
={ como i = 0, aplico y hago termino de constante}
	x * x + ⟨Sum i : 0 ≤  i  < #xs: xs.i * xs.i⟩

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

	Derivacion
	
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


Derivacion:

1. Caso base, n = 0
	x^n 
={n = 0, algebra}
	1

2. HI, expXN = x^n 

3. Paso inductivo para n+1

	x^n+1
={Algebra}
	x^n * x ?

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

La derivacion tiene dos casos. 

Caso base, n = 0 , y voy a aplicar i mod 2 de una. 

	⟨Sum i : 0 ≤ i ≤ 0 ∧ i mod 2 = 0 : i⟩
={Rango false y abs}
	⟨Sum i : False  : i⟩
={rango vacio de sum}
	0

Hipotesis inductiva, sumParN = ⟨Sum i : 0 ≤ i ≤ n ∧ i mod 2 = 0 : i⟩

Paso inductivo, para n + 1. Tener en cuenta que son dos casos, uno para mod = 0, y otro para mod /= 1
 
		⟨Sum i : 0 ≤ i ≤ n+1 ∧ i mod 2 = 0 : i⟩
	={Def de n +1 en rango,(i = 0)  ∨ (1 ≤  i  < n+1)  }
		⟨Sum i : ((i = 0)  ∨ (1 ≤  i  < n+1)) ∧ i mod 2 = 0 : i⟩
	={Distributividad de ^ con v y particion de rango}
		⟨Sum i : (1 ≤  i  < n+1) ∧ i mod 2 = 0 : i⟩ + ⟨Sum i : (i = 0) ∧ i mod 2 = 0 : i⟩
	={cambio de var i = i + 1, y algebra}
		⟨Sum i : (0 ≤  i  < n) ∧ (i + 1) mod 2 = 0 : i⟩ + ⟨Sum i : (i = 0) ∧ i mod 2 = 0 : i⟩
	={i = 0, evaluo siendo true por algebra}
		⟨Sum i : (0 ≤  i  < n) ∧ (i + 1) mod 2 = 0 : i⟩ + ⟨Sum i : True : i⟩
	={Evaluo i + 1, siendo false}
		⟨Sum i : False : i⟩ + ⟨Sum i : True : i⟩ ?

	OTRA MANERA:

	={Def de 0 ≤ i < n ∨ i = n   }
		⟨Sum i : (0 ≤ i < n ∨ i = n) ∧ i mod 2 = 0 : i⟩
	={Distributividadq de y con o}
		⟨Sum i : n mod 2 = 0 : n⟩ + ⟨Sum i : 0 ≤ i < n  ∧ i mod 2 = 0 : i⟩
	={Cambio con i = n}
		⟨Sum i : n mod 2 = 0 : n⟩ + ⟨Sum i : 0 ≤ i < n  ∧ i mod 2 = 0 : i⟩ç
	={Del lado HI, en izq true si y solo si n es par, false si es impar }
		True/False + HI 

CONSULTAR

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

	Derivacion:

	cuantos.p.xs = ⟨N i : 0 ≤ i < #xs : p.(xs.i)⟩

1) Caso base, xs = []

	cuantos.p.xs = ⟨N i : 0 ≤ i < #xs : p.(xs.i)⟩
={ xs = []}	
	cuantos.p.xs = ⟨N i : 0 ≤ i < #[] : p.([].i)⟩
={#[] = 0}
	cuantos.p.xs = ⟨N i : 0 ≤ i < 0 : p.([].i)⟩
={Rango false}
	cuantos.p.xs = ⟨N i : False : p.([].i)⟩
={Rango vacio}
	0

2) Hipotesis inductiva	
		cuantos.p.xs = ⟨N i : 0 ≤ i < #xs : p.(xs.i)⟩

3)Paso inductivo, xs= x:xs

	⟨N i : 0 ≤ i < #(x:xs) : p.((x:xs).i)⟩
={Def. de length xs}	
	⟨N i : 0 ≤ i < 1 + #xs : p.((x:xs).i)⟩
={Rango de i}
	⟨N i : (i = 0 v 1 <= i < n + 1) : p.((x:xs).i)⟩
={Particion de rango}
	⟨N i : i = 0 : p.((x:xs).i)⟩ + ⟨N i : 1 <= i < n + 1 : p.((x:xs).(i + 1)⟩  
={Rango unitario}
	⟨N i : i = 0 : p.((x:xs).0)⟩ + ⟨N i : 1 <= i < n + 1 : p.((x:xs).(i + 1)⟩  
={Def de . y termino de constante}
	p.x + ⟨N i : 1 <= i < n + 1 : p.((x:xs).(i + 1))⟩  
={Cambio de variable, i = i + 1 y algebra}
	p.x + ⟨N i : 0 <= i < n : p.((x:xs).(i + 1)⟩
={Def de .}
	p.x + ⟨N i : 0 <= i < n : p.(xs.i)⟩
={Valido por hi}
	
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

Salteados Lab 5-Lab9 (Por cuestiones de derivacion)

4
	a)
	f : Num → Nat → Num
	 f.x.n = <Sum i : 0 ≤ i < n : x^i>			--x /= 0

1) Caso base, n = 0

	f.x.0 
={especificacion}
	<Sum i : 0 ≤ i < 0 : x^i>
={rango false, y rango vacio}
	0

2) Planteo de HI 
	f.x.n = <Sum i : 0 ≤ i < n : x^i>			--x /= 0

3) Paso inductivo, muestro para n = n + 1

	f.x.(n + 1)
={Especificacion}
	<Sum i : 0 ≤ i < (n + 1) : x^i>
={Uso 0 ≤ i < n  ∨  i = n }
	<Sum i : 0 ≤ i < n  ∨  i = n : x^i> 
={Particion de rango}
	<Sum i : 0 ≤ i < n : x^i> + <Sum i : i = n : x^i>
={Hipotesis inductiva }
	f.x.n + <Sum i : i = n : x^i>
={Rango unitario}
	f.x.n + x^n  
={Como la potencia no esta escrita, definida o programada, se modulariza para x^n. Asignemos
	exp.xn = x^n}
 
Quedando: 
	f.x.n + exp.xn   <-- Ahora debo derivar exp.xn creandome una especificacion para el mismo 

	exp.xn = x^n 

	Caso base n = 0

		x^0
	={Algebra}
		1

	Hipotesis inductiva: 
		exp.xn = x^n

	Caso inductivo, n = n +1

		exp.x(n+1)
	={Especificacion}
		x^n+1
	={Propiedad de potencias}
		x^n * x 
	={HI}
		exp.x.n * x

Siendo valida la especificacion como 

<Sum i : 0 ≤ i < n : x^i> = f.x.n + exp.xn 

<Sum i : 0 ≤ i < n : x^i> = f.x.n  y 
x^n = exp.xn 

b) 

	pi : Nat → Num 
pi.n = 4 ∗ <Sum i : 0 ≤ i < n : (−1)^i /(2 ∗ i + 1)

	Caso base, n = 0
		pi.0 
	={Especificacion}
		<Sum i : 0 ≤ i < 0 : (−1)^i /(2 ∗ i + 1)>
	={rango vacio}
		0 

	Hipotesis inductiva. 
		pi.n = <Sum i : 0 ≤ i < 0 : (−1)^i /(2 ∗ i + 1)>

	Paso inductivo, n = n + 1 

		pi.(n + 1)
	={Especificacion}
		<Sum i : 0 ≤ i < n + 1 : (−1)^i /(2 ∗ i + 1)>
	={0 ≤ i < n  ∨  i = n }
		<Sum i : 0 ≤ i < n  ∨  i = n : (−1)^i /(2 ∗ i + 1)>
	={Particion de rango }
		<Sum i : 0 ≤ i < n : (−1)^i /(2 ∗ i + 1)> + <Sum i : i = n : (−1)^i /(2 ∗ i + 1)>
	={ Termino de constante }
		<Sum i : 0 ≤ i < n : (−1)^i /(2 ∗ i + 1)> + (−1)^n /(2 ∗ i + 1)
	={ HI }
		pi.n + (−1)^n / (2 ∗ i + 1)
	={Ambos terminos no definidos, hago especificaciones para cada uno y modularizo, denotems 
		(1) pot.n = (-1)^n 
		(2) numImpar = (2 * i + 1}

Quedando:
	pi.n + pot.n / numImpar 

(1) pot.n
	pot.n = -1^n 

	Caso base n = 0
		pot.0
	={Especificacion}
		-1^0
	={Algebra}
		1

	Hipotesis inductiva: 
		pot.n = -1^n

	Caso inductivo, n = n +1

		pot.(n+1)
	={Especificacion}
		-1^n+1
	={Propiedad de potencias}
		-1^n * (-1) 
	={HI}
		pot.n * (-1)

(2)
numImpar.n = <Sum i : 0 <= i < n : 2 * i + 1 >

	1)Caso base n = 0

		numImpar.0 
	={Especificacion}
		<Sum i : 0 <= i < 0 : 2 * i + 1 >
	={Rango vacio}
		0

	2) Hipotesis inductiva
		numImpar.n = <Sum i : 0 <= i < n : 2 * i + 1 >

	3) Paso inductivo, para n = n+1
		
		numImpar.(n+1)
	={Especificacion }
		<Sum i : 0 <= i < n : 2 * i + 1 >
	={ 0 ≤ i < n  ∨  i = n }
		<Sum i : 0 ≤ i < n  ∨  i = n : 2 * i + 1 >
	={Particion de rango}		
		<Sum i : i = n : 2 * i + 1 > + <Sum i : 0 ≤ i < n : 2 * i + 1 >
	={Rango unitario y HI }
		2 * n + 1 + numImpar.n 

Quedando toda la especificacion:

pi : Nat → Num 
pi.n = 4 ∗ <Sum i : 0 ≤ i < n : (−1)^i /(2 ∗ i + 1)

Como : 
	pi.n + pot.n / numImpar.n 


c)

	f : Nat → Nat
	f.x = x^3

	Caso base x = 0

		f.0 
	={Especificacion}
		0^3
	={Algebra}
		0

	Hipotesis Inductiva
		f.x = x³

	Caso inductivo, para x= x +1 

		f.(x+1)
	={Especificacion}
		(x+1)³
	={Algebra}
		(x+1) * (x+1) * (x+1) =
		(x^2 + 2x + 1) * (x + 1) =
		x^3 + 2x^2 + x + x^2 + 2x + 1 =
		x^3 + 3x^2 + 3x + 1
	={Hipotesis inductiva}
		f.x + 3x² + 3x + 1
	={Modularizo para: 
	(1)	cuadrado.x = x^2 }

(1)
	Caso base, x = 0

		cuadrado.0
	={Especificacion}
		0²
	={Algebra}
		1

	Hipotesis inductiva
		cuadrado.x = x^2

	Caso inductivo, para x = x + 1

		cuadrado.(x+1)
	={Especificacion}
		(x+1)²
	={Algebra}
		x² + 2x + 1
	={HI}
		Cuadrado.x + 2x + 1

Para 3x, y 2x es simplemente sumar x + x + x +x +x y +1 + 1

	cubo :: Nat -> Nat
	cubo.0 = 0
	cubo.(x+1) = cubo.x + cuadrado.x + cuadrado.x + cuadrado.x + x + x + x + 1

	cuadrado :: Nat -> Nat
	cuadrado.0 = 0
	cuadrado.(x+1) = cuadrado.x + x + x + 1

d)

	f.xs = ⟨ ∃ i : 0 < i ≤ #xs : ⟨Prod j : 0 ≤ j < #(xs↓i) : (xs↓i).j ⟩ = xs.(i − 1) ⟩

	Caso base, xs = []
	
		f.[]
	={especificacion}
		⟨ ∃ i : 0 < i ≤ #[] : ⟨Prod j : 0 ≤ j < #([]↓i) : ([]↓i).j ⟩ = [].(i − 1) ⟩
	={Length caso base}
		⟨ ∃ i : 0 < i ≤ 0 : ⟨Prod j : 0 ≤ j < #([]↓i) : ([]↓i).j ⟩ = [].(i − 1) ⟩
	={Logica y Rango vacio}
		False	

	Hipotesis inductiva
		f.xs = ⟨ ∃ i : 0 < i ≤ #xs : ⟨Prod j : 0 ≤ j < #(xs↓i) : (xs↓i).j ⟩ = xs.(i − 1) ⟩

	Caso inductivo 
		pruebo para xs = x:xs 

		f.(x:xs)
	={especificacion}
		⟨ ∃ i : 0 < i ≤ #(x:xs) : ⟨Prod j : 0 ≤ j < #((x:xs)↓i) : ((x:xs)↓i).j ⟩ = (x:xs).(i − 1) ⟩
	={Def de #}
		⟨ ∃ i : 0 < i ≤ 1 + #xs : ⟨Prod j : 0 ≤ j < #((x:xs)↓i) : ((x:xs)↓i).j ⟩ = (x:xs).(i − 1) ⟩
	={1 < i ≤ #xs+1 ∨ i = 1}
		⟨ ∃ i : 1 < i ≤ #xs+1 ∨ i = 1 : ⟨Prod j : 0 ≤ j < #((x:xs)↓i) : ((x:xs)↓i).j ⟩ = (x:xs).(i − 1) ⟩
	={Particion de rango}
		⟨ ∃ i : 1 < i ≤ #xs+1 : ⟨Prod j : 0 ≤ j < #((x:xs)↓i) : ((x:xs)↓i).j ⟩ = (x:xs).(i − 1) ⟩
	  v ⟨ ∃ i : i = 1 : ⟨Prod j : 0 ≤ j < #((x:xs)↓i) : ((x:xs)↓i).j ⟩ = (x:xs).(i − 1) ⟩
	={Cambio de var, i = i +1 y algebra}
		⟨ ∃ i : 0 < i ≤ #xs : ⟨Prod j : 0 ≤ j < #((x:xs)↓(i+1)) : ((x:xs)↓(i+1)).j ⟩ = (x:xs).((i+1) − 1) ⟩
	  v ⟨ ∃ i : i = 1 : ⟨Prod j : 0 ≤ j < #((x:xs)↓i) : ((x:xs)↓i).j ⟩ = (x:xs).(i − 1) ⟩
	={Def de drop y de .}
		⟨ ∃ i : 0 < i ≤ #xs : ⟨Prod j : 0 ≤ j < #(xs↓i) : (xs↓i).j ⟩ = xs.(i − 1) ⟩
	  v ⟨ ∃ i : i = 1 : ⟨Prod j : 0 ≤ j < #((x:xs)↓i) : ((x:xs)↓i).j ⟩ = (x:xs).(i − 1) ⟩
	={HI}
		f.xs v ⟨ ∃ i : i = 1 : ⟨Prod j : 0 ≤ j < #((x:xs)↓i) : ((x:xs)↓i).j ⟩ = (x:xs).(i − 1) ⟩
	={Rango unitario con i = 1}
		f.xs v ⟨Prod j : 0 ≤ j < #((x:xs)↓1) : ((x:xs)↓1).j ⟩ = (x:xs).(1 − 1) 
	={Def de drop y aritmetica}
		f.xs v ⟨Prod j : 0 ≤ j < #(xs↓0) : (xs↓0).j ⟩ = (x:xs).0 
	={Def de drop y .}
		f.xs v ⟨Prod j : 0 ≤ j < #xs : xs.j ⟩ = x 
	={MODULARIZO, con 
	(1)prod.xs = ⟨Prod j : 0 ≤ j < #xs : xs.j ⟩
	}

(1)

	prod.xs = ⟨Prod j : 0 ≤ j < #xs : xs.j ⟩

	Caso base, xs =[]
	
		prod.[]
	={Especificacion}
		⟨Prod j : 0 ≤ j < #[] : xs.j ⟩
	={Logica y rango vacio}
		1

	Hipotesis inductiva
		prod.xs = ⟨Prod j : 0 ≤ j < #xs : xs.j ⟩

	Caso inductivo
		prod.(x:xs)
	={especificacion}
		⟨Prod j : 0 ≤ j < #(x:xs) : (x:xs).j ⟩
	={Def de length}
		⟨Prod j : 0 ≤ j < 1 + #xs : (x:xs).j ⟩
	={tomo 0 ≤ j < 1 + #xs como j = 0 ∨ 1 ≤ j < xs + 1}
		⟨Prod j : j = 0 ∨ 1 ≤ j < xs + 1 : (x:xs).j ⟩
	={Particion de rango }
		⟨Prod j : j = 0 : (x:xs).j ⟩ * ⟨Prod j : 1 ≤ j < xs + 1 : (x:xs).j ⟩
	={Rango unitario}
		⟨Prod j : j = 0 : (x:xs).0 ⟩ * ⟨Prod j : 1 ≤ j < xs + 1 : (x:xs).j ⟩
	={Def de . , tomo j = j + 1 y algebra}
		x * ⟨Prod j : 0 ≤ j < xs : xs.j ⟩
	={HI}
		x * prod.xs 

Entonces nos queda que:
 
f.xs = ⟨ ∃ i : 0 < i ≤ #xs : ⟨Prod j : 0 ≤ j < #(xs↓i) : (xs↓i).j ⟩ = xs.(i − 1) ⟩

es: 
	f.xs v prod.xs = x 

5)
	iguales : [A] → Bool
	iguales.xs = ⟨∀ i,j : 0 ≤ i < j < #xs : xs ! i = xs.j⟩

	Caso base, xs = []

		iguales.[]
	={especificacion}
		⟨∀ i,j : 0 ≤ i < j < #[] : [] ! i = [].j⟩
	={Def de length}
		⟨∀ i,j : 0 ≤ i < j < 0 : [] ! i = [].j⟩
	={Logica y rango vacio}
		True 

	Caso xs = ( [x] )
		iguales.( [x] )
	≡ { especificación }
		⟨ ∀ i,j : 0 ≤ i < j < #[x]) : [x].i = [x.j ⟩
	≡ { definición de indexación }
		⟨ ∀ i,j : 0 ≤ i < j < 1 : [x].i = [x].j ⟩
	≡ { evalúo el rango }
		⟨ ∀ i,j : False : [x].i = [x].j ⟩
	≡ { rango vacío }
		True

	Hipotesis inductiva
		iguales.xs = ⟨∀ i,j : 0 ≤ i < j < #xs : xs.i = xs.j⟩

	Caso inductivo: Demuestro que vale para x:y:xs (YA QUE ES I,J, busca 2 elementos.)

		iguales.(x:xs)
	={Especificacion}
		⟨∀ i,j : 0 ≤ i < j < #(x:y:xs) : (x:y:xs).i = (x:y:xs).j⟩
	={Def de # en caso recursivo}
		⟨∀ i,j : 0 ≤ i < j < 1 + #x:xs : (x:y:xs).i = (x:y:xs).j⟩
	={(i = 0 ⋀ j = 1) ⋁ 1 ≤ i < j < #(x:xs)+1}
		⟨∀ i,j : (i = 0 ⋀ j = 1) ⋁ 1 ≤ i < j < #(x:xs)+1 : (x:y:xs).i = (x:y:xs).j⟩
	={Particion de rango}
		⟨∀ i,j : i = 0 ⋀ j = 1 : (x:y:xs).i = (x:y:xs).j⟩ v ⟨∀ i,j : 1 ≤ i < j < #(x:xs)+1 : (x:y:xs) ! i = (x:y:xs).j⟩
	={Cambio de variable}
		⟨∀ i,j : j = 1 : (x:y:xs).0 = (x:y:xs).j⟩ v ⟨∀ i,j : 1 ≤ i < j < #(x:xs)+1 : (x:y:xs).i = (x:y:xs).j⟩
	={Rango unitario}
		(x:y:xs).0 = (x:y:xs).1 v ⟨∀ i,j : 1 ≤ i < j < #(x:xs)+1 : (x:y:xs).i = (x:y:xs).j⟩
	={Indexacion (toma elemento 0 = x, 1 = y)}
		x = y v ⟨∀ i,j : 1 ≤ i < j < #(x:xs)+1 : (x:y:xs).i = (x:y:xs).j⟩
	={Cambio de variable, i = i + 1, j = j + 1 y algebra}
		x = y v ⟨∀ i,j : 0 ≤ i < j < #(x:xs) : (x:y:xs).(i + 1) = (x:y:xs).(j + 1)⟩
	={Def de indexacion}
		x = y v ⟨∀ i,j : 0 ≤ i < j < #(x:xs) : (y:xs).i = (y:xs).j⟩
	={Def de #}
		x = y v ⟨∀ i,j : 0 ≤ i < j < 1 + #xs : (y:xs).i = (y:xs).j⟩
	={(i = 0 ⋀ j = 1) ⋁ 1 ≤ i < j < #xs+1}
		x = y v ⟨∀ i,j : (i = 0 ⋀ j = 1) ⋁ 1 ≤ i < j < #xs+1 : (y:xs).i = (y:xs).j⟩
	={Particion de rango}
		x = y v ⟨∀ i,j :  1 ≤ i < j < #xs+1 : (y:xs).i = (y:xs).j⟩ v ⟨∀ i,j : i = 0 ⋀ j = 1: (y:xs).i = (y:xs).j⟩
	={Cambio de variable, i = i + 1, j = j + 1 y algebra}
		x = y v ⟨∀ i,j :  0 ≤ i < j < #xs : (y:xs).(i + 1) = (y:xs).(j + 1)⟩ v ⟨∀ i,j : i = 0 ⋀ j = 1: (y:xs).i = (y:xs).j⟩
	={Def de . / indexaciones}
		x = y v ⟨∀ i,j :  0 ≤ i < j < #xs : xs.i = xs.j⟩ v ⟨∀ i,j : i = 0 ⋀ j = 1: (y:xs).i = (y:xs).j⟩
	={T2 cambio de variable}
		x = y v ⟨∀ i,j :  0 ≤ i < j < #xs : xs.i = xs.j⟩ v ⟨∀ i,j : i = 0 ⋀ j = 1: (y:xs).0 = (y:xs).1⟩
	={Rango unitario y Indexacion}
		x = y v ⟨∀ i,j :  0 ≤ i < j < #xs : xs.i = xs.j⟩ v j = 1: y = ¿ xs.1 ?
	={HI}
		x = y v iguales.xs v j = 1: y = ¿ xs.1 ?

lab 10)

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

entendi el 20% de todo. 

consulta / dudas:

Bounded. 				DONE
Derivacion en cuantificaciones 	DONE 
Explicar algunos teoremas 
Una buena diferencia entre Type y Data 

Data constructores

type sinonimo de tipo. 

¿Como lee haskell todo lo de coso? Ej, lab 13, c) NO ENTIENDO LA LOGICA DE HASKELL
chusmear que se ve en c 
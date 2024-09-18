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
Especificacion: 
sumPar.n = ⟨sum i : 0 ≤ i ≤ n ∧ par.i : i⟩

Donde par.i = n mod 2 == 0

1. Caso base, n = 0

    sumPar.0
={Especificacion}
    ⟨sum i : 0 ≤ i ≤ 0 ∧ par.i : i⟩
={Logica}
    ⟨sum i : i = 0 ∧ par.i : i⟩
={Rango unitario}
    ⟨sum i : par.0 : 0⟩
={logica de lista}
    0

2. Hipotesis inductiva  
    sumPar.n = ⟨sum i : 0 ≤ i ≤ n ∧ par.i : i⟩

3. Caso inductivo, n = n + 1

    sumPar.(n + 1)
={Especificacion}
    ⟨sum i : 0 ≤ i ≤ n + 1 ∧ par.i : i⟩
={Logica}
    ⟨sum i : (i = n + 1 v 0 <= i <= n) ∧ par.i : i⟩
={Distributividad, p =  i = n +1, q = 0 <= i <= n, r = par.i}
    ⟨sum i : (i = n + 1 ∧ par.i ) v (0 <= i <= n ∧ par.i)  : i⟩
={Particion de rango}
    ⟨sum i : i = n + 1 ∧ par.i : i⟩ + ⟨sum i :  0 <= i <= n ∧ par.i : i⟩
={Hipotesis, especificacion }
    ⟨sum i : i = n + 1 ∧ par.i : i⟩ + sumPar.n 
={Cambio de variable }
    ⟨sum i : par.n + 1 : n + 1⟩ + sumPar.n 
={termino de constante}
    n + 1 + sumPar.n 

e) 
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

	--Pasos para derivar.
	--Caso base, para xs == [] v n == 0
	--recordar que vale hipotesis inductiva
	--Caso recursivo, para xs == x:xs v n = n + 1
	--(OPC) Pensar en ejemplos (No de fiar si no sabes evaluar.)

	--Notaciones mas importantes: 
		--recordar la tabla de el digesto para los casos bases.
		--Pensar en ejemplos de entrada si no sale a la primera o segundar
		--pensar mucho logicamente
		--Recordar teoremas del practico.
		--Recordarfunciones como prod, suma y #
	

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

	f : Int → Int 

cubo.x = x^3
Caso base 
    cubo.0 
={especificacion}
    0³
={Algebra}
    0

Hipotesis inductiva 
    cubo.x = x^3

Caso inductivo 
    cubo.(x+1)
={Espeficacion}
    (x+1)³
={Algebra}
    (x + 1)² * (x+1)
={Algebra}
    x^3+3x^2+3x+1
={Hipotesis inductiva / Especificacion}
    cubo.x + 3x² + 3x + 1
={Modularizacion, ya que 3x² no esta programado por Haskell}

Modularizacion:
    Especificacion:
        3ekisCuadrao.x = 3x²

caso base 
    3ekisCuadrao.0 
={Especificacion}   
    3(0)²
={Aritmetica }
    0

Hipotesis inductiva 
    3ekisCuadrao.x = 3x²

Caso inductivo. 
    3ekisCuadrao.(x+1)
={Especificacion}
    3(x+1)²
={Algebra}
    3x²+ 6x + 3
={HI, Especificacion}
    3ekisCuadrao.(x+1) + 6x + 3

Quedando:
    cubo.x + 3ekisCuadrao.(x+1) + 3x + 1 + 6x + 3
    cubo.x + 3ekisCuadrao.(x+1) + 9x + 4
    cubo.x + 3ekisCuadrao.(x+1) + x + x + x + x + x + x + x + x + x + 4

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
	={(i = 0 ⋀ j = 1) 3⋁ 1 ≤ i < j < #(x:xs)+1}
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

b)

	minimo : [Int] -> Int
	minimo.xs = <Min i : 0 <= i < #xs ^ xs /=[] : xs ! i> --NO tiene que ser lista vacia, ademàs debo probar con una lsita no vacia (1 elemento)

	1) Caso base, para xs =[X]

		minimo.[x]
	={Especificacion}
		<Min i : 0 <= i < #[x] ^ [x] /=[] : [x] ! i>
	={Length}
		<Min i : 0 <= i < 1 ^ [x] /=[] : [x] ! i>
	={Como i nunca toca 1, entonces}
		<Min i : i = 0 ^ True : [x] ! i>
	={Rango unitario}
		[x] ! 0
	={Uso de !}
		x 

	2) Hipotesis inductiva
			minimo.xs = <Min i : 0 <= i < #xs ^ xs /=[] : xs ! i>
	
	3) Paso inductivo, para xs=x:xs 

		minimo.(x:xs)
	={Especificacion}
		<Min i : 0 <= i < #(x:xs) ^ (x:xs) /=[] : (x:xs) ! i>
	={Def de #}
		<Min i : 0 <= i < 1 + #xs ^ (x:xs) /=[] : (x:xs) ! i>
	={Uso de i = 0 ∨ 1 ≤ i < n + 1 y logica }
		<Min i : i = 0 ∨ 1 ≤ i < n + 1 ^ True : (x:xs) ! i>
	={Abs de ^ con true, particion de rango}
		<Min i : i = 0 : (x:xs) ! i> + <Min i : 1 ≤ i < n + 1 : (x:xs) ! i>
	={Rango unitario, def de ! (indexacion)}
		x + <Min i : 1 ≤ i < n + 1 : (x:xs) ! i>
	={Cambio de variable, i = i + 1 y algebra  }
		x + <Min i : 0 ≤ i < n : (x:xs) ! (i + 1)>
	={Def de ! (indexacion)}
		x + <Min i : 0 ≤ i < n : xs ! i>
	={HI? }

	minimo : [Int] → Int
	minimo.(x:[ ]) ≐ x
	minimo.(x:(y:ys)) ≐ x min minimo.(y:ys)

c)

	creciente : [Int] -> Bool

	si pide orden, tendre que usar operadores de mayor y menor. 
	es una lista, tengo que comparar 2 elementos del mismo. 
	uso de ! o . 
	para todos los elementos de una lista es la comparacion. 

	creciente.xs = <A i,j : 0 <= i < j < #xs : xs!i <= xs!j>


	1. Caso base, para xs = []

		creciente.[]
	={Especificacion}
		<A i,j : 0 <= i < j < #[] : []!i <= []!j>
	={#xs = 0}
		<A i,j : 0 <= i < j < 0 : []!i <= []!j>
	={Logica}
		<A i,j : False : []!i <= []!j>
	={rango vacio}	
		True 

	2. Caso recursivo (Pruebo con un elemento pegado a la lista)

		creciente.x:[]
	={Especificacion}
		<A i,j : 0 <= i < j < #x:[] : x:[]!i <= x:[]!j>
	={Construccion de lista}
		<A i,j : 0 <= i < j < #[x] : [x]!i <= [x]!j>
	={Def de #[x]}
		<A i,j : 0 <= i < j < 1 : [x]!i <= [x]!j>
	={Logica}
		<A i,j : False : [x]!i <= [x]!j>
	={Rango vacio}
		True

	3. Hipotesis inductiva para construccion de lista 

		creciente.x:xs = <A i,j : 0 <= i < j < #(x:xs) : (x:xs)!i <= (x:xs)!j>

	4. Caso inductivo, para xs=(x:(x:xs))


		creciente.(x:(x:xs))
	={Especificacion}
		<A i,j : 0 <= i < j < #(x:(x:xs)) : (x:(x:xs))!i <= (x:(x:xs))!j>
	={Def de # en caso recursivo}
		<A i,j : 0 <= i < j < 1 + #(x:xs) : (x:(x:xs))!i <= (x:(x:xs))!j>
	={(i = 0 ⋀ j = 1) ⋁ 1 ≤ i < j < #(x:xs)+1}
		<A i,j : (i = 0 ⋀ j = 1) ⋁ 1 ≤ i < j < #(x:xs)+1 : (x:(x:xs))!i <= (x:(x:xs))!j>
	={Particion de rango}
		<A i,j : i = 0 ⋀ j = 1 : (x:(x:xs))!i <= (x:(x:xs))!j> v <A i,j : 1 ≤ i < j < #(x:xs) +1 : (x:(x:xs))!i <= (x:(x:xs))!j>
	={Cambio de variable y rango unitario}
		(x:(x:xs))!0 <= (x:(x:xs))!1 v <A i,j : 1 ≤ i < j < #(x:xs) +1 : (x:(x:xs))!i <= (x:(x:xs))!j>
	={Indexacion de ! (aca m doy cuenta q no conviene poner x:x si no x:y por q uno toma el primer elemento y el otro el segundo)}
		x <= x + <A i,j : 1 ≤ i < j < #(x:xs) + 1 : (x:(x:xs))!i <= (x:(x:xs))!j>
	={Cambio de variable, i = i + 1, j = j + 1 y algebra}
		x <= x + <A i,j : 0 ≤ i < j < #(x:xs) : (x:(x:xs))!(i + 1) <= (x:(x:xs))!(j + 1)>
	={Def de ! (indexacion)}
		x <= x + <A i,j : 0 ≤ i < j < #(x:xs) : (x:xs)!i <= (x:xs)!j>
	={HI}
		x <= x + creciente.(x:xs)

	(aca m doy cuenta q no conviene poner x:x si no x:y por q uno toma el primer elemento y el otro el segundo)


	--Pasos para Modularizar
		--Caso base de la espc. (Opcional). Su variacion:
			-- Caso base en [x]
		--Hipotesis inductiva
		--Caso recursivo para x:xs alt n + 1. De aca saldra lo que se necesita para modularizar
		-- PARA LA MODULARIZACION (Func. Aux.) son los mismos pasos.
		-- Al final te tiene que dar lo del inicio + algo + HI
			-- f.xs = ⟨ ∃ i : 0 < i ≤ #xs : ⟨Prod j : 0 ≤ j < #(xs↓i) : (xs↓i).j ⟩ = xs.(i − 1) ⟩
			--es: 
			--f.xs v prod.xs = x 

		--Notaciones mas importantes: 
		--Recordar la funcion !. (OBLIGATORIO, SI NO ESTAS EN EL HORNO)
		--recordar la tabla de el digesto para los casos bases.
		--Pensar en ejemplos de entrada si no sale a la primera o segundar
		--pensar mucho logicamente
		--Recordar teoremas del practico.
		--Recordarfunciones como prod, suma y #

6)
	a)
	
		Caso base: 
		psum.[  ]
	= { especificación }
		⟨ ∀ i : 0 ≤ i ≤ #[  ] : sum.([  ]↑i) ≥ 0 ⟩
	= { def. # }
		⟨ ∀ i : 0 ≤ i ≤ 0 : sum.([  ]↑i) ≥ 0 ⟩
	= { lógica }
		⟨ ∀ i : i = 0 : sum.([  ]↑i) ≥ 0 ⟩
	= { rango unitario }
		sum.([  ]↑0) ≥ 0
	= { def ↑ y de sum  }
		0 ≥ 0
	= { lógica }
		True

	Hipótesis Inductiva: 
		psum.xs = ⟨ ∀ i : 0 ≤ i ≤ #xs : sum.(xs↑i) ≥ 0 

		psum.(x►xs)
	= { especificación } 
	⟨ ∀ i : 0 ≤ i ≤ #(x►xs) : sum.((x►xs)↑i) ≥ 0 ⟩
	= { def de # }
	⟨ ∀ i : 0 ≤ i ≤ #xs + 1 : sum.((x►xs)↑i) ≥ 0 ⟩
	= { lógica }
	⟨ ∀ i :  i = 0  ∨  1 ≤ i ≤ #xs + 1  : sum.((x►xs)↑i) ≥ 0 ⟩
	= { partición de rango
		(observación: estamos separando el caso del segmento inicial vacío (i = 0) de los
		segmentos iniciales no vacíos (1 ≤ i ≤ #xs + 1)
	}
	⟨ ∀ i : i = 0 : sum.((x►xs)↑i) ≥ 0 ⟩ ∧ 
	⟨ ∀ i : 1 ≤ i ≤ #xs + 1 : sum.((x►xs)↑i) ≥ 0 ⟩
	= { Acá la prioridad es llegar a la H.I. así que nos concentramos en la segunda parte.
		Cambio de variable i → i + 1. }
	⟨ ∀ … ⟩ ∧  ⟨ ∀ i : 1 ≤ i + 1 ≤ #xs + 1 : sum.((x►xs)↑(i+1)) ≥ 0 ⟩
	= { arit: resto 1 }
	⟨ ∀ … ⟩ ∧  ⟨ ∀ i : 0 ≤ i ≤ #xs : sum.((x►xs)↑(i+1)) ≥ 0 ⟩
	= { def de ↑ }
	⟨ ∀ … ⟩ ∧  ⟨ ∀ i : 0 ≤ i ≤ #xs : sum.(x   ►   (xs↑i)  ) ≥ 0 ⟩
	= { def de sum }
	⟨ ∀ … ⟩ ∧  ⟨ ∀ i : 0 ≤ i ≤ #xs : x + sum.((xs↑i)) ≥ 0 ⟩ 

	Generalizacion:
		gpsum.n.xs = ⟨ ∀ i : 0 ≤ i ≤ #xs :  n  +  sum.(xs↑i) ≥ 0 ⟩   
------------------------------------------------------------------
		psum.xs es caso particular de gpsum.n.xs cuando n = 0. Más formalmente:
			psum.xs = gpsum.0.xs.
------------------------------------------------------------------

	Verifico que es valido para generalizar
		gPsum.n.xs
	= { especificación Gpsum }
		⟨ ∀ i : 0 ≤ i ≤ #xs :  n + sum.(xs↑i) ≥ 0 ⟩   
	= { n = 0 }
		⟨ ∀ i : 0 ≤ i ≤ #xs :  0  +  sum.(xs↑i) ≥ 0 ⟩   
	= { especificación gpsum }
		gpsum.0.xs

	Caso base: 
		gpsum.n.[ ]
	= { especificación }
		⟨ ∀ i : 0 ≤ i ≤ #[  ] : n + sum.([  ]↑i) ≥ 0 ⟩
	= { def. # }
		⟨ ∀ i : 0 ≤ i ≤ 0 : n + sum.([  ]↑i) ≥ 0 ⟩
	= { lógica }
		⟨ ∀ i : i = 0 : n + sum.([  ]↑i) ≥ 0 ⟩
	= { rango unitario }
		n + sum.([  ]↑0) ≥ 0
	= { def ↑ y de sum  }
		n + 0 ≥ 0
	= { arit }
		n ≥ 0

	Hipotesis inductiva:
		 ∀ E  :  gpsum.E.xs = ⟨ ∀ i : 0 ≤ i ≤ #xs :  E  +  sum.(xs↑i) ≥ 0 ⟩  

		gpsum.n.(x►xs)
	= { especificación } 
		⟨ ∀ i : 0 ≤ i ≤ #(x►xs) : n + sum.((x►xs)↑i) ≥ 0 ⟩
	= { def de # }
		⟨ ∀ i : 0 ≤ i ≤ #xs + 1 : n + sum.((x►xs)↑i) ≥ 0 ⟩
	= { lógica }
		⟨ ∀ i :  i = 0  ∨  1 ≤ i ≤ #xs + 1  : n + sum.((x►xs)↑i) ≥ 0 ⟩
	= { partición de rango
		(observación: de nuevo estamos separando el caso del segmento inicial vacío (i = 0) de
		los segmentos iniciales no vacíos (1 ≤ i ≤ #xs + 1)
	}
		⟨ ∀ i : i = 0 : n + sum.((x►xs)↑i) ≥ 0 ⟩ ∧ 
		⟨ ∀ i : 1 ≤ i ≤ #xs + 1 : n + sum.((x►xs)↑i) ≥ 0 ⟩
	= { Acá la prioridad es llegar a la H.I. así que nos concentramos en la segunda parte.
		Cambio de variable i → i + 1 }
		⟨ ∀ … ⟩ ∧  ⟨ ∀ i : 1 ≤ i + 1 ≤ #xs + 1 : n + sum.((x►xs)↑(i+1)) ≥ 0 ⟩
	= { arit: resto 1 }
		⟨ ∀ … ⟩ ∧  ⟨ ∀ i : 0 ≤ i ≤ #xs : n + sum.((x►xs)↑(i+1)) ≥ 0 ⟩
	= { def de ↑ }
		⟨ ∀ … ⟩ ∧  ⟨ ∀ i : 0 ≤ i ≤ #xs : n + sum.(x   ►   (xs↑i)  ) ≥ 0 ⟩
	= { def de sum }
		⟨ ∀ … ⟩ ∧  ⟨ ∀ i : 0 ≤ i ≤ #xs : n + (  x + sum.((xs↑i)) ) ≥ 0 ⟩
	= { ¿Podemos llegar a la H.I.? Aplicamos asociatividad. }
		⟨ ∀ … ⟩ ∧  ⟨ ∀ i : 0 ≤ i ≤ #xs : (n+x)  +   sum.((xs↑i)) ≥ 0 ⟩
	= { Ahora sí H.I. y volvemos a mirar la primera parte. }
		⟨ ∀ i : i = 0 : n + sum.((x►xs)↑i) ≥ 0 ⟩  ∧  gpsum.(n+x).xs
	= { Rango unitario y más pasos como el caso base. }
		n ≥ 0  ∧  gpsum.(n+x).xs


b) 
	sumAnt.xs = ⟨ ∃ i : 0 ≤ i < #xs : xs!i = sum.(xs↑i) ⟩

	Caso base, para xs=[]

		sumAnt.[]
	={Especificacion}
		⟨∃ i : 0 ≤ i < #[] : []!i = sum.([]↑i)⟩
	={Def de #[]}
		⟨∃ i : 0 ≤ i < 0 : []!i = sum.([]↑i)⟩
	={Logica y rango vacio}
		False

	Hipotesis inductiva
		⟨∃ i : 0 ≤ i < #xs : xs!i = sum.(xs↑i)⟩

	Paso inductivo, para xs=x:xs
		sumAnt.(x:xs)
	={especifcacion}
		⟨∃ i : 0 ≤ i < #(x:xs) : (x:s!)i = sum.((x:xs)↑i)⟩
	={Def de # en recurcion}
		⟨∃ i : 0 ≤ i < 1 + #xs : (x:s!)i = sum.((x:xs)↑i)⟩
	={0 ≤ i < 1 + #xs == i = 0 v 1 <= i < #xs + 1 }
		⟨∃ i : i = 0 v 1 <= i < #xs + 1 : (x:xs!)i = sum.((x:xs)↑i)⟩
	={Particion de rango}
		⟨∃ i : i = 0 : (x:xs!)i = sum.((x:xs)↑i)⟩ v ⟨∃ i : 1 <= i < #xs + 1 : (x:s!)i = sum.((x:xs)↑i)⟩
	={Me enfoco en HI, Cambio de var, i = i + 1 y algebra}
		⟨∃ ... ⟩ v ⟨∃ i : 0 <= i < #xs : (x:xs)!(i + 1) = sum.(x:xs)↑(i + 1)⟩
	={Def de !}
		⟨∃ ... ⟩ v ⟨∃ i : 0 <= i < #xs : xs!i = sum.(x:xs)↑(i + 1)⟩
	={Def de tomar}
		⟨∃ ... ⟩ v ⟨∃ i : 0 <= i < #xs : xs!i = sum.(x:(xs)↑(i + 1))⟩
	={Def de sum}
		<∃ i : i = 0 : (x:xs)!i = sum.((x:xs)↑i) ⟩ ∨ ⟨ ∃ i : 0 ≤ i < #xs : xs!i = x + sum.(xs↑(i+1))> 

	no llego a HI, hago 

	gsumAnt.n.xs = ⟨ ∃ i : 0 ≤ i < #xs : xs!i + n = sum.(xs↑(i))> 

	-- TENGO QUE VERIFICAR QUE SUMANT.XS = GSUMANT.0.XS

	Caso base, xs = []
		gsumAnte.n.[]
	={especifcacion}
		⟨ ∃ i : 0 ≤ i < #[] : []!i + n = sum.([]↑(i))>
	={Def de #}
		⟨ ∃ i : 0 ≤ i <0 : []!i + n = sum.([]↑(i))>
	={Logica, y rango vacio}
		False 

	Hipotesis inductiva
		gsumAnt.n.xs = ⟨ ∃ i : 0 ≤ i < #xs : xs!i + n = sum.(xs↑i)>

	Caso inductivo, xs=(x:xs)
		gsumAnt.n.(x:xs) 
	={Especificacion}
		⟨ ∃ i : 0 ≤ i < #(x:xs) : (x:xs)!i + n = sum.((x:xs)↑(i))>
	={Def de #  en recursion}
		⟨ ∃ i : 0 ≤ i < 1 + #xs : (x:xs)!i + n = sum.((x:xs)↑(i))>
	={Logica, 0 ≤ i < 1 + #xs == i = 0 v 1 <= i < 1 + #xs  }
		⟨ ∃ i : i = 0 v 1 <= i < 1 + #xs : (x:xs)!i + n = sum.((x:xs)↑(i))>
	={Particion de rango}
		⟨ ∃ i : i = 0 : (x:xs)!i + n = sum.((x:xs)↑(i))> + ⟨ ∃ i : 1 <= i < 1 + #xs : (x:xs)!i + n = sum.(x:xs)↑(i+1))>
	={Cambio de var i = i + 1, algebra y ignoro parte izq }
		⟨ ∃ ... > + ⟨ ∃ i : 0 <= i < #xs : (x:xs)!(i+1) + n = sum.(x:xs)↑(i+1)>
	={Def de !}
		⟨ ∃ ... > + ⟨ ∃ i : 0 <= i < #xs : xs!i + n = sum.(x:xs)↑(i+1)>
	={Def de take}
		⟨ ∃ ... > + ⟨ ∃ i : 0 <= i < #xs : xs!i + n = sum.(x:(xs)↑(i))>
	={Def de sum}
		⟨ ∃ ... > + ⟨ ∃ i : 0 <= i < #xs : xs!i + n = x + sum.(xs)↑(i)>
	={Aritmetica}
		⟨ ∃ ... > + ⟨ ∃ i : 0 <= i < #xs : xs!i (+ n - x) = sum.(xs)↑(i)>
	={termine del lado derecho, sigo izq}
		⟨ ∃ i : i = 0 : (x:xs)!i + n = sum.((x:xs)↑(i))> + ⟨ ∃ i : 0 <= i < #xs : xs!i (+ n - x) = sum.(xs)↑(i)>
	={Rango unitario, y hago n = n - x}
		(x:xs)!0 + n = sum(x:xs)↑0 + ⟨ ∃ i : 0 <= i < #xs : xs!i + n = sum.(xs)↑(i)>
	={Def de ! y take}
		x + n = x + sum xs + ⟨ ∃ i : 0 <= i < #xs : xs!i + n = sum.(xs↑i)>
	={HI, recuerod n = n - x}
		x + n = x + sum xs + gsumAnt.n.xs 
	={aritmetica, tacho x}
	    n = sum xs + gsumAnt.n.xs 

		gsum_ant :: Num -> [Num] -> Bool
		gsum_ant.n.[ ] = False
		gsum_ant.n.(x:xs) = n = sum xs ∨ gsum_ant.(n-x).xs
		sum_ant.xs = gsum_ant.0.xs

c) 
	sum8.xs = ⟨ ∃ i : 0 ≤ i ≤ #xs : sum.(xs↑i) = 8 ⟩ .

	Caso base, xs = []

		sum8.[]
	={Especificacion}
		⟨ ∃ i : 0 ≤ i ≤ #[] : sum.([]↑i) = 8 ⟩
	={#[] en caso base}
		⟨ ∃ i : 0 ≤ i ≤ 0 : sum.([]↑i) = 8 ⟩
	={Logica, y rango vacio }
		False 

	Hipotesis inductiva. Vale:
	 sum8.xs  =	⟨ ∃ i : 0 ≤ i ≤ #xs : sum.(xs↑i) = 8 ⟩

	Caso inductivo. Demuestro para x:xs 

		sum8.(x:xs)
	={Especificacion} 
		⟨ ∃ i : 0 ≤ i ≤ #(x:xs) : sum.((x:xs)↑i) = 8 ⟩
	={Def de # en recursion}
		⟨ ∃ i : 0 ≤ i ≤ 1 + #xs : sum.((x:xs)↑i) = 8 ⟩
	={Logica}
		⟨ ∃ i : i = 0 v 1 <= i < #xs + 1 : sum.((x:xs)↑i) = 8 ⟩
	={Particion de rango}
		⟨ ∃ i : i = 0 : sum.((x:xs)↑i) = 8 ⟩ + ⟨ ∃ i : 1 <= i < #xs + 1 : sum.((x:xs)↑i) = 8 ⟩
	={Ignoro la part izq. Cambio de variable, i = i +1, y algebra }
		⟨ ∃ ... ⟩ + ⟨ ∃ i : 0 <= i < #xs : sum.((x:xs)↑(i + 1)) = 8 ⟩
	={Def de take}
		⟨ ∃ ... ⟩ + ⟨ ∃ i : 0 <= i < #xs : sum.(x:(xs)↑i) = 8 ⟩
	={Def de sum}
		⟨ ∃ ... ⟩ + ⟨ ∃ i : 0 <= i < #xs : x + sum (xs↑i) = 8 ⟩

	NO LLEGO A HI, GENERALIZO, tq:

		gSum8.xs = ⟨ ∃ i : 0 <= i < #xs : x + sum (xs↑i) = 8 ⟩

	Caso base, xs = []

		gSum8.[]
	={Especificacion}
		⟨ ∃ i : 0 <= i < #[] : x + sum ([]↑i) = 8 ⟩
	={# en caso base}
		⟨ ∃ i : 0 <= i < 0 : x + sum ([]↑i) = 8 ⟩
	={Logica y rango vacio}
		False 
	
	Hipotesis inductiva
		gSum8.xs = ⟨ ∃ i : 0 <= i < #xs : n + sum (xs↑i) = 8 ⟩

	Caso inductivo demuestro para x:xs 

		gSum8.(x:xs)
	={Especificacion}
		⟨ ∃ i : 0 <= i < #(x:xs) : x + sum ((x:xs)↑i) = 8 ⟩
	={# en caso recursivo }
		⟨ ∃ i : 0 <= i < 1 + #xs : x + sum ((x:xs)↑i) = 8 ⟩
	={Logica}
		⟨ ∃ i : i = 0 v 1 <= i < #xs + 1: x + sum ((x:xs)↑i) = 8 ⟩
	={Particion de rango}
		⟨ ∃ i : i = 0 : x + sum ((x:xs)↑i) = 8 ⟩ + ⟨ ∃ i : 1 <= i < #xs + 1: x + sum ((x:xs)↑i) = 8 ⟩
	={Rango unitario}
		x + sum ((x:xs)↑0) = 8 + ⟨ ∃ i : 1 <= i < #xs + 1: x + sum ((x:xs)↑i) = 8 ⟩
	={Def de take y sum}
		x + x + sum xs = 8 + ⟨ ∃ i : 1 <= i < #xs + 1: x + sum ((x:xs)↑i) = 8 ⟩
	={Aritmetica, cambio de variable i = i + 1}
		x + x + sum xs = 8 + ⟨ ∃ i : 0 <= i < #xs : x + sum ((x:xs)↑(i + 1) = 8 ⟩
	={Def de take y sum}
		x + x + sum xs = 8 + ⟨ ∃ i : 0 <= i < #xs : x + x + sum (xs↑i) = 8 ⟩
	={n = x + x}
		n + sum xs = 8 + ⟨ ∃ i : 0 <= i < #xs : n + sum (xs↑i) = 8 ⟩
	={HI}
		n + sum xs = gSum8.xs

Generalizacion:
    f.xs = ⟨Max i : 0 ≤ i < #xs ∧ sum.(xs↑i) = sum.(xs↓i) : i ⟩

1) Analisis de especificacion. 
    -- Cuatificador max, entonces si hago particion de rango es max
    -- El rango es gran, tiene dos sums
    -- cuenta con take y drop
    -- El termino es i
    -- La generalizacion seria de x + algo
    -- La suma de take es = a la suma de drop

2) Especificacion:
        f.xs = ⟨Max i : 0 ≤ i < #xs ∧ sum.(xs↑i) = sum.(xs↓i) : i ⟩

3) Caso base, demuestro para xs=[]
    
    f.[]
={Especificacion}
    ⟨Max i : 0 ≤ i < #[] ∧ sum.([]↑i) = sum.([]↓i) : i ⟩
={Por definicion de #}
    ⟨Max i : 0 ≤ i < 0 ∧ sum.([]↑i) = sum.([]↓i) : i ⟩
={Por logica}
    ⟨Max i : False ∧ sum.([]↑i) = sum.([]↓i) : i ⟩
={Aca hay dos caminos:
    1) Abosorvente de False
    2*) Evaluar las sum}
    ⟨Max i : False ∧ sum.[] = sum.[] : i ⟩
={Por def de sum en caso base}
    ⟨Max i : False ∧ 0 = 0 : i ⟩
={0 = 0 es una verdad, True}
    ⟨Max i : False ∧ True : i ⟩
={Por logica de ^}   
    ⟨Max i : False : i ⟩
={Rango vacio}  
    -inf 

4) Hipotesis inductiva, recuerdo que mi especificacion es : 
        f.xs = ⟨Max i : 0 ≤ i < #xs ∧ sum.(xs↑i) = sum.(xs↓i) : i ⟩

5) Paso inductivo, veo para xs = x:xs

    f.(x:xs)
={Especificacion}
    ⟨Max i : 0 ≤ i < #(x:xs) ∧ (sum.((x:xs)↑i) = sum.((x:xs)↓i)) : i ⟩
={Por # en caso recursivo}
    ⟨Max i : 0 ≤ i < 1 + #xs ∧ (sum.((x:xs)↑i) = sum.((x:xs)↓i)) : i ⟩
={Logica}
    ⟨Max i : (i = 0 v 1 <= i < #xs + 1) ∧ (sum.((x:xs)↑i) = sum.((x:xs)↓i)) : i ⟩
={Distributividad}
    ⟨Max i : (i = 0 ^ (sum.((x:xs)↑i) = sum.((x:xs)↓i) v (1 <= i < #xs + 1 ^ (sum.((x:xs)↑i) = sum.((x:xs)↓i) )) : i ⟩
={Particion de rango }
    ⟨Max i : (i = 0 ^ (sum.((x:xs)↑i) = sum.((x:xs)↓i) : i ⟩ 
      max ⟨Max i : (1 <= i < #xs + 1 ^ (sum.((x:xs)↑i) = sum.((x:xs)↓i))) : i ⟩
={Cambio de variable}
    <Max : (sum.((x:xs)↑0) = sum.((x:xs)↓0) : 0  >
      max ⟨Max i : (1 <= i < #xs + 1 ^ (sum.((x:xs)↑i) = sum.((x:xs)↓i))) : i ⟩
={Por logica}
    sum.((x:xs)↑0 = sum.((x:xs)↓0) 
      max ⟨Max i : (1 <= i < #xs + 1 ^ (sum.((x:xs)↑i) = sum.((x:xs)↓i))) : i ⟩
={Por def de take}
    sum.[] = sum.(x:xs) 
      max ⟨Max i : (1 <= i < #xs + 1 ^ (sum.((x:xs)↑i) = sum.((x:xs)↓i))) : i ⟩
={Por def de sum.[]}
    0 = sum.(x:xs) 
      max ⟨Max i : (1 <= i < #xs + 1 ^ (sum.((x:xs)↑i) = sum.((x:xs)↓i))) : i ⟩
={Recursion de sum}
    0 = x + sum.xs  
      max ⟨Max i : (1 <= i < #xs + 1 ^ (sum.((x:xs)↑i) = sum.((x:xs)↓i))) : i ⟩
={Cambio de variable, i = i + 1, aritmetica}
    x + sum.xs  
      max ⟨Max i : (0 <= i < #xs ^ (sum.((x:xs)↑(i + 1) = sum.((x:xs)↓(i + 1))) : (i + 1) ⟩
={Por def de take }
    x + sum.xs  
        max ⟨Max i : (0 <= i < #xs ^ (sum.(x:(xs)↑i) = sum.((x:xs)↓(i + 1))) : (i + 1) ⟩
={Por def de drop }
    x + sum.xs  
            max ⟨Max i : (0 <= i < #xs ^ (sum.(x:(xs)↑i) = sum.(xs↓i) : (i + 1) ⟩
={Por def de sum}
    x + sum.xs  
            max ⟨Max i : (0 <= i < #xs ^ x + sum.(xs↑i) = sum.(xs↓i) : (i + 1) ⟩
={Constante}
    x + sum.xs  
            max ⟨Max i : (0 <= i < #xs ^ x + sum.(xs↑i) = sum.(xs↓i) : i ⟩ + 1

    Notemos que no llegamos a la hipotesis inductiva por el x + que nos queda en el lado cercano a la HI. 
    Debemos de generalizar para los casos de este tipo. 
    Definamos la generalizacion de la especificacion como: 

        gF.E.xs = ⟨Max i : 0 ≤ i < #xs ∧ E + sum.(xs↑i) = sum.(xs↓i) : i ⟩

6) Verifiquemos que se cumple que: 
    f.xs = gF.0.xs 

    Entonces:

        gF.0.xs 
    ={Especificacion}
        ⟨Max i : 0 ≤ i < #xs ∧ 0 + sum.(xs↑i) = sum.(xs↓i) : i ⟩
    ={Logica aritmetica }
        ⟨Max i : 0 ≤ i < #xs ∧ sum.(xs↑i) = sum.(xs↓i) : i ⟩
    Concluimos que si, efectivamente se cumple que 
    f.xs = gF.0.xs 
    Ya que la especificacion es la misma. Notar que E = 0 por neutro de sum.

7) Caso base, para xs = []: 
        gF.E.[]
    ={Especificacion}
      ⟨Max i : 0 ≤ i < #[] ∧ E + sum.([]↑i) = sum.([]↓i) : i ⟩
    ={Por definicion de #}
        ⟨Max i : 0 ≤ i < 0 ∧ E + sum.([]↑i) = sum.([]↓i) : i ⟩
    ={Por logica}
        ⟨Max i : False ∧ E + sum.([]↑i) = sum.([]↓i) : i ⟩
    ={Aca hay dos caminos:
        1) Abosorvente de False
        2*) Evaluar las sum}
        ⟨Max i : False ∧ E + sum.[] = sum.[] : i ⟩
    ={Por def de sum en caso base}
        ⟨Max i : False ∧  E + 0 = 0 : i ⟩
    ={0 = 0 es una verdad, True}
        ⟨Max i : False ∧ False : i ⟩
    ={Por logica de ^}   
        ⟨Max i : True  : i ⟩
    ={Rango vacio}  
        True

8) Caso inductivo, para xs = (x:xs)

    gF.E.(x:xs)
={Especificacion}
    ⟨Max i : 0 ≤ i < #xs ∧ n + sum.(xs↑i) = sum.(xs↓i) : i ⟩
={Por # en caso recursivo}
    ⟨Max i : 0 ≤ i < 1 + #xs ∧ (n + (sum.((x:xs)↑i) = sum.((x:xs)↓i))) : i ⟩
={Logica}
    ⟨Max i : (i = 0 v 1 <= i < #xs + 1) ∧ (n + (sum.((x:xs)↑i) = sum.((x:xs)↓i))) : i ⟩
={Distributividad}
    ⟨Max i : (i = 0 ^ (n + sum.((x:xs)↑i) = sum.((x:xs)↓i) v (1 <= i < #xs + 1 ^ (nEn + sum.((x:xs)↑i) = sum.((x:xs)↓i) )) : i ⟩
={Particion de rango }
    ⟨Max i : (i = 0 ^ (n + sum.((x:xs)↑i) = sum.((x:xs)↓i) : i ⟩ 
      max ⟨Max i : (1 <= i < #xs + 1 ^ (n + ( sum.((x:xs)↑i)) = sum.((x:xs)↓i))) : i ⟩
={Cambio de variable}
    <Max : (n + sum.((x:xs)↑0) = sum.((x:xs)↓0) : 0  >
      max ⟨Max i : (1 <= i < #xs + 1 ^ (n + ( sum.((x:xs)↑i)) = sum.((x:xs)↓i))) : i ⟩
={Por logica}
    n + sum.((x:xs)↑0 = sum.((x:xs)↓0) 
      max ⟨Max i : (1 <= i < #xs + 1 ^ n +( sum.((x:xs)↑i) = sum.((x:xs)↓i))) : i ⟩
={Por def de take}
    n + sum.[] = sum.(x:xs) 
      max ⟨Max i : (1 <= i < #xs + 1 ^ n + (  sum.((x:xs)↑i) = sum.((x:xs)↓i))) : i ⟩
={Por def de sum.[]}
    n = sum.(x:xs) 
      max ⟨Max i : (1 <= i < #xs + 1 ^ n +(  sum.((x:xs)↑i) = sum.((x:xs)↓i))) : i ⟩
={Recursion de sum}
    n = x + sum.xs  
      max ⟨Max i : (1 <= i < #xs + 1 ^ n +( sum.((x:xs)↑i) = sum.((x:xs)↓i))) : i ⟩
={Cambio de variable, i = i + 1, aritmetica}
    n = x + sum.xs  
      max ⟨Max i : (0 <= i < #xs ^ n +( sum.((x:xs)↑(i + 1) = sum.((x:xs)↓(i + 1))) : (i + 1) ⟩
={Por def de take }
    n = x + sum.xs  
        max ⟨Max i : (0 <= i < #xs ^ n + (sum.(x:(xs)↑i) = sum.((x:xs)↓(i + 1))) : (i + 1) ⟩
={Por def de drop }
    n = x + sum.xs  
            max ⟨Max i : (0 <= i < #xs ^ n +( sum.(x:(xs)↑i) = sum.(xs↓i) : (i + 1) ⟩
={Por def de sum}
    n = x + sum.xs  
            max ⟨Max i : (0 <= i < #xs ^ n + (x + sum.(xs↑i)) = sum.(xs↓i) : (i + 1) ⟩
={Constante}
    n = x + sum.xs  
            max ⟨Max i : (0 <= i < #xs ^ n + (x + sum.(xs↑i)) = sum.(xs↓i) : i ⟩ + 1
={Asociatividad aritmetica}
    n = x + sum.xs  
                max ⟨Max i : (0 <= i < #xs ^ (n + x) + sum.(xs↑i)) = sum.(xs↓i) : i ⟩ + 1
={Para usar HI, uso E = n + x}
    n = x + sum.xs  
                    max ⟨Max i : (0 <= i < #xs ^ E + sum.(xs↑i)) = sum.(xs↓i) : i ⟩ + 1
={HI}
    n = x + sum.xs max gF.E.xs

		--Pasos para Generalizar
		--Caso base en  [] o 0, de la espc. (Opcional). Su variacion:
			-- Caso base en [x]
		--Hipotesis inductiva (Opcional)
		--Caso recursivo de x:xs. Alt n + 1. 
		-- Ver si la especificacion es igual en caso base n a la generalizacion
			--pSum.xs == GpSum.0.xs (Esto reemplazara la funcion anteriormente definida)
			--Hipotesis inductiva para la generalizacion, puede que quede algo como (x +) y deba de dejarlo como E +  
			--Caso recursivo para (x:xs). Su variacion:
				-- Caso recursivo (x:(y:ys)). Dependera si pide i,j  o compara dos listas.

		--Notaciones mas importantes: 
		--Recordar las funciones de drop, take y !. (OBLIGATORIO, SI NO ESTAS EN EL HORNO)
		--recordar la tabla de el digesto para los casos bases.
		--Pensar en ejemplos de entrada si no sale a la primera o segundar
		--pensar mucho logicamente
		--Recordar teoremas del practico.
		--Recordarfunciones como prod, suma y #
7)

a)
	cuad : Nat -> Bool 
	Dado un natural determina si es el cuadrado de un numero 

	-No hay listas, uso de n 
	-Devuelve un true 
	-Habra aritmetica
	-Habra de unicidad, uso de existe 

	esCuad.n  = <E i : 0 <= i <= n : i*i = n >

	Caso base
	 	esCuad.0 
	={especificacion}
		<E i : 0 <= i <= 0 : i*i = 0 >
	={Logica}
		<E i : i = 0 : i*i = 0 >
	={Constante ?}
		0 
	
	Hipotesis inductiva 
		esCuad.n  = <E i : 0 <= i < n : i*i = n >

	Paso inductivo, para n = n + 1
		esCuad.(n+1)
	={Especificacion}
		<E i : 0 <= i <= n + 1 : i*i = n + 1 >
	={Logica 0 ≤ i ≤ n ∨ i = n+1}
		<E i : 0 ≤ i ≤ n ∨ i = n+1 : i*i = n + 1 >
	={Particion de rango}
		<E i : i = n+1 : i*i = n + 1 > v <E i : 0 ≤ i ≤ n : i*i = n + 1 >
	={no hay hi}

		Generalizo : 
	gEsCuad.m.n = <E i : 0 ≤ i ≤ n : i*i -m = n > -- m = 1, y lo paso negando para acercarme

	Caso base 
		gEsCuad.m.0 
	={Especificacion }
		<E i : 0 ≤ i ≤ 0 : i*i -m = 0 >
	={Logica}
		<E i : i == 0: i*i -m = 0 >
	={Rango unitario}
		0*0 -m = 0 
	={Logica }
		m = 0

	Hipotesis inductiva
		gEsCuad.m.n = <E i : 0 ≤ i ≤ n : i*i -m = n >

	Caso inductivo
		gEsCuad.m.(n + 1)
	={Especificacion}
		<E i : 0 ≤ i ≤ (n + 1) : i*i -m = (n + 1) >
	={Logica}
		<E i : 0 ≤ i ≤ n v i = n + 1 : i*i -m = (n + 1) >
	={Particion de rango }
		<E i : i = n + 1 : i*i -m = (n + 1) > v <E i : 0 ≤ i ≤ n : i*i -m = (n + 1) >
	={Aritmetica, paso el +1 y saco fc de -}
		<E i : i = n + 1 : i*i -m = (n + 1) > v <E i : 0 ≤ i ≤ n : i*i -(m + 1) = n >
	={HI}
		<E i : i = n + 1 : i*i -m = (n + 1) > v gEsCuad.(m + 1).n
	={Rango unitario}
		n + 1 * n + 1 -m = (n + 1) v gEsCuad.(m + 1).n
	={Aritmetica }
		n * n + n = m v gEsCuad.(m + 1).n

	gEsCuad.m.0 = (m=0)
	gEsCuad.m.(n+1) = gEsCuad.(m+1).n ∨ (n*n + n = m)
	esCuad.n = gEsCuad.0.n


b)
	n8 : [Num] → Nat, que cuenta la cantidad de segmentos iniciales de una lista cuya suma es igual a 8.

	- Es conteo 
	- Es una lista de enteros que da entero
	- cuenta segmentos (concatena)
	- da 8

	cuenta8.xs = <N as, bs : xs = as++bs : sum.as = 8 >

	Caso base 
		cuenta8.[]
	={Especificacion}
		<N as, bs : [] = as++bs : sum.as = 8 >
	={Logica }
		<N as, bs : False : sum.as = 8>
	={Rango vacio}
		0

	Hipotesis inductiva 
		cuenta8.xs = <N as, bs : xs = as++bs : sum.as = 8 >
	
	Caso inductivo
		cuenta8.(x:xs)
	={Especificacion}
		<N as, bs : (x:xs) = as++bs : sum.as = 8 >
	= {tercero excluido } --Por que es o as es vacio y el otro no, y asi.
		<N as, bs : (x:xs) = as++bs ^ True : sum.as = 8 >
	={Logica, puede haber uno con lista vacia y otro no }
		<N as, bs : (x:xs) = as++bs ^ (as = [] v as /= []) : sum.as = 8 >
	={Distributividad}
		<N as, bs : ((x:xs) = as++bs ^ as = []) v ((x:xs) = as++bs ^ as /= []) : sum.as = 8 >
	={Particion de rango}
		<N as, bs : ((x:xs) = as++bs ^ as /= []) : sum.as = 8 > + <N as, bs : ((x:xs) = as++bs ^ as = []) : sum.as = 8 >
	={Por logica si una lista no es vacia, se le pega un elemento}
		<N as, bs : ((x:xs) = (a:as)++bs ^ (a:as) /= []) : sum.as = 8 > + <N as, bs : ((x:xs) = as++bs ^ as = []) : sum.as = 8 >
	={Por logica, elemino (a:as) /= []}
		<N as, bs : ((x:xs) = (a:as)++bs) : sum.as = 8 > + <N as, bs : ((x:xs) = as++bs ^ as = []) : sum.as = 8 >
	={Def de concat }
		<N as, bs : ((x:xs) = (a:(as++bs)) : sum.as = 8 > + <N as, bs : ((x:xs) = as++bs ^ as = []) : sum.as = 8 >
	={Prop de construccion de lista }
		<N as, bs : a = x ^ xs = (as++bs) : sum.as = 8 > + <N as, bs : ((x:xs) = as++bs ^ as = []) : sum.as = 8 >
	={Elim de variable por reemplazo}
		<N as, bs : xs = (as++bs) : sum.(x:as) = 8 > + <N as, bs : ((x:xs) = as++bs ^ as = []) : sum.as = 8 >
	={def de suma }
		<N as, bs : xs = (as++bs) : x + sum.(as) = 8 > + <N as, bs : ((x:xs) = as++bs ^ as = []) : sum.as = 8 >
	={Generalizo, hago especificacion para la part derecha }

	gSumanOcho.k.xs = 〈 N as,bs : xs=as++bs : k + sum.as=8 〉

	Caso base :

	gSumanOcho.k.[ ]
	= { especificación }
		〈 N as,bs : [ ] = as++bs : k + sum.as=8 〉
	= { prop de ++ }
		〈 N as,bs : as = [ ] ∧ bs = [ ] : k + sum.as=8 〉
	= { eliminación de variable }
		〈 N bs : bs = [ ] : k + sum.[ ]=8 〉
		10
		= { def de sum y aritmética }
		〈 N bs : bs = [ ] : k = 8 〉
	= { rango unitario }
		( k = 8 → 1
		☐ ¬ k =8 →
		)

	gSumanOcho.k.(x▶xs)
		〈 N as,bs : ((x▶xs) =as++bs ∧ as = [ ] ) : k + sum.as=8 〉 +
		〈 N as,bs : xs=(as++bs): k + x+ sum.as=8 〉
	= { HI para gSumanOcho.(k+x).xs }
		〈 N as,bs : ((x▶xs) = as++bs ∧ as = [ ] ) : k + sum.as=8 〉 + gSumanOcho.(k+x).xs
	= { eliminación de variable }
		〈 N bs : (x▶xs) = bs : k + sum.[ ] =8 〉 + gSumanOcho.(k+x).xs
	= { def de sum y aritmética }
		〈 N bs : (x▶xs) = bs : k = 8 〉 + gSumanOcho.(k+x).xs
	= { rango unitario }
		( k = 8 → 1
		☐ ¬ k = 8 → 0
		) + gSumanOcho.(k+x).xs

8. skip

9. Expres ́a utilizando cuantificadores las siguientes sentencias del lenguaje natural:
a) La lista xs es un segmento inicial de la lista ys.

-- si dice que es segmento inicial, entonces ys == xs ++ as
-- Para todo (acorazanada)

<A xs, as : ys == xs ++ as : >

b) La lista xs es un segmento de la lista ys.

<A xs, as : ys == as ++ xs : >

c) La lista xs es un segmento final de la lista ys.

<A xs, as : ys == as ++ xs : >

d) Las listas xs e ys tienen en com ́un un segmento no vac ́ıo.

<A as, bs, cs : ys = as ++ bs ^ xs = bs ++ cs : xs ! i == bs àsd0o0u? ?? >
e) La lista xs de numeros enteros tiene la misma cantidad de elementos pares e impares.

<A xs : :>
f) La lista xs posee un segmento no inicial y no final cuyos valores son mayores a los valores del resto
de la misma.

11)
a)
	sumin.xs = ⟨Min as, bs, cs : xs = as ++ bs ++ cs : sum.bc ⟩

1) Caso base, xs = []

		sumin.[]
	={Especificacion}
		⟨Min as, bs, cs : [] = as ++ bs ++ cs : sum.cs ⟩
	={Logica, una lista vacia no esta concatenado de cosas}
		⟨Min as, bs, cs : False : sum.bs ⟩
	={Rango vacio}
		+inf 
	
2)Hipotesis inductiva
	sumin.xs = ⟨Min as, bs, cs : xs = as ++ bs ++ cs : sum.cs ⟩

3) Caso recursivo, para x:xs 

		sumin.(x:xs)
	={especificacion}
		⟨Min as, bs, cs : x:xs = as ++ bs ++ cs : sum.cs⟩
	={Logica de 3ro excluido}
		⟨Min as, bs, cs : x:xs = as ++ bs ++ cs ^ (cs = [] v cs /= []) : sum.cs⟩
	={Distributividad}
		⟨Min as, bs, cs : (x:xs = as ++ bs ++ cs ^ cs = []) v (x:xs = as ++ bs ++ cs ^ cs /= []) : sum.cs⟩
	={Particion de Rango}
		⟨Min as, bs, cs : (x:xs = as ++ bs ++ cs ^ cs /= []) : sum.cs⟩ 
		^	⟨Min as, bs, cs : (x:xs = as ++ bs ++ cs ^ cs = []): sum.cs⟩
	={Logica de listas, si cs /= [], tiene un elemento pegado }
	⟨Min as, bs, cs : (x:xs = as ++ bs ++ c:cs ^ c:cs /= []) : sum.(c:cs)⟩ 
		^	⟨Min as, bs, cs : (x:xs = as ++ bs ++ cs ^ cs = []): sum.cs⟩
	={Reemplazo, y c:cs /= [] es true, neutro de ^}
	⟨Min as, bs, cs : (x:xs = as ++ bs ++ c:cs ^ True) : sum.(c:cs)⟩ 
		^	⟨Min as, bs, cs : (x:xs = as ++ bs ++ cs ^ cs = []): sum.cs⟩
	={Def de ++}
	⟨Min as, bs, cs : (x:xs = c : (as ++ bs ++ cs)) : sum.(c:cs)⟩ 
		^	⟨Min as, bs, cs : (x:xs = as ++ bs ++ cs ^ cs = []): sum.cs⟩
	={Logica de listas}
	⟨Min as, bs, cs : (x = c ^ xs = (as ++ bs ++ cs)) : sum.(c:cs)⟩ 
		^	⟨Min as, bs, cs : (x:xs = as ++ bs ++ cs ^ cs = []): sum.cs⟩
	={Eliminacion de variable}
	⟨Min as, bs, cs : (xs = (as ++ bs ++ cs)) : sum.(x:cs)⟩ 
		^	⟨Min as, bs, cs : (x:xs = as ++ bs ++ cs ^ cs = []): sum.cs⟩
	={Definicion de suma}
	⟨Min as, bs, cs : (xs = (as ++ bs ++ cs)) : x + sum.cs⟩ 
		^	⟨Min as, bs, cs : (x:xs = as ++ bs ++ cs ^ cs = []): sum.cs⟩

	Aca debo de generalizar para x +

	gSumin = ⟨Min as, bs, cs : (xs = (as ++ bs ++ cs)) : E + sum.cs⟩

	Veamos que se cumple que:
	sumin.xs = gSumin.0.xs 

		gSumin.0.xs
	={Especificacion}
		⟨Min as, bs, cs : (xs = (as ++ bs ++ cs)) : 0 + sum.cs⟩
	={Aritmetica}
		⟨Min as, bs, cs : (xs = (as ++ bs ++ cs)) : sum.cs⟩
	={True, se cumple.}

	entonces, si se tiene que:

	sumin.xs = gSumin.0.xs

	Hipotesis inductiva:
	gSumin.E.xs = ⟨Min as, bs, cs : (xs = (as ++ bs ++ cs)) : E + sum.cs⟩
	Ahora derivemos gSumin.E.(x:xs) 

	Caso recursivo, (x:xs)
		gSumin.E.(x:xs) 
	={Especificacion}
		⟨Min as, bs, cs : (xs = (as ++ bs ++ cs)) : E + sum.cs
	={Quedan los mismos pasos, pero se agrega un n + }
	⟨Min as, bs, cs : (xs = (as ++ bs ++ cs)) : n + (x + sum.cs)⟩ 
		^	⟨Min as, bs, cs : (x:xs = as ++ bs ++ cs ^ cs = []): n + sum.cs⟩
	={asociatividad}
	⟨Min as, bs, cs : (xs = (as ++ bs ++ cs)) : ( n + x )+ sum.cs⟩ 
		^	⟨Min as, bs, cs : (x:xs = as ++ bs ++ cs ^ cs = []): n + sum.cs⟩
	={Hipotesis inductiva, con E = n + x }
	gSumin.(n + x).xs 
		^	⟨Min as, bs, cs : (x:xs = as ++ bs ++ cs ^ cs = []): n + sum.cs⟩
	={Cambio de variable}
	gSumin.(n + x).xs 
		^	⟨Min as, bs, cs : (x:xs = as ++ bs ++ []): n + sum.[]⟩
	={Rango unitario, def de sum}
		gSumin.(n + x).xs ^ n + 0

	Caso base, xs = [] --De la generalizacion

		gSumin.E.[]
	={Especifacion}
		⟨Min as, bs, cs : ([]= as ++ bs ++ cs): sum.cs⟩
	={Logica}
		⟨Min as, bs, cs : False : sum.cs⟩
	={Rango vacio}
		+inf


b)

	f.xs = ⟨N as, bs, cs : xs = as ++ bs ++ cs : 8 = sum.bs ⟩ --(cantidad de segmentos que suman eso).

	1) Caso base, para xs []

		f.[]
	={Especificacion}
		⟨N as, bs, cs : [] = as ++ bs ++ cs : 8 = sum.bs ⟩
	={Logica}
		⟨N as, bs, cs : as = [] ^ bs = [] ^ cs = [] : 8 = sum.bs ⟩
	={Cambio de variable}
		⟨N as, bs, cs : as = [] ^ cs = [] : 8 = sum.[] ⟩
	={Rango unitario}
		8 = sum.[]
	={Prop sum  []}
		8

	2) Hipotesis inducitva

		f.xs = ⟨N as, bs, cs : xs = as ++ bs ++ cs : 8 = sum.bs ⟩

	3) caso recursivo, para xs = x:xs

		f.(x:xs)
	={Especificacion}
		⟨N as, bs, cs : x:xs = as ++ bs ++ cs : 8 = sum.bs ⟩
	={Logica de listas, conmutatividad}
		⟨N as, bs, cs : x:xs = as ++ cs ++ bs ^ (bs = [] v bs /= []) : 8 = sum.bs ⟩
	={Distributividad}
		⟨N as, bs, cs : (x:xs = as ++ cs ++ bs ^ bs = []) v ( x:xs = as ++ cs ++ bs ^ bs /= []) : 8 = sum.bs ⟩
	={Particion de rango}
	⟨N as, bs, cs : x:xs = as ++ cs ++ bs ^ bs = [] : 8 = sum.bs ⟩
		v ⟨N as, bs, cs : x:xs = as ++ cs ++ bs ^ bs /= [] : 8 = sum.bs ⟩
	={Logica de listas, si hablamos q una lsita no es vacia, entonces tiene un elemento pegado}
	⟨N as, bs, cs : x:xs = as ++ cs ++ bs ^ bs = [] : 8 = sum.bs ⟩
		v ⟨N as, bs, cs :x:xs = as ++ cs ++ b:bs ^ b:bs /= [] : 8 = sum.bs ⟩
	={Logica de lista, es true y abs}
	⟨N as, bs, cs : x:xs = as ++ cs ++ bs ^ bs = [] : 8 = sum.bs ⟩
		v ⟨N as, bs, cs : x:xs = as ++ cs ++ b:bs : 8 = sum.(b:bs) ⟩
	={Logica de listas}
	⟨N as, bs, cs : x:xs = as ++ cs ++ bs ^ bs = [] : 8 = sum.bs ⟩
		v ⟨N as, bs, cs : x:xs = b:(as ++ cs ++ bs) : 8 = sum.(b:bs) ⟩
	={Logica de listas, def de ++ }
	⟨N as, bs, cs : x:xs = as ++ cs ++ bs ^ bs = [] : 8 = sum.bs ⟩
		v ⟨N as, bs, cs : x:xs = b:(as ++ cs ++ bs) : 8 = sum.(b:bs) ⟩
	={Logica de listas }
	⟨N as, bs, cs : x:xs = as ++ cs ++ bs ^ bs = [] : 8 = sum.bs ⟩
		v ⟨N as, bs, cs : x = b ^ xs = (as ++ cs ++ bs) : 8 = sum.(b:bs) ⟩
	={Cambio de variable}
	⟨N as, bs, cs : x:xs = as ++ cs ++ bs ^ bs = [] : 8 = sum.bs ⟩
		v ⟨N as, bs, cs : xs = (as ++ cs ++ bs) : 8 = sum.(x:bs) ⟩
	={Def. de sum }
	⟨N as, bs, cs : x:xs = as ++ cs ++ bs ^ bs = [] : 8 = sum.bs ⟩
		v ⟨N as, bs, cs : xs = (as ++ cs ++ bs) : 8 = x + sum.bs ⟩


	--Pasos para Segmentacion
		--Caso base de la espc. (Opcional). Su variacion:
			-- Caso base en []
		--Hipotesis inductiva (Opcional) (Lo mejor es tenerla)
		--Caso recursivo de x:xs. --
			-- En la recursion, hacer la logica de listas (as = [] o as /= []) en el que este en el termino, de lo contrario no se peude hacer nada
		--Generalmente cuando se termina una segmentacion, se debe generalizar. No partas desde el inicio, puedes usar lo que has hecho (Ej, 11 a)
			-- Ver si la especificacion es igual en caso base n a la generalizacion
				--pSum.xs == GpSum.0.xs (Esto reemplazara la funcion anteriormente definida)
				--Hipotesis inductiva para la generalizacion, puede que quede algo como (x +) y deba de dejarlo como E +  
				--Caso recursivo para (x:xs). Su variacion:
					-- Caso recursivo (x:(y:ys)). Dependera si pide i,j  o compara dos listas.

		--Notaciones mas importantes: 
		--3ro excluido va si o si. def de listas y ++
		--Cuando se hace particion de rango, busco la HI en /= []
		--Usen la lista que este en el termina.
		--Si se generaliza, primero la indccuoin y luego el caso base.
		--Rango unitario si o si en lo que uqede a lista vacia 
		--recordar la tabla de el digesto para los casos bases.
		--Pensar en ejemplos de entrada si no sale a la primera o segundar
		--pensar mucho logicamente si se traba
		--Recordar teoremas del practico.
		--Recordar funciones como prod y suma 

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
Como funciona el caso base en la segmentacion
-}

Parcial 2023
1)
    a)

    f.xs = <A i : 0 <= i < #xs : (-1)^xs!i >= 0 >

    -- Es una funcion que toma un numero de la lista de xs en indice i, 
    -- que si es par es positivo y mayor que 0, y si es impar seria negativa y menor que 0
        
    --Analisis:

        [2,3,4]
        (-1)^xs!0 = 1 >= 0 = True 
        (-1)^xs!1 = -1 >= 0 = False  

    1) Caso base, xs = []

        f.[]
    ={Especificacion}
        <A i : 0 <= i < #[] : (-1)^[]!i >= 0 >
    ={Definicion de # en caso base, = 0}
        <A i : 0 <= i < 0 : (-1)^[]!i >= 0 >
    ={Logica}
        <A i : False : (-1)^[]!i >= 0 >
    ={Rango vacio}
        True 

    2) especificacion, se que vale:
        f.xs = <A i : 0 <= i < #xs : (-1)^xs!i >= 0 >

    3) Caso inductivo, para xs = (x:xs)

        f.(x:xs)
    ={Especificacion}
        <A i : 0 <= i < #(x:xs) : (-1)^(x:xs)!i >= 0>
    ={# en caso recursivo}
        <A i : 0 <= i < 1 + #xs : (-1)^(x:xs)!i >= 0>
    ={Por logica, 0 <= i < 1 + #xs == i = 0 ∨ 1 ≤ i < n + 1 }
        <A i : i = 0 ∨ 1 ≤ i < #xs + 1  : (-1)^(x:xs)!i >= 0>
    ={Particion de rango}
        <A i : i = 0  : (-1)^(x:xs)!i >= 0> v <A i : 1 ≤ i < #xs + 1 : (-1)^(x:xs)!i >= 0>
    ={Cambio de variable, i = i +1}
        <A i : i = 0  : (-1)^(x:xs)!i >= 0> v <A i : 1 ≤ i + 1 < #xs + 1 : (-1)^(x:xs)!(i + 1) >= 0>
    ={Algebra / Aritmetica}
        <A i : i = 0  : (-1)^(x:xs)!i >= 0> v <A i : 0 ≤ i < #xs  : (-1)^(x:xs)!(i + 1) >= 0>
    ={Rango unitario}
        (-1)^(x:xs)!0 >= 0 v <A i : 0 ≤ i < #xs  : (-1)^(x:xs)!(i + 1) >= 0>
    ={Definicion de !}
        (-1)^x >= 0 v <A i : 0 ≤ i < #xs : (-1)^(x:xs)!(i + 1) >= 0>
    ={Definicion de !}
        (-1)^x >= 0 v <A i : 0 ≤ i < #xs : (-1)^xs!i >= 0>
    ={Hipotesis inductiva }
        (-1)^x >= 0 v f.xs

        Modularizacion sobre 
            pot.X = (-1)^x 

    1) Caso base, x = 0

        pot.0
    ={Especificacion}
        (-1)⁰
    ={Aritmetica}
        1

    2) Hipotesis inductiva
        pot.X = (-1)^x

    3) Caso inductivo, para x = x + 1

        pot.(x + 1)
    ={Especificacion}
        (-1)^(x + 1)
    ={Aritmetica}
        (-1)^x * 1 

    Listo, quedando:

    pot.x >= 0 v f.xs


b) 

    xs = [2,4,6]
    
        <A i : 0 <= i < #xs : (-1)^xs!i >= 0 >
    ={Introduccion de xs}
        <A i : i e {2,4,6} : (-1)^xs!i >= 0 >
    ={Aplico el termino a cada elemento del rango}
        ((-1)^xs!0 >= 0) ^ ((-1)^xs!1 >= 0) ^ ((-1)^xs!2 >= 0) 
    ={Evaluo las indexacciones }
        ((-1)^2 >= 0) ^ ((-1)^4 >= 0) ^ ((-1)^6 >= 0) 
    ={Algebra}
        (1 >= 0) ^ (1>= 0) ^ (1 >= 0) 
    ={Logica}
        True ^ True ^ True 
    ={Abs}
        True 
c) 
    xs = [1,3,5]

        <A i : 0 <= i < #xs : (-1)^xs!i >= 0 >
    ={Introduccion de xs}
        <A i : i e {1, 3, 5} : (-1)^xs!i >= 0 >
    ={Aplico el termino a cada elemento del rango}
        ((-1)^xs!0 >= 0) ^ ((-1)^xs!1 >= 0) ^ ((-1)^xs!2 >= 0) 
    ={Evaluo las indexacciones }
        ((-1)^1 >= 0) ^ ((-1)^3 >= 0) ^ ((-1)^5 >= 0) 
    ={Algebra}
        (-1 >= 0) ^ (-1>= 0) ^ (-1 >= 0) 
    ={Logica}
        False ^ False ^ False 
    ={Abs}
        False 

2)

pin8.xs = <E as, bs : xs = as ++ bs : prod.as = 8>

caso base, xs = [ ]

    pin8.[ ] 
= { Especificacion }
    < E as, bs : [ ] = as ++ bs : prod.as = 8 >
= { lógica de listas }
    < E as, bs : as = [ ] ∧ bs = [ ] : prod.as = 8 >
= { cambio de variable, as = [ ] }
    < E bs : bs = [ ] : prod.[ ] = 8 >
= { rango unitario } 
    prod.[ ] = 8 

h.i.: pin8.xs <E as, bs : xs = as ++ bs : prod.as = 8>

    pin8.(x:xs)
= { especifcacion }
    < E as, bs : (x:xs) = as ++ bs : prod.as = 8 >
= { elemento neutro / Tercer excluido }
    < E as, bs : (x:xs) = as ++ bs ^ True  : prod.as = 8 >
= { tercero excluido }
    < E as, bs : (x:xs) = as ++ bs ^ (as = [] v as /= []) : prod.as = 8 >
= { distributividad de ^ con v, p = (x:xs) = as ++ bs, q = as = [], r = as /= [] }
    < E as, bs : ((x:xs) = as ++ bs ^ as = []) v ((x:xs) = as ++ bs ^ as /= []) : prod.as = 8 >
= { partición de rango }
    < E as, bs : ((x:xs) = as ++ bs ^ as = []) : prod.as = 8 > v < E as, bs : ((x:xs) = as ++ bs ^ as /= []) : prod.as = 8 >
={Logica de listas}
    < E as, bs : ((x:xs) = as ++ bs ^ as = []) : prod.as = 8 > v < E as, bs : ((x:xs) = as ++ bs ^ a:as /= []) : prod.as = 8 >
={lógica de listas, a:as /= [] es true, neutro de ^}
    < E as, bs : ((x:xs) = as ++ bs ^ as = []) : prod.as = 8 > v < E as, bs : ((x:xs) = as ++ bs ^ True : prod.as = 8 >
={Reemplazo por la logica (leibniz), abs True}
    < E as, bs : ((x:xs) = as ++ bs ^ as = []) : prod.as = 8 > v < E as, bs : (x:xs) = a:as ++ bs : prod.(a:as) = 8 >
= { por lógica de listas }
    < E as, bs : ((x:xs) = as ++ bs ^ as = []) : prod.as = 8 > v < E as, bs : (x:xs) = a:(as ++ bs) : prod.(a:as) = 8 >
= { por lógica de listas } 
    < E as, bs : ((x:xs) = as ++ bs ^ as = []) : prod.as = 8 > v < E as, bs : x = a ^ xs = (as ++ bs) : prod.(a:as) = 8 >
= { cambio de variable }
    < E as, bs : ((x:xs) = as ++ bs ^ as = []) : prod.as = 8 > v < E as, bs : xs = (as ++ bs) : prod.(x:as) = 8 >
= { por def de prod }
    < E as, bs : ((x:xs) = as ++ bs ^ as = []) : prod.as = 8 > v < E as, bs : xs = (as ++ bs) : x * prod as = 8 >

--¿debo resolver el lado izq en recursion sin generalizar? RESUELTO, SI. 

Aca debo de generalizar para x *

    Denotemos gPin8.E.xs 

	gPin8.E.xs = < E as, bs : xs = (as ++ bs) : E * prod as = 8>

    Debemos ver que :
        pin8.xs = gPin8.1.xs

	Veamos que se cumple que:
	    gPin8.1.xs
    ={Especificacion}
        < E as, bs : xs = (as ++ bs) : 1 * prod as = 8 >
    ={Aritmetica}
        <E as, bs : xs = as ++ bs : prod.as = 8 >
    ={Cumple igualdad}
        pin8.xs = gPin8.1.xs

	Especificacion:
	gPin8.E.xs = < E as, bs : xs = (as ++ bs) : E * prod as = 8 >

	Ahora derivemos gPin8.E.xs

	Caso recursivo, (x:xs)
		gPin8.E.(x:xs) 
	={Especificacion}
		< E as, bs : x:xs = (as ++ bs) : n * prod as = 8 >
	={Quedan los mismos pasos, pero se agrega un n * }                  -- LEGAL? no.
	    < E as, bs : (x:xs = as ++ bs ^ as = []) : prod.as = 8 > 
        v < E as, bs : xs = (as ++ bs) : n * (x * prod.as = 8) >        
    ={Asociatividad aritmetica}        
	    < E as, bs : (x:xs = as ++ bs ^ as = []) : prod.as = 8 > 
            v < E as, bs : xs = (as ++ bs) : (n * x) * prod.as = 8 >        
    ={Por hi, E = n * x }
    < E as, bs : (x:xs = as ++ bs ^ as = []) : prod.as = 8 > 
            v < E as, bs : xs = (as ++ bs) : E * prod.as = 8 > 
    ={HI}
        < E as, bs : (x:xs = as ++ bs ^ as = []) : prod.as = 8 >  v gPin8.(n * x).xs 
    ={Cambio de variable }
        < E as, bs : (x:xs = [] ++ bs) : prod.[] = 8 >  v gPin8.(n * x).xs
    ={Rango unitario}
        prod.[] = 8 v gPin8.(n * x).xs

Caso Inductivo (x⊳xs)
f.(x⊳xs)
≡ {Especificacion}
〈∀i : 0 ≤ i < #(x⊳xs) : (-1)^((x⊳xs)!i) ≥ 0〉
≡ {Definicion #}
〈∀i : 0 ≤ i < #xs + 1 : (-1)^((x⊳xs)!i) ≥ 0〉
≡ {Logica}
〈∀i : i = 0 ∨ 1 <= i < #xs + 1 : (-1)^((x⊳xs)!i) ≥ 0〉
≡ {Particion Rango}
〈∀i : i = 0 : (-1)^((x⊳xs)!i) ≥ 0〉 ∧ 〈∀i : 1 <=  i < #xs + 1 : (-1)^((x⊳xs)!i) ≥ 0〉
≡ {Rango Unitario}
(-1)^((x⊳xs)!0) ≥ 0 ∧ 〈∀i : 1 <=  i < #xs + 1 : (-1)^((x⊳xs)!i) ≥ 0〉
≡ {Definicion !}
(-1)^(x) ≥ 0 ∧ 〈∀i : 1 <=  i < #xs + 1 : (-1)^((x⊳xs)!i) ≥ 0〉
≡ {Cambio Variable i = j+1}
(-1)^(x) ≥ 0 ∧ 〈∀j : 1 <=  j+1 < #xs + 1 : (-1)^((x⊳xs)!j+1) ≥ 0〉
≡ {Algebra, Definicion !}
(-1)^(x) ≥ 0 ∧ 〈∀j : 0 ≤ j < #xs : (-1)^(x!j) ≥ 0〉
≡ {Especificacion}
(-1)^(x) ≥ 0 ∧ f.xs

Ej de clase:
--------------------------------

Caso Inductivo (x⊳xs)
p.(x⊳xs)
≡ {Especificacion}
    〈∃as,b,bs : (x⊳xs) = as ++ (b⊳bs) : b = sum.as + sum.bs〉
≡ {Tercero Excluido}
    〈∃as,b,bs : (x⊳xs) = as ++ (b⊳bs) ^ True : b = sum.as + sum.bs〉
={Logica de listas /  Def de true / tercer excluido / Neutro de ^ }
    〈∃as,b,bs : (x⊳xs) = as ++ (b⊳bs) ^ (as = [] v as /= []) : b = sum.as + sum.bs〉
={Distributividad de ^ con v}
    〈∃as,b,bs : ((x⊳xs) = as ++ (b⊳bs) ^ as = []) v ((x⊳xs) = as ++ (b⊳bs) ^as /= []) : b = sum.as + sum.bs〉
={Particion de rango }
    〈∃as,b,bs : ((x⊳xs) = as ++ (b⊳bs) ^ as = []) : b = sum.as + sum.bs〉 v 〈∃as,b,bs : v ((x⊳xs) = as ++ (b⊳bs) ^as /= []) : b = sum.as + sum.bs〉


sum [] = 0
sum (x:xs) = x + sum xs 

3)
    a) ANALISIS:
    -Habla de cantidad, seria conteo. Descartamos para todo, existe y otros ya que no habla de eso
    -No cuenta a 1 ni a n mismo, empieza de mayor a cero. Seria el termino. 
    - El rango es para contar los elementos que den lo dicho. Quedando:

    <N i : 0 < i < n : n 'mod' i = 0 >

    b) 
    -Si xs tiene algun segmento (o sea, parte de la lista) cuya suma, es mayor
    que la suma TOTAL de la lista ys

    -Si estamos viendo segmentos habra un take en la lista xs -- NO
    -Funcion sum en comparacion. 
    -Mayor. 
    -El termino seria de la manera (mas o menos)    
        -sum.xs take i  > sum.ys 
    -existe, ya que es ALGUN

    segProblema :: Eq => [Int] -> [Int] -> Bool 
    segProblema.xs = <E ys, as, bs : xs = as ++ bs : (sum.as v sum.bs) > sum.ys ^ xs /= ys >


    
creciente.xs = <A i,j : 0 <= i < j < #xs : xs!i <= xs!j>

16. Sea fib la definici ́on recursiva est ́andar para la funci ́on de Fibonacci. Deriv ́a la funci ́on de Fibolucci. 

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

fbi : Nat → Nat
fbl.n = ⟨sum i : 0 ≤ i < n : fib.i + fib.(n − i)⟩

Nuestra especificacion es la siguiente: 
fbl.n = ⟨sum i : 0 ≤ i < n : fib.i + fib.(n − i)⟩

Caso base, n = 0. 

    fbl.0
={Especificacion}
    ⟨sum i : 0 ≤ i < 0 : fib.i + fib.(n − i)⟩
={Logica }
    ⟨sum i : False : fib.i + fib.(n − i)⟩
={Rango vacio}
    0

"Hipotesis inductiva" / Especificacion: 
Recordemos que vale:     
    fbl.n = ⟨sum i : 0 ≤ i < n : fib.i + fib.(n − i)⟩

Caso inductivo 
    fbl.(n+1)
={Especificacion}
    ⟨sum i : 0 ≤ i < (n + 1) : fib.i + fib.((n + 1) − i)⟩
={Logica}
    ⟨sum i : i = n v 0 <= i < n  : fib.i + fib.((n + 1) − i)⟩
={Particion de rango }
    ⟨sum i : i = n : fib.i + fib.((n + 1) − i)⟩ + ⟨sum i :  0 <= i < n  : fib.i + fib.((n + 1) − i)⟩
={Rango unitario }
    fib.n + fib.((n + 1) − i) + ⟨sum i :  0 <= i < n : fib.i + fib.((n + 1) − i)⟩
={ fib.n+1 = fib.1 + fib.n (Porrito)}
    fib.n + fib.((n + 1) − i) + ⟨sum i : 0 <= i < n  : fib.1 + fib.i + fib.(n - i)⟩
={Def de fib.1}
    fib.n + fib.((n + 1) − i) + ⟨sum i : 0 <= i < n  : 1 + fib.i + fib.(n - i)⟩


Otra manera: (Cambia la logica)
={Particion de rango }
    ⟨sum i : i = 0 : fib.i + fib.((n + 1) − i)⟩ + ⟨sum i : 1 <= i < n + 1 : fib.i + fib.((n + 1) − i)⟩
={Cambio de variable, i = i + 1, algebra}
    ⟨sum i : i = 0 : fib.i + fib.((n + 1) − i)⟩ + ⟨sum i : 0 <= i < n  : fib.(i + 1) + fib.((n + 1) − (i + 1))⟩
={Aritmetica}
    ⟨sum i : i = 0 : fib.i + fib.((n + 1) − i)⟩ + ⟨sum i : 0 <= i < n  : fib.(i + 1) + fib.((n - i))⟩
={Rango unitario}   
    fib.0 + fib.((n + 1) − 0) + ⟨sum i : 0 <= i < n  : fib.(i + 1) + fib.((n - i))⟩
={Aritmetica, fibonacci en caso.0}
    0 + fib.(n + 1) + ⟨sum i : 0 <= i < n  : fib.(i + 1) + fib.(n - i)⟩
={Aritmetica}
    fib.(n + 1) + ⟨sum i : 0 <= i < n  : fib.(i + 1) + fib.(n - i)⟩
={ fib.i+1 = fib.1 + fib.i (Porrito)}
    fib.(n + 1) + ⟨sum i : 0 <= i < n  : fib.1 + fib.i + fib.(n - i)⟩
={Def de fib.1}
    fib.(n + 1) + ⟨sum i : 0 <= i < n  : 1 + fib.i + fib.(n - i)⟩

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

made by maxi

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

Parcial 2 2023)

1) 
    a) 
    ev : Int -> [Int] -> Int 
    ev.z.xs = <Sum i : 0 <= i < #xs : z^i * xs ! i>    

    1) Especificacion dada: 
    ev.z.xs = <Sum i : 0 <= i < #xs : z^i * xs ! i>    

    Analizemos la especifciacion:
    -- Es una suma 
    -- Habria una generalizacion de z^i (¿y modularizacion?)
    -- Usa un producto de un elemnto de la lista

    2) Caso base xs = []
        ev.z.[]
    ={Especificacion}
        <Sum i : 0 <= i < #[] : z^i * [] ! i>
    ={Por # en caso base}
        <Sum i : 0 <= i < 0 : z^i * [] ! i>
    ={Por logica}
        <Sum i : False : z^i * [] ! i>
    ={Rango vacio}
        0
{-
    3) Caso base z = 0
        ev.0.[]
    ={Especificacion}
        <Sum i : 0 <= i < #xs : 0^i * xs ! i>
    ={Aritmetica}
        <Sum i : 0 <= i < #xs : 0 * xs ! i>
    ={Aritmetica}
        <Sum i : 0 <= i < #xs : >
Redundatne, no sirve
-}

    3) Caso inductivo, para xs = (x:xs)

        ev.z.(x:xs)
    ={Especificacion}
        <Sum i : 0 <= i < #(x:xs) : z^i * (x:xs) ! i>  
    ={Def # en caso recursivo}
        <Sum i : 0 <= i < 1 + #xs : z^i * (x:xs) ! i>  
    ={Por logica}
        <Sum i : i = 0 v 1 <= i < #xs + 1 : z^i * (x:xs) ! i>  
    ={Particion de rango}
        <Sum i : i = 0 : z^i * (x:xs) ! i> + <Sum i : 1 <= i < #xs + 1 : z^i * (x:xs) ! i>  
    ={Cambio de variable}
        <Sum i : i = 0 : z^i * (x:xs) ! i> + <Sum i : 1 <= i < #xs + 1 : z^i * (x:xs) ! i>  
    ={Rango unitario}
        z^0 * (x:xs) ! 0 + <Sum i : 1 <= i < #xs + 1 : z^i * (x:xs) ! i>  
    ={Aritmetica}
        (x:xs) ! 0 + <Sum i : 1 <= i < #xs + 1 : z^i * (x:xs) ! i>  
    ={Def de !}
        x + <Sum i : 1 <= i < #xs + 1 : z^i * (x:xs) ! i>  
    ={Cambio de variable, i = i + 1 y algebra}
        x + <Sum i : 0 <= i < #xs : z^(i + 1) * (x:xs) ! (i + 1)>  
    ={Def de !, aritmetica}
        x + <Sum i : 0 <= i < #xs : (z^i * z) * xs!i >
    ={Aca supongamos que, o bien hay que generalizar (no tengo ganas) o modularizar para z^i pero no sabria decir si hay q modularizarlo}  


b)
ev.z.xs = <Sum i : 0 <= i < #xs : z^i * xs ! i>   
Para ev.2.[0,1,0,1,2]

    ev.2.[0,1,0,1,2]
={Especificacion, xs = [0,1,0,1,2],  z = 2, calculo rango sabiendo que #xs = 4 }}
    <Sum i : i e {0,1,2,3,4} : 2^i * xs ! i>
={aplico el t ́ermino a cada elemento del rango}
    (2⁰ * [0,1,0,1,2] ! 0) + (2¹* [0,1,0,1,2] ! 1) + (2² * [0,1,0,1,2] ! 2) + (2³ * [0,1,0,1,2] ! 3) + (2⁴ * [0,1,0,1,2] ! 4)
={eval ́uo las indexaciones con xs = [0,1,0,1,2]}
    (2⁰ * 0) + (2¹* 1) + (2² * 0) + (2³ * 1) + (2⁴ * 2)
={Aritmetica / Evaluacion}
    0 + 2 + 0 + 8 + 32 = 42
    




































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
    segProblema.xs = <E ys, as, bs : xs = as ++ bs : (sum.as v sum.bs) > sum.ys >
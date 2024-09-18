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

De manera obligatoria, se debe unar:

={++ACCION EN LA ESPECIFICACION++}

    f.(x:xs)
={Especificacion}
    <*Especificacion*>




En el paso inductivo, los rangos de la forma
0 ≤ i < n + 1
se pueden partir de dos maneras. Por el principio:
i = 0 ∨ 1 ≤ i < n + 1 (1)
o por el final:
0 ≤ i < n ∨ i = n

TMB:
0 ≤ i < j < #xs + 1
se deben reescribir de la forma
(i = 0 ∧ 0 < j < #xs + 1) ∨ (1 ≤ i < j < #xs + 1)
Vale para n=xs

Si hay que hacer una comparacion de elementos de una misma lista(xs!i = xs!j), debe evaluarse en x:(y:ys) y tiene 2 casos base, [] y [x]

Si pide hacer una especificacion con el lenguaje natural, desglozar por partes las cosas, para rascar puntos

0 ≤ x ≤ (n+1)
Vale:
0 ≤ x ≤ n ∨ x = n+1 

INDICE
! : [A] → Nat → A
(x . xs) ! 0 = x
(x . xs) ! (n + 1) = xs ! n

CONCATENAR
+ : [A] → [A] → [A]
[ ] ++ ys = ys
(x . xs) ++ ys = x :(xs ++ ys)

DROP
↓ : [A] → Nat → [A]
[ ] ↓ n = [ ]
(x . xs) ↓ 0 = x . xs
(x . xs) ↓ (n + 1) = xs ↓ n

TAKE

↑ : [A] → Nat → [A]
[ ] ↑ n = [ ]
(x . xs) ↑ 0 = [ ]
(x . xs) ↑ (n + 1) = x . (xs ↑ n)


hd : [A] → A
hd.(x . xs) = x

tl : [A] → [A]
tl.(x . xs) = xs

Evaluacion manual de forma:

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

    En las listas se empieza a contar desde 0 
-}
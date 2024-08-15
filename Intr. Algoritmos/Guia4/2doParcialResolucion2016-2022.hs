--Parcial 2016

    --Demostrar que las siguientes f´ormulas son teoremas del C´alculo Proposicional. En cada paso de
    --la demostraci´on indique que axioma o teorema se utiliza, y subraye la subf´ormula involucrada.
    --Se pueden utilizar, sin demostrar, los axiomas y teoremas dados en el Digesto Proposicional.
    a) [15 pto(s)] (p ⇒ q) ⇒ (p ∧ r ⇒ q ∧ r).

        (p ⇒ q) ⇒ (p ∧ r ⇒ q ∧ r)
    ={T19 Caracterizacion de ->}
        -(p ⇒ q) -> (p ∧ r ⇒ q ∧ r)
    ={A13 definicion de ->}
        -(-((p v q) = q)) -> (p ∧ r ⇒ q ∧ r)
    ={T12 De morgan para v}
        -(-p ∧ -q = -q) -> (p ∧ r ⇒ q ∧ r)
    ={T13 de morgan ∧}
        (p v q = q) -> (p ∧ r ⇒ q ∧ r)
    ={T19 Caracterizacvion de ->}
        (p v q = q) -> (-(p ∧ r) v (q v r))
    ={T13 De morgan para ∧}
        (p v q = q) -> ((-p v -r) v (q v r))
    ={T19 caracterizacion de ->}
        -(p v q = q) v ((-p v -r) v (q v r))
    ={12 De morgan para v}        
        (-p ∧ -q = -q) v ((-p v -r) v (q v r))
    ={Ref de =}
        (-p ∧ True) v ((-p v -r) v (q v r))
    ={T9 Neutro ∧}
        (-p) v ((-p v -r) v (q v r))
    ={Distributividad de v}
        (-p v -p v -r) v (-p v q v r)
    ={A9 Idempotencia}
        (-p v -r) v (-p v q v r)

    b) [15 pto(s)] (p ⇒ q) ∨ r ≡ p ∨ q ∨ r ≡ q ∧ r ≡ q ≡ r. 


        (p ⇒ q) ∨ r ≡ p ∨ q ∨ r ≡ q ∧ r ≡ q ≡ r. 
    ={A13 definicion de ->}
        (p v q = q) v r = p ∨ q ∨ r ≡ q ∧ r ≡ q ≡ r. 
    ={Conmutatividad}
        (p v q = q) v r = r ∨ p ∨ q ≡ q ∧ r ≡ q ≡ r. 
    ={A12 Dorada}
        (p v q = q) v r = r ∨ p ∨ q ≡ (q = r = q v r) ≡ q ≡ r. 
    ={}

para vamos a hacer el del miercoles (recuperatorio del 2022):

    --1. [25 pto(s)] Demostrar que la siguiente fórmula es un teorema del Cálculo Proposicional. En
    --cada paso de la demostración indicar qué axioma o teorema se utiliza, y subrayar la subfórmula
    --involucrada. Se pueden utilizar, sin demostrar, los axiomas y teoremas dados en el Digesto
    --Proposicional.

        ((p ∨ q) ⇒ r) ⇒ (¬r ⇒ ¬q) ≡ ¬(p ∧ ¬p)
    ={T19 Caracterizacion de ->, p = p v q, q= r}
        (-(p ∨ q) v r) ⇒ (¬r ⇒ ¬q) ≡ ¬(p ∧ ¬p)
    ={T12 De morgan}    
        ((-p ∧ -q) v r) ⇒ (¬r ⇒ ¬q) ≡ ¬(p ∧ ¬p)
    ={Conmutacion}
        (r v (-p ∧ -q)) ⇒ (¬r ⇒ ¬q) ≡ ¬(p ∧ ¬p)
    ={T14 Distributividad, p = r, q= -p, r= -q}
        ((r v -q) ∧ (r v -p)) ⇒ (¬r ⇒ ¬q) ≡ ¬(p ∧ ¬p)
    ={T13 De morgan para ∧}
        ((r v -q) ∧ (r v -p)) ⇒ (¬r ⇒ ¬q) ≡ (-p v ¬-p)
    ={T1 Doble negaciòn}
        ((r v -q) ∧ (r v -p)) ⇒ (¬r ⇒ ¬q) ≡ (-p v p)
    ={T19 Caracterizacion y T1 Doble negacion}
        ((r v -q) ∧ (r v -p)) ⇒ (r v ¬q) ≡ (-p v p)
    ={T19 Caracterizacion de ->}
        -((r v -q) ∧ (r v -p)) v (r v ¬q) ≡ (-p v p)
    ={T13 De morgan}
        (-(r v -q) v -(r v -p)) v (r v ¬q) ≡ (-p v p)
    ={T12 De morgan 2 veces}
        ((-r ∧ -¬q) v (-r ∧ -¬p)) v (r v ¬q) ≡ (-p v p)
    ={T1 Doble negacion}
        ((-r ∧ q) v (-r ∧ p)) v (r v ¬q) ≡ (-p v p)
    ={Elim Parentesis superfluo}
        -r ∧ q v -r ∧ p v r v ¬q ≡ (-p v p)
    ={Conmutacion de -r}
        -r ∧ -r v q ∧ p v r v ¬q ≡ (-p v p)
    ={T8 Idempotencia}
        -r v q ∧ p v r v ¬q ≡ (-p v p)
    ={A11 Tercero excluido}
        -r v q ∧ p v r v ¬q ≡ True
    ={Conmutacion de -r y r}
        -r v r ∧ q v p v -q = True
    ={A11 Tercero excluido}
        True ∧ q v p v -q = true
    ={T10 Elemento absorbente ∧}
        True v p v -q = True
    ={T3 Elemento absorbente v}
        True v -q = True
    ={T3 Elemento absorbente}
        True = True
    ={Valido por ref. Equivalencia}

    --bien

    q o -q = True
    p o -p = True

    --2. [25 pto(s)] Formalizar las siguiente propiedad escrita en lenguaje natural, en el lenguaje de la
    --lógica de predicados:

    --a) “xs es una lista de Figura y existe una único cuadrado rojo en la lista xs”

    ejemplos xs = [(Cuadrado, Rojo, 3)] 
    ejemplos xs = [(Cuadrado, Rojo, 3), (Rombo,Azul,2)]
    contraejemplo xs = []
    contraejemplo xs = [(Cuadrado, Rojo, 3), (Cuadrado, Rojo, 4)]
    contraejemplo xs = [(Rombo, Rojo, 3)]

    1- Xs es una lista de figura
    2- Unico cuadrado rojo

    se que es una unicidad, y que aparece una vez el cuadrado Y LUEGOO, el rojo.

    xs :: [Figura] = <Ei : 0 <= i < (length xs) : cuadrado xs!!i ∧ rojo x ∧ <Aj : 0 <= j < length xs ∧ i /= j : -(cuadrado xs!!i ∧ rojo xs!!i)>>
    --bien
    cuadrado xs!!i ES == Hay un cuadrado en la primera TUPLA de xs. 
    o mejor dicho, mira en en i (i cualq num), si hay un cuadrado
    xs!!i -> elemento en la posicion i

    -- ayuda :
    --d) Hay un ´único cuadrado azul en xs
    --xs :: [Forma] ^ <E x, i : x e xs : 0 <= i < length xs ∧ cuadrado xs!!i ∧ azul xs!!i : 
    --            <∀ j: 0 <= j < length xs ∧ i/=j:  ¬(azul.xs!!j) ∧  ¬(cuadrado.xs!!j)>> 

    
    --3. [25 pto(s)] Demostrar que la siguiente fórmula es teorema del Cálculo de Predicados. En cada paso de la demostración indique qué axioma o teorema se utiliza, y subraye la subfórmula involucrada.
    --Se pueden utilizar, sin demostrar, los axiomas y teoremas dados en el Digesto Proposicional y
    --en el Digesto de Predicados.

    NOTA: : : es TRUE, esto no tiene TERMINO, tiene RANGO

        <∃x : : T.x ⇒ S.x> ≡ <∀x : : T.x> ⇒ <∃x : : S.x>
    ={T19 Caracterizacion de ->}
        <∃x : : T.x ⇒ S.x> ≡ -<∀x : : T.x> v <∃x : : S.x>
    ={A5 Definicion E}
        <∃x : : T.x ⇒ S.x> ≡ -<∀x : : T.x> v <Ex : : S.x>
    ={A5 Definicion de E}
        <∃x : : T.x ⇒ S.x> ≡ <Ex : : -T.x> v <Ex : : S.x>
    ={T1 Doble negacion}
        <∃x : : T.x ⇒ S.x> ≡ <Ex : : -T.x> v <Ex : : S.x>
    ={T7 Regla del termino de E}
        <∃x : : T.x ⇒ S.x> ≡ <Ex : : -T.x v S.x>
    ={T19 Caracterizacion de ->}
         <∃x : : -T.x v S.x> ≡ <Ex : : -T.x v S.x> --bien

    

    --4. [25 pto(s)] Dada la definición de la función todosRA y de la función pert :

    hayCNV :: [Figura] -> Bool
    hayCNV [ ] = False                                              1
    hayCNV (x:xs) = (cuadrado x && not (verde x) ) || hayCNV xs     2

    pert :: a -> [a] -> Bool    
    pert e  [ ] = False                                             3
    pert e (x : xs) = (e == x) || pert e xs                         4

        --demostrar por inducción la siguiente fórmula

            hayCNV xs ≡ <∃y : y ∈ xs : ¬(¬cuadrado.y ∨ verde.y)>.

    --1) Caso base, pruebo que vale para xs = []

            hayCNV [] ≡ <∃y : y ∈ [] : ¬(¬cuadrado.y ∨ verde.y)>.
        ={Impl De codigo 1. Caso base de hayCNV}
            False = <∃y : y ∈ [] : ¬(¬cuadrado.y ∨ verde.y)>.
        ={Impl Codigo pert e}
            False = <∃y : pert y [] : ¬(¬cuadrado.y ∨ verde.y)>.
        ={Caso base de pert e}
            False = <∃y : False : ¬(¬cuadrado.y ∨ verde.y)>.
        ={T14 Rango vacio de E}
            False = False   

    --2) Planteo de hipotesis inductiva

        hayCNV xs ≡ <∃y : y ∈ xs : ¬(¬cuadrado.y ∨ verde.y)>.
    
    --3) Demuestro que vale para P(x:xs)

        hayCNV x:xs ≡ <∃y : y ∈ x:xs : ¬(¬cuadrado.y ∨ verde.y)>.
    ={Impl. codigo Caso 2 de hayCNV}
        (cuadrado x && not (verde x) ) || hayCNV xs ≡ <∃y : y ∈ x:xs : ¬(¬cuadrado.y ∨ verde.y)>
    ={Uso de HI}
        (cuadrado x && not (verde x) ) || <∃y : y ∈ xs : ¬(¬cuadrado.y ∨ verde.y)> ≡ <∃y : y ∈ x:xs : ¬(¬cuadrado.y ∨ verde.y)>
    ={Impl De codigo de pert e }
        (cuadrado x && not (verde x) ) || <∃y : pert y xs : ¬(¬cuadrado.y ∨ verde.y)> ≡ <∃y : pert y x:xs : ¬(¬cuadrado.y ∨ verde.y)>
    ={Cambios de notacio, && como ∧, || como v, y not como -}
        (cuadrado x ∧ -(verde x) ) v <∃y : pert y xs : ¬(¬cuadrado.y ∨ verde.y)> ≡ <∃y : pert y x:xs : ¬(¬cuadrado.y ∨ verde.y)>
    ={T12 De morgan para v}
        (cuadrado x ∧ -(verde x) ) v <∃y : pert y xs : -¬cuadrado.y ∧ verde.y> ≡ <∃y : pert y x:xs : (-¬cuadrado.y ∧ -verde.y)>
    ={T1 Doble negacion}
        (cuadrado x ∧ -verde x) v <∃y : pert y xs : cuadrado.y ∧ verde.y> ≡ <∃y : pert y x:xs : (cuadrado.y ∧ -verde.y)>
    ={Impl de codigo de pert e (4)}
        (cuadrado x ∧ -verde x) v <∃y : pert y xs : cuadrado.y ∧ verde.y> ≡ <∃y : y == x || pert y xs : (cuadrado.y ∧ -verde.y)>
    ={Cambios de notacio, && como ∧, || como v}
        (cuadrado x ∧ -verde x) v <∃y : pert y xs : cuadrado.y ∧ verde.y> ≡ <∃y : y = x v pert y xs : (cuadrado.y ∧ -verde.y)>
    ={T7 Regla del termino  de E}
        (cuadrado x ∧ -verde x) v <∃y : pert y xs : cuadrado.y ∧ verde.y> ≡ <∃y : pert y xs : (cuadrado.y ∧ -verde.y)> v <∃y : y = x : (cuadrado.y ∧ -verde.y)>
    ={A4 Rango unitario de A}
        (cuadrado x ∧ -verde x) v <∃y : pert y xs : cuadrado.y ∧ verde.y> ≡ <∃y : pert y xs : (cuadrado.y ∧ -verde.y)> v (cuadrado.x ∧ -verde.x)


--Parcial 2 Introduccion a los algoritmos turno mañana 6 de junio de 2022 ( https://github.com/ExamenesViejos-FaMAF-Computacion/ExamenesViejos_IntroduccionALosAlgoritmos_FaMAF/blob/main/Parcial%202%202022-06-06%20Turno%20Ma%C3%B1ana.pdf )

        p ∧ q -> p v q = p -> (-q -> p)
    ={T19 Caracterizacion de ->}
        p ∧ q -> p v q = p -> (- -q v p)
    ={T1 Doble negacion}
        p ∧ q -> p v q = p -> (q v p)
    ={T19 Caracterizacion de ->, p= p, q = q v p}
        p ∧ q -> p v q = -p v (q v p)
    ={A12 Dorada}
        p = q = p v q -> p v q = -p v (q v p)
    ={Por asociatividad y parentesis superfluo}
        p = q = p v q -> p v q = -p v p v q
    ={Metateorema -p v p = True}
        p = q = p v q -> p v q = True v q
    ={T3 Elemento absorbente}
        p = q = p v q -> p v q = True 
    ={T19 Caracterizacion de ->}
        p = q = p v -q v p v q = True
    ={Conmutatibilidad}
        p = q = p v p v -q v q = True   
    ={Meta teorema de -q v q = True, A9 Idempotenica, elim True por True = True}
        p = q = p v True 
    ={T3 Elemento absorbente de v}
        p = q = True

        https://prnt.sc/dB8sSDRyIw98 --solucion


    --2) La lista de xs de tipo [Figura] tiene una cantidad par de elementos, y todas las 
    --figuras de la primera mitad de la lista xs son rojas". Ejemplos:
    [(Circulo, rojo, 10),(Romobo, Rojo, 5), (Cuadrado, Azul, 10), (Triangulo, Verde, 5)] y 
    [(Rombo, Rojo, 7), (Circulo, Azul, 10)] Satisfacen
    Las listas 
    [(Cuadrado, Azul, 10), (Triangulo, Azul, 20), (Cuadrado, Rojo, 15)] y 
    [(Circulo, Verde, 10), (Rombo, rojo, 15)] no la satisfacen 


    xs :: [Figura] ∧ length xs (mod x 2 == 0) ∧ <Ei : 0 <= i < length xs : rojo x (xs!!i)>

    --3 Demostrar que la siguiente formula es teorema del calculo de predicados. En cada paso 
    -- de la demostracion indique que axioma o teorema se utiliza, subraye la subformula involucrada. 
    -- Se puede utilizar, sin demostrar, los axiomas y teoremas dados en el Digesto Proposicional
    -- Y en el digesto de predicados.

            <∀x : : -(P.x -> Q.x)> = <∀x : : P.x> ∧ -<∃x : : Q.x>
        ={T19 Caracterizacion ->}
            <∀x : : -(-P.x v Q.x)> = <∀x : : P.x> ∧ -<∃x : : Q.x>
        ={T12 De morgan para V}
            <∀x : : - -P.x ∧ -Q.x> = <∀x : : P.x> ∧ -<∃x : : Q.x>
        ={T1 Doble negacion}    
            <∀x : : P.x ∧ -Q.x> = <∀x : : P.x> ∧ -<∃x : : Q.x>
        ={A5 Definicion de E}
            <∀x : : P.x ∧ -Q.x> = <∀x : : P.x> ∧ <Ax : : -Q.x>
        ={Regla del termino de para todo}
            <∀x : : P.x ∧ -Q.x> = <∀x : : P.x ∧ -Q.x>



    todosRA :: [Figura] -> Bool
    todosRA [ ] = True                                           1
    todosRA (x : xs) = (rombo.x && azul.x) && todosRA xs         2

    pert :: Eq a => a -> [a] -> Bool                            
    pert e [ ] = False                          3
    pert e (x:xs) = e==x || (pert e xs)         4


    todosRA xs = -<Ey : y el xs : -(rombo y ∧ azul y)>

    --1 Caso base, xs = []  

        todosRA [] = -<Ey : y el [] : -(rombo y ∧ azul y)>
    ={Caso base todosRA}
        True = -<Ey : y el [] : -(rombo y ∧ azul y)>
    ={Impl. Codigo pert y}
       True = -<Ey : pert y [] : -(rombo y ∧ azul y)>
    ={Caso base de pert y (3)}
        True = -<Ey : False : -(rombo y ∧ azul y)>
    ={T14 Rango Vacio de E}
        True = -(False)
    ={Meteteorema True = -(False)}
        True = True 

    --2 Planteo de hipotesis inductiva

        todosRA xs = -<Ey : y el xs : -(rombo y ∧ azul y)>
    
    --3 Paso inductivo, demuestro que vale para P(x:xs)

        todosRA x:xs = -<Ey : y el x:xs : -(rombo y ∧ azul y)>
    ={Imp. Codigo todosRA (2)}
        (rombo.x && azul.x) && todosRA xs = -<Ey : y el x:xs : -(rombo y ∧ azul y)>
    ={Impl. Codigo, y e xs = pert y xs}
        (rombo.x && azul.x) && todosRA xs = -<Ey : pert y x:xs : -(rombo y ∧ azul y)>
    ={Impl. Codigo pert y (4)}
        (rombo.x && azul.x) && todosRA xs = -<Ey : y==x || (pert y xs) : -(rombo y ∧ azul y)>
    ={Cambios de notacion logicos, && como ∧, || como v, == como = }
        (rombo.x ∧ azul.x) ∧ todosRA xs = -<Ey : y=x v (pert y xs) : -(rombo y ∧ azul y)>
    ={A5 Def. de E}
        (rombo.x ∧ azul.x) ∧ todosRA xs = <Ay : y=x v (pert y xs) : (rombo y ∧ azul y)>
    ={T1 Particion de rango de A}
        (rombo.x ∧ azul.x) ∧ todosRA xs = <Ay : (pert y xs) : rombo y ∧ azul y> ∧ <Ay : y=x : (rombo y ∧ azul y)>
    ={A4 Rango unitario de A}
        (rombo.x ∧ azul.x) ∧ todosRA xs = <Ay : (pert y xs) : rombo y ∧ azul y> ∧ (rombo x ∧ azul x)
    ={uso de Hi}
        (rombo.x ∧ azul.x) ∧ -<Ey : y el xs : -(rombo y ∧ azul y)> = <Ay : (pert y xs) : rombo y ∧ azul y> ∧ (rombo x ∧ azul x)
    ={A5 Definicion de E}
        (rombo.x ∧ azul.x) ∧ <Ay : y el xs : (rombo y ∧ azul y)> = <Ay : (pert y xs) : rombo y ∧ azul y> ∧ (rombo x ∧ azul x)
    ={Impl Codigo de y el xs = pert y xs}
        (rombo.x ∧ azul.x) ∧ <Ay : pert y xs : (rombo y ∧ azul y)> = <Ay : (pert y xs) : rombo y ∧ azul y> ∧ (rombo x ∧ azul x)




    --Introduccion a los algortimos (turno tarde) 2021

        --1) Elegir una de las formulas demostrar bla bla toeremas digesto bla bla

        a) p ∧ (q = r) = (p ∧ q) = (p ∧ r) = p ∧ (r v -r)
        b) p v q = p = -(p ∧ -q = q) = p v False

            --elegi la a pero despues hago la b

            p ∧ (q = r) = (p ∧ q) = (p ∧ r) = p ∧ (r v -r)
        ={A12 dorada, p = p, q = (q = r)}
            p = (q = r) = p v (q = r) = (p ∧ q) = (p ∧ r) = p ∧ (r v -r)
        ={Tercer excluido r v -r = True}
            p = (q = r) = p v (q = r) = (p ∧ q) = (p ∧ r) = p ∧ (True)
        ={T9 Neutro de ∧}
            p = (q = r) = p v (q = r) = (p ∧ q) = (p ∧ r) = p
        ={A12 Dorada}
            p = (q = r) = p v (q = r) = (p = q = p v q) = (p ∧ r) = p
        ={A12 Dorada}
            p = (q = r) = p v (q = r) = (p = q = p v q) = (p = r = p v r) = p
        ={A10 Distributividad de v con =}
            p = (q = r) = (p v q) = (p v r) = (p = q = p v q) = (p = r = p v r) = p
        ={Conmutatibilidad}
            p = r = q = (p v q) = (p v r) = (p = q = p v q) = (p = r = p v r) = p
        ={Tachado}
            q = p v q = (p v r) = (p = q = p v q) = (p v r) = p
        ={Tachado de p =}
            q = p v q = (p v r) = (q = p v q) = (p v r)
        ={Tachado de p v r}
            q = p v q = (q = p v q) 
        ={Equivalencia true}

        --b

            p v q = p = -(p ∧ -q = q) = p v False
        ={T4 Elemento neutro v}
            p v q = p = -(p ∧ -q = q) = p 
        ={Conmutatividad  p ∧ -q = q}
            p v q = p = -(q = p ∧ -q) = p 
        ={A4 Definicion de -}
            p v q = p = -q = p ∧ -q = p 
        ={A12 Dorada}
            p v q = p = -q = p = -q = p v -q = p
        ={Conmutacion de =} 
            p v q = p = -q = -q = p = p v -q = p
        ={ -q = -q = True }
             p v q = p = True = p = p v -q = p
        ={A3 Neutro =}
            p v q = True = p v -q = p


se resuelve por estrella al final xD
        ={T10 Elemento absorbente}
            p v q = p = -False = p  
        ={ -False = True}
            p v q = p = True = p
        ={A3 Neutro =}
            p v q = True 


        --2
        -- Formalizar las siguientes propiedas escrita en lenguaje natural, en el lenguaje de la logica de predicados:
        
        --a) "Los primeros N elementos de la lista xs estan ordenados de forma creciente 
        -- (puede tener repetidos)"
        --ej:
            Con N igual a 3, las listas [-1, 0, 0] y [-4,-3,7,4,2] satisfacen la propiedad. 
            Con N igual a 2, las listas [6,5] y [9,6,7] no la satisfacen

            xs :: [Int] <Ai : 0 <= i < N - 1 : <Aj : 0 <= j < N : xs!!i<xs!!j >
            xs :: [Int] y length xs > N y <Ai : 0 <= i < N :<Aj : 0 <= j < N : xs!!i<xs!!j >

        --3 <Ax : : -(P.x -> Q.x)> v <Ex : : False ∧ P.x> = (<Ax : : P.x) ∧ (Ax : : -Q.x>)

            <Ax : : -(P.x -> Q.x)> v <Ex : : False ∧ P.x> = (<Ax : : P.x) ∧ (Ax : : -Q.x>)
        ={T19 Caracterizacion de implicacion}
            <Ax : : -(-P.x v Q.x)> v <Ex : : False ∧ P.x> = (<Ax : : P.x) ∧ (Ax : : -Q.x>)
        ={T13 de morgan para v}
            <Ax : : (- -P.x v -Q.x)> v <Ex : : False ∧ P.x> = (<Ax : : P.x) ∧ (Ax : : -Q.x>)
        ={T1 Doble negacion} 
            <Ax : : P.x v -Q.x> v <Ex : : False ∧ P.x> = (<Ax : : P.x) ∧ (Ax : : -Q.x>)
        ={T10 Elemento absorbente}
            <Ax : : P.x v -Q.x> v <Ex : : False> = (<Ax : : P.x) ∧ (Ax : : -Q.x>)
        ={A2 Regla del termino de A}
            <Ax : : P.x v -Q.x> v <Ex : : False> = <Ax : : P.x ∧ -Q.x>
        ={A5 Definicion de E}
            <Ax : : P.x v -Q.x> v -<Ax : : -False> = <Ax : : P.x ∧ -Q.x>
        ={ -False = True}
            <Ax : : P.x v -Q.x> v -<Ax : : True> = <Ax : : P.x ∧ -Q.x>
        ={Metateorema mostrado en clase, recordar que :: es True }
            <Ax : : P.x v -Q.x> v -True = <Ax : : P.x ∧ -Q.x>
        ={ -False = True}
            <Ax : : P.x v -Q.x> v False = <Ax : : P.x ∧ -Q.x>
        ={T4 Elemento neutro de V}
            <Ax : : P.x v -Q.x> = <Ax : : P.x ∧ -Q.x>


        pruebo algo:

         ={T10 Elemento absorbente}
            <Ax : : P.x v -Q.x> v <Ex : : False> = (<Ax : : P.x) ∧ (Ax : : -Q.x>)
        ={A5 Def de E}
            <Ax : : P.x v -Q.x> v <Ex : : False> = (-<Ex : : -P.x) ∧ -(Ex : : Q.x>)

        no los puedo juntar wtf 


        --4 verificaion

        todoCyG :: [Figura] -> Bool 
        todoCyG [] = True                                               1
        todoCyG (x:xs) = circulo x && tam x => 10 && todoCyG xs         2

        pert :: Eq a => a -> [a] -> Bool                            
        pert e [ ] = False                          3
        pert e (x:xs) = e==x || (pert e xs)         4

        Demostrar por induccion la siguiente formula

            todoCyG xs = <Ay : y e xs : circulo y && tam y >= 10>
        
        --1 Caso base xs = []

            todoCyG [] = <Ay : y e [] : circulo y && tam y >= 10>
        ={Impl. y e como pert y}
            todoCyG xs = <Ay : pert y [] : circulo y && tam y >= 10>
        ={Caso base de todoCyG (1)}
            True = <Ay : pert y [] : circulo y && tam y >= 10>
        ={Impl. Codigo pert y caso 3}
            True = <Ay : False : circulo y && tam y >= 10>
        ={T5 Rango vacio de A}
            True = True 

        --2 Planteo de Hipotesis inductiva. 

            todoCyG xs = <Ay : y e xs : circulo y && tam y >= 10>

        --3 Paso inductivo, demuestro que vale para P(x:xs)

            todoCyG x:xs = <Ay : y e x:xs : circulo y && tam y >= 10>
        ={Impl. Codigo y e como pert y}
            todoCyG x:xs = <Ay : pert y x:xs : circulo y && tam y >= 10>
        ={Impl. Codigo todoCyG caso 2}
            circulo x && tam x => 10 && todoCyG xs  = <Ay : pert y x:xs : circulo y && tam y >= 10>
        ={Impl. Codigo de pert y en caso 4}
            circulo x && tam x => 10 && todoCyG xs  = <Ay : y==x || (pert y xs) : circulo y && tam y >= 10>
        ={Uso de Hipotesis Inductiva}
            circulo x && tam x => 10 && <Ay : y e xs : circulo y && tam y >= 10>  = <Ay : y==x || (pert y xs) : circulo y && tam y >= 10>
        ={Impl. Codigo y e como pert y}
            circulo x && tam x => 10 && <Ay : pert y xs : circulo y && tam y >= 10>  = <Ay : y==x || (pert y xs) : circulo y && tam y >= 10>
        ={Cambios de notacion,  && como ∧, == como =, || como v }
            circulo x ∧ tam x => 10 ∧ <Ay : pert y xs : circulo y ∧ tam y >= 10>  = <Ay : y=x v (pert y xs) : circulo y ∧ tam y >= 10>
        ={T1 Particion de rango de A}
            circulo x ∧ tam x => 10 ∧ <Ay : pert y xs : circulo y ∧ tam y >= 10>  = <Ay : (pert y xs) : circulo y ∧ tam y >= 10> ∧ <Ay : y=x : circulo y ∧ tam y >= 10>
        ={A4 Rango unitario de A}
            circulo x ∧ tam x => 10 ∧ <Ay : pert y xs : circulo y ∧ tam y >= 10>  = <Ay : (pert y xs) : circulo y ∧ tam y >= 10> ∧ circulo x ∧ tam x >= 10


    --Parcial 2020 com 1 y 2

        --1) Formalizar las siguientes propiedas escriba en lenguaje natural a coso

        "Todas las figuras de xs son de tamaño 3 o cuadrados rojos (de cualquier tamaño)"
        
        xs :: [Figura] <Ai : 0 <= i < length xs : tam xs!!i == 3 v <Ej : 0 <= j < length xs : cuadrado xs!!i ∧ rojo xs!!i >

        cuando usa indices:
        contar elementos -> posiciones o unicos para todos x o existe un x tal que algo uso x e xs

        la solucion es:

        0 <= i < length xs : tam xs!!i == 3 v (cuadrado xs!!i y rojo xs!!i)>
        

        --2)

            <Ax : R x : T x> ∧ <Ax : : R.x> = <Ax : : R x ∧ T x>
        ={A1 Intercambio entre rango y termino de A}
            <Ax : R x -> T x> ∧ <Ax : : R.x> = <Ax : : R x ∧ T x>
        ={T19 Caracterizacion de ->}
            <Ax : -R x v T x> ∧ <Ax : : R.x> = <Ax : : R x ∧ T x>
        ={A2 Regla de termino}
            <Ax : (-R x v T x) ∧ R.x> = <Ax : : R x ∧ T x>
        ={Distributividad }
            <Ax : (T x ∧ R.x) v (-R x ∧ R.x) > = <Ax : : R x ∧ T x>
        ={Def. False}
            <Ax : ((T x ∧ R.x) v False)  > = <Ax : : R x ∧ T x>
        ={False de v}
            <Ax : (T x ∧ R.x)> = <Ax : : R x ∧ T x>

        --3)

        todosCR : [Figura] -> Bool
        todosCR [] = True                                           1
        todosCr (x:xs) = (cuadrado x && rojo x) && todosCR xs       2

        pert :: Eq a => a -> [a] -> Bool                            
        pert e [ ] = False                          3
        pert e (x:xs) = e==x || (pert e xs)         4

        todosCR xs = <Ay : y e xs : cuadrado y && rojo y>
        
        --1) Caso base, xs=[]

            todosCR [] = <Ay : y e [] : cuadrado y && rojo y>
        ={Impl. Codigo y e como pert y}
            todosCR [] = <Ay : pert y [] : cuadrado y && rojo y>
        ={Impl. Codigo todosCR en caso 1}
            True = <Ay : pert y [] : cuadrado y && rojo y>
        ={Impl. Codigo pert y en caso 3 base}
            True = <Ay : False : cuadrado y && rojo y>
        ={T5 Rango vacio de A}
            True = True


        --2) Planteo de Hipotesis inductiva

        todosCR xs = <Ay : y e xs : cuadrado y && rojo y>

        --3) Paso inductivo, demuestro que vale para P(x:xs)

            todosCR x:xs = <Ay : y e x:xs : cuadrado y && rojo y>
        ={Impl. codigo y e como pert y}
            todosCR x:xs = <Ay : pert y x:xs : cuadrado y && rojo y>
        ={Impl. Codigo pert y en caso 4}
            todosCR x:xs = <Ay : e==x || (pert y xs) : cuadrado y && rojo y>
        ={Impl. Codigo todosCR caso 2}
            (cuadrado x && rojo x) && todosCR xs = <Ay : y==x || (pert y xs) : cuadrado y && rojo y>
        ={Cambios de notacion,  && como ∧, == como =, || como v }
            (cuadrado x ∧ rojo x) ∧ todosCR xs = <Ay : y=x v (pert y xs) : cuadrado y ∧ rojo y>
        ={T1 Particion de rango de A}   
            (cuadrado x ∧ rojo x) ∧ todosCR xs = <Ay : y=x : cuadrado y ∧ rojo y> ∧ <Ay : (pert y xs) : cuadrado y ∧ rojo y>
        ={A4 Rango unitario de A}
            (cuadrado x ∧ rojo x) ∧ todosCR xs = cuadrado x ∧ rojo x ∧ <Ay : (pert y xs) : cuadrado y ∧ rojo y>
        ={Uso de HI }
            (cuadrado x ∧ rojo x) ∧ <Ay : y e xs : cuadrado y && rojo y> = cuadrado x ∧ rojo x ∧ <Ay : (pert y xs) : cuadrado y ∧ rojo y>
        ={Impl. Codigo y e como pert y}
            (cuadrado x ∧ rojo x) ∧ <Ay : pert y xs : cuadrado y && rojo y> = cuadrado x ∧ rojo x ∧ <Ay : (pert y xs) : cuadrado y ∧ rojo y>


            --un parcial de 2020 wtf de donde spawneo:

            El de calculo de predicados es larguisimo, asi que no lo pienso hacer, esta en los documentos. 

               --2 Algun numero par de xs esta en ys
                xs :: [Int] y ys :: [Int] y <Ex : x e xs : mod x 2 == 0 y pert x ys >
                xs :: [Int] y ys :: [Int] y <Ex : x e xs Y x e ys: mod x 2 == 0>

                https://prnt.sc/yUY83DmLW36A

                https://docs.google.com/document/d/1SXSc1I7Q1YqugCcMJBbhiyq3UA9Lz4HTw0nq_pwRjdo/edit

                indices -> comparar

                https://prnt.sc/4Cpo4DUNCX8U

                https://prnt.sc/X3pwOXUIcAWA

                https://docs.google.com/document/d/1oM3oi9X_W37bvNlGq4nT8er2hE3lvjT2c088BwkWzwk/edit
    

        --3)<Ax : : P x = Q x> -> Ay :: P.y ∧ R x = Q y ∧ R y>

           tmb es re largo, paso.

    --Parcial 2019 5 de junio de 2019

        --1 demostrar bal bla bla

        a) p -> (q->r) = -r -> (p -> -q)
        b) -p ∧ q = -(p ∧ -q = q)

            p -> (q->r) = -r -> (p -> -q)
        ={T19 Caracterizacion de imp}
            p -> (q->r) =  - -r v (p->-q)
        ={T19 Caracterizacion de imp}
            -p v (q->r) =  - -r v (p->-q)
        ={T19 Caracterizacion de imp 2 veces. T1 Doble negacion}
            -p v (-q v r) = r v (-p v -q)
        ={Valido por ref. Equiv. (hay q conmutar)}

         b) -p ∧ q = -(p ∧ -q = q)

            -p ∧ q = -(p ∧ -q = q)
        ={Conmutacion}
            -p ∧ q = -(q = p ∧ -q)
        ={A5 definicion de -}
             -p ∧ q = -q = p ∧ -q      
        ={A12 Dorada}
            -p = q = -p v q = (-q = p = -q = p v -q)
        ={Conmutacion de =}
            -p = q = -p v q = (-q = -q = p = p v -q)
        ={ -q = -q = True }
            -p = q = -p v q = (True = p = p v -q)
        ={T5 Teorema *}
            -p = q = -p v -q = p = (True = p = p v -q)
        ={Conmutacion y borro de True}
            -p = q = -p v -q = p = (p = -q v p)
        ={T5 Teorema Estrella}
            -p = q = -p v -q = p = (p = -q v -p = -q)
        ={Conmutacion}
            -p = q = -p v -q = p = (p = -p v -q = -q)
        ={Tachado de -p v -q}
            -p = q  = p = (p = -q)
        ={Elim. Parentesis}
            -p = q = p = p = -q 
        ={p = p = True}
            -p = q = True = -q 


            -p ∧ q = -(p ∧ -q = q)
        ={Dorada}
            -p = q = -p v q = -(p = -q = p v -q = q)
        ={A4 Definicion de -}
            -p = q = -p v q = -p = -q = p v -q = q
        ={Conmutacion}
            -p = -p = q = -p v q = -q = p v -q = q
        ={ -p = -p = True}
            True = q = -p v q = -q = p v -q = q
        ={Elim. True (demostrado) Conmutacion}
            q = q = -p v q = -q = p v -q
        ={ q = q = True}
            True = -p v q = -q = p v -q
        ={Elim. True y conmutacion}
            -p v q = -q = (-q v p)
        ={T5 Estrella}
            -p v q = -q = -q v -p = -q 
        ={Conmutacioon de -q}
            -q = -q = -p v q = -q v -p
        ={ -q = -q = True}
            True = -p v q = -q v -p
        ={Elim. True y T5 estrella} 
            -p v -q = -p = -q v -p
        ={}

        ??????????

        --2)
        "Todos las figuras de xs son triangulos rojos o cuadrados"

        Veo que hay un "Todos" por lo tanto debo hacer uso del cuantificador de Para todo 
        Ademas, me pide que este restrito a los triangulos rojos O los cuadrados. El tipo de xs debe ser figura y no hace uso de 
        indices ya que pide que hay en una lista, no en la poscion de una lista

        xs :: [Figura] ∧ <Ax : x e xs : (triangulo x ∧ rojo x) v cuadrado x> --creo q esta bien asi

        xs :: [Figura] ∧ <Ax : x e xs : (triangulo x ∧ rojo x) v cuadrado x ∧ <Ay : y e xs: -((triangulo y ∧ rojo y) v cuadrado y)>>


        --3)  

        Lista que satisfaga
        [(Cuadrado, Azul, 3), (Triangulo, Rojo, 2)]
        Lista que no:
        [(Rombo, Azul, 0), (Cuadrado, Rojo, 2)]

        --4) 

            <Ax : R x : T x> ∧ <Ax : -T x : R x> = <Ax : : T x>
        ={A1 Intercambio entre rango y termino dos veces }
            <Ax : R x -> T x> ∧ <Ax : -T x -> R x> = <Ax : : T x>
        ={T19 Caracterizacion de Implicacion}
            <Ax : (-R x v T x)> ∧ <Ax : - -T x v R x> = <Ax : : T x>
        ={T1 Doble negacion}
            <Ax : (-R x v T x)> ∧ <Ax : (T x v R x)> = <Ax : : T x>
        ={A2 Regla de termino de A}
            <Ax : (-R x v T x) ∧ (T x v R x)> = <Ax : : T x>
        ={Factor comun de T x}
            <Ax : T x ∧ (-R x v R x)> = <Ax : : T x>
        ={A11 Tercero excluido}
            <Ax : T x ∧ (True)> = <Ax : : T x>
        ={T9 Neutro de ∧}
            <Ax : : T x> = <Ax : : T x>

  <Ax : R x : T x> ∧ <Ax : : R.x> = <Ax : : R x ∧ T x>
        ={A1 Intercambio entre rango y termino de A}
            <Ax : R x -> T x> ∧ <Ax : : R.x> = <Ax : : R x ∧ T x>
        ={T19 Caracterizacion de ->}
            <Ax : -R x v T x> ∧ <Ax : : R.x> = <Ax : : R x ∧ T x>
        ={A2 Regla de termino}
            <Ax : (-R x v T x) ∧ R.x> = <Ax : : R x ∧ T x>
        ={Distributividad }
            <Ax : (T x ∧ R.x) v (-R x ∧ R.x) > = <Ax : : R x ∧ T x>
        ={Def. False}
            <Ax : ((T x ∧ R.x) v False)  > = <Ax : : R x ∧ T x>
        ={False de v}
            <Ax : (T x ∧ R.x)> = <Ax : : R x ∧ T x>

        --5)

        todosRoC : [Figura] -> Bool
        todosRoc [] = True                                     1
        todosRoC (x:xs) = (rojo x v circulo x) ∧ todosRoC xs    2

        pert :: Eq a => a -> [a] -> Bool                            
        pert e [ ] = False                          3
        pert e (x:xs) = e==x || (pert e xs)         4

            todosRoC xs = <Ay : y e xs : rojo y v circulo y>

        --1) Caso base, xs = []

            todosRoC [] = <Ay : y e [] : rojo y v circulo y>
        ={Impl. Todos roc en 1}
            True = <Ay : y e [] : rojo y v circulo y>
        ={Impl. y e como pert y}
            True = <Ay : pert y [] : rojo y v circulo y>
        ={Impl. pert y caso 3}
            True = <Ay : False : rojo y v circulo y>
        ={T5 Rango vacio de A}
            True = True 

        --2)Planteo de hipotesis inductiva 

            todosRoC xs = <Ay : y e xs : rojo y v circulo y>

        --3)Paso inductivo P(x:xs)
            
            todosRoC x:xs = <Ay : y e x:xs : rojo y v circulo y>
        ={Impl. codigo de y e como pert y}
            todosRoC x:xs = <Ay : pert y x:xs : rojo y v circulo y>
        ={Impl. Codigo todosRoC caso 2}
            (rojo x v circulo x) ∧ todosRoC xs = <Ay : pert y x:xs : rojo y v circulo y>
        ={Impl. codigo caso 4 de pert y }
            (rojo x v circulo x) ∧ todosRoC xs = <Ay : y==x || (pert y xs) : rojo y v circulo y>
        ={Hipotesis inductiva }
            (rojo x v circulo x) ∧ <Ay : y e xs : rojo y v circulo y> = <Ay : y==x || (pert y xs) : rojo y v circulo y>
        ={Impl. Codigo y e como pert y}
            (rojo x v circulo x) ∧ <Ay : pert y xs : rojo y v circulo y> = <Ay : y==x || (pert y xs) : rojo y v circulo y>
        ={Cambios de notacion, == como =, || como v }
            (rojo x v circulo x) ∧ <Ay : pert y xs : rojo y v circulo y> = <Ay : y=x v (pert y xs) : rojo y v circulo y>
        ={T1 Particion de rango de A}
            (rojo x v circulo x) ∧ <Ay : pert y xs : rojo y v circulo y> = <Ay : pert y xs : rojo y v circulo y> ∧ <Ay : y=x  : rojo y v circulo y>
        ={A4 Rango unitario de A}
            (rojo x v circulo x) ∧ <Ay : pert y xs : rojo y v circulo y> = <Ay : pert y xs : rojo y v circulo y> ∧ (rojo x v circulo x)

    Parcial 2018

        --1

        a) q -> p = p -> q = -p = -q 

            q -> p = p -> q = -p = -q 
        ={T19 Caracterizacion de ->}
            -q v p = p -> q = -p = -q 
        ={T19 Caracterizacion de ->}
            -q v p = -p v q = -p = -q
        ={T5 Teorema estrella}
            -q v p = -p v -q = -q
        ={Conmutacion}
            -q v p = -q v -p = -q
        ={T5 Teorema estrella p =-p, q= -q, }
            -q v p = -q v p 

            valido por ref = )?

        b) p ∧ -q -> (q->r)

            p ∧ -q -> (q->r)
        ={T19 Caracterizacion de ->}
            p ∧ -q -> (-q v r)
        ={T19 Caracterizacion de ->}
            -(p ∧ -q) v (-q v r)
        ={T13 de morgan para y}
            -p v - -q v (-q v r)
        ={Elim. Parentesis superfluo y T1 doble negacion}
            -p v q v -q v r
        ={A11 tercero excluido}
            -p v True v r 
        ={T3 Elemento absorbente v}
            True 

        --2)
        a) "ningun circulo en xs es rojo"
            Si hablo de ningun debo de usar para todo, y ademas debo de usar un - (not)
            Ademas debo usar el tipo de Figura. 

        xs :: [Figura] ∧ <Ax : x e xs ∧ circulo x : -(rojo x)>

        b) "Hay exactamente dos cuadrados en xs y uno es rojo y el otro es azul"
            Aca debo usar indicies, ya que me pide exactamente dos y no debe haber mas por lo
            tanto debo restringir a los cuadrados a rojo y azul, debo de usar 2 cuatificaciones porq
            se habla de dos cuadrados. 
            El tipo es figura

        xs :: [Figura] ∧ ⟨∃x : x ∈ xs ∧ cuadrado x ∧ rojo x : ⟨∀y : y ∈ xs ∧ cuadrado y ∧ azul y : y =/ x : -(azul y)⟩⟩


        --3)

        [(Triangulo, Rojo, 3), (circulo, azul, 3)]
        ejemplos
        [(Rombo, rojo, 3), (circulo, rojo, 4)]

        --4)

            <Ex : : P x -> Q x> = <Ex : : -P x> v <Ex : : Q x>
        ={T19 Caracterizacion de implicacion }
            <Ex : : -P x v Q x> = <Ex : : -P x> v <Ex : : Q x>
        ={T7 Regla del termino de E}
            <Ex : : -P x v Q x> = <Ex : : -P x v Q x>


        --5)

            noHayCR :: [Figura] -> BOol
            noHayCR [] = True                                       1
            noHayCR (x:xs) = -(circulo x ∧ rojo x) ∧ noHayCR xs     2

            pert :: Eq a => a -> [a] -> Bool
            pert e [ ] = False                          3
            pert e (x:xs) = e==x || (pert e xs)         4

            noHayCR xs = -<Ey : y e xs : circulo y ∧ rojo y>

            --1) Caso base xs = []

                noHayCR [] = -<Ey : y e [] : circulo y ∧ rojo y>
            ={Impl. Codigo y e como pert y}
                noHayCR [] = -<Ey : pert y [] : circulo y ∧ rojo y>
            ={Impl. Codigo noHayCR en caso 1}
                True = -<Ey : pert y [] : circulo y ∧ rojo y>
            ={Impl. Codigo pert y en caso 3}
                True = -<Ey : False : circulo y ∧ rojo y>
            ={T14 Rango vacio del E}
                True = -false 
            ={ -False = True } 
                True = True

            --2) Hipotesis inductiva
                noHayCR xs = -<Ey : y e xs : circulo y ∧ rojo y>

            --3) Paso inductivo, demuestro que vale para P(x:xs)

                noHayCR x:xs = -<Ey : y e x:xs : circulo y ∧ rojo y>
            ={Impl. Codigo y e como pert y}
                noHayCR x:xs = -<Ey : pert y x:xs : circulo y ∧ rojo y>
            ={Impl. Codigo noHayCR en caso 2}
                -(circulo x ∧ rojo x) ∧ noHayCR xs = -<Ey : pert y x:xs : circulo y ∧ rojo y>
            ={Impl. Codigo pert y en caso 4}
                -(circulo x ∧ rojo x) ∧ noHayCR xs = -<Ey : y==x || (pert y xs) : circulo y ∧ rojo y>
            ={Uso de HI}
                -(circulo x ∧ rojo x) ∧ -<Ey : y e xs : circulo y ∧ rojo y> = -<Ey : y==x || (pert y xs) : circulo y ∧ rojo y>
            ={Impl. Codigo y e como pert y}
                -(circulo x ∧ rojo x) ∧ -<Ey : pert y xs : circulo y ∧ rojo y> = -<Ey : y==x || (pert y xs) : circulo y ∧ rojo y>
            ={Cambios de notacion, == como =, || como v }  
                -(circulo x ∧ rojo x) ∧ -<Ey : pert y xs : circulo y ∧ rojo y> = -<Ey : y=x v (pert y xs) : circulo y ∧ rojo y>
            ={A5 Definicion de E}   
                -(circulo x ∧ rojo x) ∧ <Ay : pert y xs : -(circulo y ∧ rojo y)> = <Ay : y=x v (pert y xs) : -(circulo y ∧ rojo y)>
            ={T1 Particion de rango A}
                -(circulo x ∧ rojo x) ∧ <Ay : pert y xs : -(circulo y ∧ rojo y)> = <Ay : (pert y xs) : -(circulo y ∧ rojo y)> ∧ <Ay : y=x : -(circulo y ∧ rojo y)>
            ={A4 Rango unitario}
                 -(circulo x ∧ rojo x) ∧ <Ay : pert y xs : -(circulo y ∧ rojo y)> = <Ay : (pert y xs) : -(circulo y ∧ rojo y)> ∧ -(circulo x ∧ rojo x)
 
        -- Parcial 2018 
        --1)

            a) p -> q = q -> p = p = q
             
                p -> q = q -> p = p = q
            ={T19 Carcterizacion de implicacion}    
                -p v q = q -> p = p = q
            ={T19 Caracterizacion de implicacion}
                -p v q = -q v p = p = q
            ={Conmutacion }
                -p v q = p v -q = p = q 
            ={T5 Teorema *}
                -p v q = p v q = q
            ={Conmutacion}
                -p v q = q v p = q 
            ={T5 Teorema *, p = q, q = p }
                -p v q = q v -p 
            ={Valido por ref. }

            b) p v q -> r = (p -> r) ∧ (q -> r)

                p v q -> r = (p -> r) ∧ (q -> r)
                
                -(p v q) v r = (-p  v  r) ∧ (-q v r)

                -(p v q) v r = (-p ∧ -q) v r)
                
                -(p v q) v r = -(p v q) v  r 

                --2) 
                    a) "todas las figuras de xs que son rojas, son triangulos"

                    xs :: [Figura] ∧ <Ax : x e xs ∧ rojo x : triangulo x>

                    b) "el primer elemento de xs es menor que alguno de los demas elemtnos de xs"

                    xs :: [Figura] ∧ ⟨∃x : x ∈ℓ xs : (head xs) < x⟩
        
        --3)    

            (<Ex : R x : T x> ∧ <Ax : R x : S x>) -> <Ex : R x : T x ∧ S x>
       

        
        --5)

            hayTV [Figura] -> Bool  
            hayTV [] = False                                    1
            hayTV (x:xs) = (verde x ∧ triangulo x) v hayTV xs   2

            pert :: Eq a => a -> [a] -> Bool                            
            pert e [ ] = False                          3
            pert e (x:xs) = e==x || (pert e xs)         4

            hayTV xs = <Ey : y e xs : verde y ∧ triangulo y>
            

            --1) Caso base, xs = []

                hayTV [] = <Ey : y e [] : verde y ∧ triangulo y>
            ={Impl. Codigo y e como pert y}
                hayTV [] = <Ey : pert y [] : verde y ∧ triangulo y>
            ={Impl. Codigo HayTv caso 1 y impl. codigo de pert e caso 3}
                False = <Ey : False : verde y ∧ triangulo y>
            ={T14 Rango vacio de E}
                False = False

            --2) Planteo de hipotesis inductiva 

                hayTV xs = <Ey : y e xs : verde y ∧ triangulo y>

            --3) Paso inductivo, muestro que vale para P(x:xs)

                hayTV x:xs = <Ey : y e x:xs : verde y ∧ triangulo y>
            ={Impl. Codigo de y e como pert y}
                hayTV x:xs = <Ey : pert y x:xs : verde y ∧ triangulo y>
            ={Impl. Codigo pert y caso 4}
                hayTV x:xs = <Ey : y==x || (pert y xs)  x:xs : verde y ∧ triangulo y>
            ={Cambio de notacio, == como = y II como v}
                hayTV x:xs = <Ey : y=x v (pert y xs)  x:xs : verde y ∧ triangulo y>
            ={T7 Regla del termino de E}
                hayTV x:xs = <Ey : (pert y xs)  x:xs : verde y ∧ triangulo x> v <Ey : y=x  x:xs : verde y ∧ triangulo y>
            ={T9 Rango unitario de E}
                hayTV x:xs = <Ey : (pert y xs)  x:xs : verde y ∧ triangulo x> v verde x ∧ triangulo x
            ={Impl. Codigo hayTV caso 2}
                (verde x ∧ triangulo x) v hayTV xs = <Ey : (pert y xs)  x:xs : verde y ∧ triangulo x> v verde x ∧ triangulo x
            ={Uso de HI}
                (verde x ∧ triangulo x) v <Ey : y e xs : verde y ∧ triangulo y> = <Ey : (pert y xs)  x:xs : verde y ∧ triangulo x> v verde x ∧ triangulo x
            ={Impl. Codigo y e como pert y}
                (verde x ∧ triangulo x) v <Ey : pert y xs : verde y ∧ triangulo y> = <Ey : (pert y xs)  x:xs : verde y ∧ triangulo x> v verde x ∧ triangulo x

            originalmente es verde y y traingulo x, pero es variable libre asi q da lo mismo xD 

            --Parcial 2017

            --1)

                a) p v -q = -p = -q = -p v q 

                    p v -q = -p = -q = -p v q 
                ={De morgan}
                    -(-p ∧ q) = -p = -q = -p v q 
                ={Dorada}
                    -(-p = q = -p v q) = -p = -q = -p v q 
                ={A4 defincion de -}
                    - -p = q = -p v q = -p = -q = -p v q 
                ={T1 Doble negacion  }
                    p = q = -p v q = -p = -q = -p v q 
                ={Conmutatividad}
                    -p v q = -p v q = -p = -q = p = q 
                ={True por equiv} 
                    True = -p = -q = p = q 
                ={conmutatividad}
                    -p = p = -q = q 
                ={A4 Definicion de -}
                    -(p = p) = -(q = q)
                ={True por equiv}
                    -True = -True 
                ={Valido por equiv} 
                    True )?


                b) p ∧ q -> p v q

                p ∧ q -> p v q 
            ={Definicion ->}
                (p ∧ q) v (p v q) = p v q 
            ={Dorada}
                p = q = p v q v p v q = p v q 
            ={A9 Idempotencia }
                p = q = p v q ?¿??¿?¿^?¿¿?


            --2)
            "ningun circulo en xs es rojo"

                xs :: [Figura] ∧ <Ax: x e xs ∧ circulo : -(rojo x)>

            "hay un unico cuadrado en xs y es rojo"

            xs :: [Figura] = <Ei : 0 <= i < (length xs) : cuadrado xs!!i ∧ rojo x ∧ <Aj : 0 <= j < length xs ∧ i /= j : -(cuadrado xs!!i ∧ rojo xs!!i)>>




            --3)

                <Ax : : -(P x -> Q x)> = (<Ax : : P x> ∧ <Ax : : -Q x>)
            ={T19 Caracterizacion de ->}
                <Ax : : -(-P x v Q x)> = (<Ax : : P x> ∧ <Ax : : -Q x>)
            ={De morgan}
                <Ax : : - -P x ∧ -Q x> = (<Ax : : P x> ∧ <Ax : : -Q x>)
            ={T1 Doble negacion}
                <Ax : : P x ∧ -Q x> = (<Ax : : P x> ∧ <Ax : : -Q x>)
            ={A2 Regla de termino de A}
                <Ax : : P x> ∧ <Ax : : -Q x> = <Ax : : P x> ∧ <Ax : : -Q x>

            "Los primeros tres elementos de la lista son impares y el resto de los elementos son pares"

            Ax : : 






                ((p -> q) -> p) -> p ≡ p ≡ (p ∧ ¬p) ≡ ¬p
            ={T19 Caracterizacion}
                -((p -> q) -> p) v p ≡ p ≡ (p ∧ ¬p) ≡ ¬p
            ={T19 Caracterizacion}
                -(-(p -> q) v p) v p ≡ p ≡ (p ∧ ¬p) ≡ ¬p
            ={T19 Caracterizacion}
                -(-(-p v q) v p) v p ≡ p ≡ (p ∧ ¬p) ≡ ¬p
            ={De morgan}
                - -(-p v q) ∧ -p v p ≡ p ≡ (p ∧ ¬p) ≡ ¬p
            ={T1 Doble negacion}
                (-p v q) ∧ -p v p ≡ p ≡ (p ∧ ¬p) ≡ ¬p
            ={Distributividad de ∧ con v}
                (-p v q) v (-p ∧ -p) v p ≡ p ≡ (p ∧ ¬p) ≡ ¬p
            ={ -p ∧ -p = True }
                (-p v q) v True v p ≡ p ≡ (p ∧ ¬p) ≡ ¬p
            ={T3 Elemento absorbente}
                True ≡ p ≡ (p ∧ ¬p) ≡ ¬p
            ={A12 Dorada}
                True ≡ p ≡ (p = -p = p v -p) ≡ ¬p
            ={A11 tercero excluido}
                True = p = p = -p = True = -p 
            ={Conmutacion y asociatividad, def de true (p = P = True)}
                True = True = -p = True = -P 
            ={ -p = -p = True} 
                True 


                
            -- la lista xs de tipo [Figura] tiene una cantidad par de elementos, y todas las figuras de la primera mitad de la lista xs son rojas 

            -- Hay un triangulo en xs con tamaño menor a 5
            -- el ultimo elemento de xs esta en ys

            “Hay exactamente dos cuadrados en xs y uno es rojo y el otro azul”. 


“Los primeros tres elementos de la lista son impares y el resto de los elementos son pares”

esp.xs ≡
 xs :: [Int] ∧ ⟨∀i : 0<=i ⋀ i < 3 : ¬(par(xs!!i)) 
⋀ ⟨∀j : 3<=j  ⋀ j < (length xs) ⋀ j /=i : par(xs!!j) ⟩⟩


“La lista xs de tipo [Figura] tiene una cantidad par de elementos, y todas las figuras de la primera mitad de la lista xs son rojas”

xs :: [Figura] ⋀ (mod (length xs 2) == 0 ) 
⋀ ⟨∀i : 0 < i  ⋀  i < ((length xs)/2) : rojo (xs!!i) ⟩


“Hay un triángulo en xs con tamaño menor a 5”

xs :: [Figura] ⋀ <Ex : x ∈ xs : (triángulo x) < 5 >

“El último elemento de xs esta en ys”

xs :: [a] ⋀ ys :: [a] ⋀  (tail xs) ∈ ys 

“Hay exactamente dos cuadrados en xs y uno es rojo y el otro azul”. 

xs :: [Figura] 
∧ ⟨∃i : 0 <= i ∧ i < length xs ∧ (cuadrado (xs!!i)) : rojo (xs!!i) 
∧ ⟨∃j : 0 <= j ∧ j < length xs ∧ (cuadrado(xs!!j)) ∧ j /= i : azul (xs!!j)
∧ ⟨∀k : 0 <= k ∧ k < length xs ∧ k /= i ∧ k /= j : ¬(cuadrado xs!!k) ⟩⟩⟩


"Todas las figuras de xs son de tamaño 3 o cuadrados rojos (de cualquier tamaño)"

xs :: [Figura] ∧ ⟨∀x : x e xs : ((tam x) = 3) v (cuadrado x  ∧ rojo x)⟩


⟨0 <= i < length xs : tam xs!!i == 3 v (cuadrado xs!!i y rojo xs!!i⟩ ⟩

"ningun circulo en xs es rojo"

                xs :: [Figura] ∧ <Ax: x e xs ∧ circulo : -(rojo x)>

"hay un unico cuadrado en xs y es rojo"

xs :: [Figura] = <Ei : 0 <= i ∧ i < length xs : cuadrado xs!!i ∧ rojo xs!!i ∧ <Aj : 0 <= j ∧ j < length xs ∧ i /= j : -(cuadrado xs!!i ∧ rojo xs!!i)>>

 a) "todas las figuras de xs que son rojas, son triangulos"

                    xs :: [Figura] ∧ <Ax : x e xs ∧ rojo x : triangulo x>

                    b) "el primer elemento de xs es menor que alguno de los demas elemtnos de xs"

                    xs :: [Figura] ∧ ⟨∃x : x ∈ℓ xs : (head xs) < x⟩

a) "ningun circulo en xs es rojo"
            Si hablo de ningun debo de usar para todo, y ademas debo de usar un - (not)
            Ademas debo usar el tipo de Figura. 

        xs :: [Figura] ∧ <Ax : x e xs ∧ circulo x : -(rojo x)>

        b) "Hay exactamente dos cuadrados en xs y uno es rojo y el otro es azul"
            Aca debo usar indicies, ya que me pide exactamente dos y no debe haber mas por lo
            tanto debo restringir a los cuadrados a rojo y azul, debo de usar 2 cuatificaciones porq
            se habla de dos cuadrados. 
            El tipo es figura

        xs :: [Figura] ∧ ⟨∃x : x ∈ xs ∧ cuadrado x ∧ rojo x : ⟨∀y : y ∈ xs ∧ cuadrado y ∧ azul y : y =/ x : -(azul y)⟩⟩

"Todos las figuras de xs son triangulos rojos o cuadrados"

        Veo que hay un "Todos" por lo tanto debo hacer uso del cuantificador de Para todo 
        Ademas, me pide que este restrito a los triangulos rojos O los cuadrados. El tipo de xs debe ser figura y no hace uso de 
        indices ya que pide que hay en una lista, no en la poscion de una lista

        xs :: [Figura] ∧ <Ax : x e xs : (triangulo x ∧ rojo x) v cuadrado x> --creo q esta bien asi

        xs :: [Figura] ∧ <Ax : x e xs : (triangulo x ∧ rojo x) v cuadrado x ∧ <Ay : y e xs: -((triangulo y ∧ rojo y) v cuadrado y)>>


[(Circulo, rojo, 10),(Rombo, Rojo, 5), (Cuadrado, Azul, 10), (Triangulo, Verde, 5)] y 
    [(Rombo, Rojo, 7), (Circulo, Azul, 10)] Satisfacen
    Las listas 
    [(Cuadrado, Azul, 10), (Triangulo, Azul, 20), (Cuadrado, Rojo, 15)] y 
    [(Circulo, Verde, 10), (Rombo, rojo, 15)] no la satisfacen 


    xs :: [Figura] ∧ length xs (mod x 2 == 0) ∧ <Ei : 0 <= i < length xs : rojo x (xs!!i)>


2017 mañana
b) “Hay un único cuadrado en xs y es rojo”. 
Ejemplos: Las listas [(Cuadrado, Rojo, 3)] y [(Cuadrado, Rojo, 2),(Rombo, Azul, 1)] satisfacen la propiedad. Las listas [(Rombo, Azul, 1)] y [(Cuadrado, Rojo, 1),(Cuadrado, Azul, 2)] no la satisfacen.

espB.xs ≡ xs :: [Figura] ∧ ⟨∃x : x ∈ℓ xs ∧ cuadrado x ∧ rojo x : ⟨∀y : y ∈ℓ xs ∧ cuadrado y ∧ y =/ x : - (Rojo y)⟩⟩


2017 tarde
b) “Hay un único rombo en xs y es azul”. 
Ejemplos: Las listas[(Rombo, Azul, 1)] y [(Cuadrado, Rojo, 2),(Rombo, Azul, 3)] satisfacen la propiedad. Las listas [(Rombo, Rojo, 1)] y [(Rombo, Rojo, 1),(Rombo, Azul, 2)] no la satisfacen.
espB.xs ≡ xs :: [Figura] ∧ ⟨∃x : x ∈ℓ xs ∧ rombo x ∧ azul x : ⟨∀y : y ∈ℓ xs ∧ rombo y ∧ y =/ x : not (azul y)⟩⟩


2018 mañana
b) “Hay exactamente dos cuadrados en xs y uno es rojo y el otro azul”. 
Ejemplos: Las listas [(Cuadrado, Rojo, 3),(Cuadrado, Azul, 2)] y [(Cuadrado, Rojo, 2),(Cuadrado, Azul, 3),(Rombo, Azul, 1)] satisfacen la propiedad. Las listas [(Rombo, Azul, 1)] y [(Cuadrado, Rojo, 1),(Cuadrado, Rojo, 2)] no la satisfacen. 
espB.xs ≡ xs :: [Figura] ∧ ⟨∃x : x ∈ℓ xs ∧ cuadrado x ∧ rojo x : ⟨∀y : y ∈ℓ xs ∧ cuadrado y ∧ y =/ x : not (azul y)⟩⟩

2018 tarde
b) “El primer elemento de xs es menor que alguno de los demás elementos de xs”. 
Ejemplos: Las listas [1, 0, 3] y [4, 3, 7, 1] satisfacen la propiedad. Las listas [6] y [9, 6, 7] no la satisfacen.
espB.xs ≡ xs :: [Int] ∧  ⟨∃x : x ∈ℓ xs : (head xs) < x⟩


2019 mañana
b) “Existe un único elemento de xs que es mayor estricto que cero”. 
Ejemplos: Las listas [−1, 0, 3] y [−4, −3, 7, −1] satisfacen la propiedad. Las listas [6, 5] y [9, 6, 7] no la satisfacen
espB.xs ≡ xs :: [Int] ∧ ⟨∃x : x ∈ℓ  xs : x > 0 ∧ ⟨∀y : y ∈ℓ  xs ∧ y /= x : y <= 0⟩⟩

espB.xs ≡ xs :: [Int] ∧ ⟨∃i : 0 <= i ∧ i < length xs : xs!!i > 0 ∧ ⟨∀j : 0 <= j ∧ j < length xs ∧ i < j : xs!!j <= 0⟩⟩


2020
“Algún número par de xs están en ys”. 
Ejemplos: Las listas xs = [1, 1, 6, 4] y ys = [1, 4] satisfacen la propiedad. Las listas xs = [1, 1, 6, 4] y ys = [1] no la satisfacen.
esp.xs ≡ xs :: [Int] ∧ ys :: [Int] ∧⟨∃x : x ∈ℓ  xs ∧ par x : ⟨∃y : y ∈ℓ  ys : y == x⟩⟩


2021 tarde
“Los primeros N elementos de la lista xs están ordenados de forma creciente (puede tener repetidos)”. 
Ejemplos: Con N igual a 3, las listas [−1, 0, 0] y [−4, −3, 7, 4, 2] satisfacen la propiedad. Con N igual a 2, las listas [6, 5] y [9, 6, 7] no la satisfacen.
esp.xs ≡ xs :: [Int] ∧ ⟨∀i : 0 <= i ∧ i <= N : ⟨∀j : 0 <= j ∧ j <= N ∧ i < j : xs!!i < xs!!j⟩⟩


2022 tarde
“La lista xs de tipo [Int] tiene una cantidad par de elementos, y tiene al menos un número impar en la primera mitad”. 
Ejemplos: Las listas [1, 2, 3, 4] y [3, 7] satisfacen la propiedad. Las listas [ ], [5, 6, 7] y [8, 7] no la satisfacen. 
esp.xs ≡ xs :: [Int] ∧ (par (length xs)) ∧ ⟨∃x : x ∈ℓ  xsi : not(par x)⟩

--parcial junio 22

        -<Ex  : : -q x -> -p x> v <Ex : R x : False> = (<Ax : : P x> ∧ <Ax : : -Q x>)
    ={T19 Caracterizacion del implicado}
        -<Ex  : : - -q x v -p x> v <Ex : R x : False> = (<Ax : : P x> ∧ <Ax : : -Q x>)
    ={T1 Doble negacion} 
        -<Ex  : : q x v -p x> v <Ex : R x : False> = (<Ax : : P x> ∧ <Ax : : -Q x>)
    ={A2 Regla de termino de A}
        -<Ex  : : q x v -p x> v <Ex : R x : False> = (<Ax : : P x ∧ -Q x>)
    ={A5 Definicion de E}
        -<Ex  : : q x v -p x> v <Ex : R x : False> = (-<Ex : : -(P x ∧ -Q x)>)        
    ={De morgan}
        -<Ex  : : q x v -p x> v <Ex : R x : False> = (-<Ex : : -P x v - -Q x>)  
    ={T1 Doble negacion}
        -<Ex  : : q x v -p x> v <Ex : R x : False> = -<Ex : : -P x v Q x>
    ={T6 Rango y termino de E}
        -<Ex  : : q x v -p x> v <Ex : R x ∧ False> = -<Ex : : -P x v Q x>
    ={T10 elemento absobente}
        -<Ex  : : q x v -p x> v <Ex : False> = -<Ex : : -P x v Q x>
    ={Metateorema, false y neutro de v. Conmutatividad}
        -<Ex : : -P x v Q x> = -<Ex : : -P x v Q x>
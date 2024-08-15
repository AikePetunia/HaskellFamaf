data Color = Rojo | Amarillo | Azul | Verde 
    deriving (Show, Eq)

data Forma = Triangulo | Cuadrado | Rombo | Circulo 
    deriving (Show, Eq)

type Figura = (Forma, Color, Int)

--A cada figura se pueden asociar diferentes predicados que indiquen el color y la forma. Por ejemplo
--podemos definir el predicado rojo que sea verdadera cuando la figura es roja y falso en caso contrario, e
--implementarlo en Haskell como:

rojo :: Figura -> Bool
rojo (f,c,t) = c == Rojo --Devuelve Bool

azul(f,c,t) = c == Azul --Devuelve Bool

amarillo (f,c,t) = c == Amarillo --Devuelve Bool

verde (f,c,t) = c == Verde --Devuelve Bool

circulo (f,c,t) = f == Circulo --Devuelve Bool

rombo (f,c,t) = f == Rombo --Devuelve Bool

cuadrado (f,c,t) = f == Cuadrado --Devuelve Bool

triangulo  (f,c,t) = f == Triangulo --Devuelve Bool

--2 Defin´ı la funci´on tam :: Figura -> Int, que dada una figura devuelve su tama˜no.

tam :: Figura -> Int
tam (f,c,t) = t 

--3 Dada una lista de figuras xs expresa las siguientes propiedades utilizando los cuantificadores y los predicados y funciones ya definidas
--a) Todas las figuras de xs son rojas.
--espA = Especificación ejercicio A


    espA xs   xs :: [Figura] ^ < ∀ x :  x :: Figura ^ x ∊ xs  : roja x  >
--4) xs = [(Triangulo,Rojo,5 ),(Cuadrado,Rojo,10),(Circulo,Rojo,2)]
    --xs’ = [(Cuadrado,Azul,15),(Circulo,Rojo,1),(Triangulo,Azul,2)]


--5)
espA :: [Figura] -> Bool
espA [ ] = True
espA (x : xs) = rojo x && espB xs


--b) Todas las figuras de xs son de tamaño menor a 5.


    espB xs  =   xs :: [Figura] ^ <∀ x :  x :: Figura   ^ x ∊ xs  :    tam x <5  >
--4) xs = [(Triangulo,Rojo,5 ),(Cuadrado,Rojo,3),(Circulo,Amarillo,2)]
    --xs’ = [(Cuadrado,Azul,15),(Circulo,Rojo,14),(Triangulo,Azul,21)]


espB :: [Figura] -> Bool
espB [] = True
espB (x : xs) = ((tam x) <5) && espB xs


--c) Todos los tri´angulos de xs son rojos.


    espC xs     xs :: [Figura] ^ <∀ x :  x :: Figura   ^ x ∊ xs ^ Triangulo x :    roja x  >
--4) xs = [(Triangulo,Rojo,5 ),(Triangulo,Rojo,3),(Triangulo,Rojo,2)]
    --xs’ = [(Cuadrado,Azul,15),(Circulo,Rojo,14),(Triangulo,Azul,21)]


espC :: [Figura] -> Bool
espC [] = True
espC (x : xs) | x = Triangulo == espC xs
              | x = rojo == espC xs
              | otherwise = False


--d) Existe un cuadrado verde en xs.

    espD xs     xs :: [Figura] ^ <E x :  x :: Figura   ^ x ∊ xs ^ Cuadrado x : (o ^)  Verde x  >


--4) xs = [(Cuadrado,Rojo,5 ),(Cuadrado,Verde,3),(Triangulo,Rojo,2)]
    --xs’ = [(Cuadrado,Azul,15),(Circulo,Rojo,14),(Triangulo,Azul,21)]


espD :: [Figura] -> Bool
espD [] = True
espD (x : xs) | x = Cuadrado == espD xs
              | x = Verde == espD xs
              | otherwise = False

              --o 

impD :: [Figura] -> Bool
impD [] =  False 
impD (x:xs)  
       | (cuadrado x)  &&  (verde x) = True
       | otherwise = impD xs


--e) Todos los círculos de xs son azules y de tamaño menor a 10.


    espE xs     xs :: [Figura] ^ <∀ x :  x :: Figura   ^ x ∊ xs ^ Circulo x :    Azul x ^ tam x<=10 >
--4) xs = [(Circulo,Azul,9 ),(Circulo,Azul,10),(Circulo,Azul,10)]
    --xs’ = [(Cuadrado,Azul,15),(Circulo,Rojo,14),(Triangulo,Azul,21)]


espE :: [Figura] -> Bool
espE [] = True
espE (x : xs) | x = Circulos == espE xs
              | x = Azul == espE xs
              | ((tam x)  <=10)  == espE xs
              | otherwise = False
--f ) Ningún triángulo de xs es azul.


    espF xs     xs :: [Figura] ^ <E x :  x :: Figura   ^ x ∊ xs ^ Triangulo x :    -Azul x  >
--4) xs = [(Circulo,Azul,9 ),(Triangulo,Azul,40),(Triangulo,Rojo,10)]
    --xs’ = [(Cuadrado,Azul,15),(Circulo,Rojo,14),(Triangulo,Verde,21)]


espF :: [Figura] -> Bool
espF [] = True
espF (x : xs) | x = Triangulo == espF xs
              | x /= Azul == espF xs
              | otherwise = False


--g) En xs no hay c´ırculos amarillos ni verdes.


    espG xs     xs :: [Figura] ^ <Ex :  x :: Figura   ^ x ∊ xs ^ Circulo x  :    Amarillo =/ x  ^ Verde =/ x>
--4) xs = [(Circulo,Amarillo,9 ),(Circulo,Azul,40),(Circulo,Verde,10)]
    --xs’ = [(Rombo,Azul,15),(Rombo,Rojo,14),(Rombo,Verde,21)]


espG :: [Figura] -> Bool
espG [] = True
espG (x : xs) | x = Circulos == espG xs
              | x /= Amarillos == espB xs
              | x /= Verdes == espG xs
              | otherwise = False
           
--h) Existe (al menos) un cuadrado de tamaño menor a 5 en xs.


    espH xs     xs :: [Figura] ^ <Ex :  x :: Figura   ^ x ∊ xs ^ Cuadrado x  :    tam x < 5>
--4) xs = [(Cuadrado,Amarillo,9 ),(Cuadrado,Azul,40),(Cuadrado,Verde,5)]
    --xs’ = [(Rombo,Azul,15),(Rombo,Rojo,14),(Triangulo,Verde,21)]


espH :: [Figura] -> Bool
espH [] = True
espH (x : xs) | x = Cuadrado == espH xs
              |((tam x) <= 5) == espH xs
              | otherwise = False
           
--i) Si hay círculos rojos en xs entonces hay cuadrados rojos.


    espH xs     xs :: [Figura] ^ <Ex :  x :: Figura   ^ x ∊ xs ^ Circulo x  :    rojo x > -> <Ey : y :: Figura   ^ y ∊ xs ^ Cuadrado y  : rojo y >>
--4) xs = [(Circulo,Rojo,9 ),(Cuadrado,Azul,40),(Cuadrado,Rojo,5)]
    --xs’ = [(Rombo,Azul,15),(Rombo,Rojo,14),(Triangulo,Verde,21)]


espI :: [Figura] -> Bool
espI [] = True
espI (x : xs) | x = Circulo && x = Rojo == espI xs
              | x = Cuadrados && x = Rojo == espI xs
              | otherwise = False


--4. Para cada propiedad del ejercicio 3 da un ejemplo de una lista xs que la cumpla y un ejemplo de una lista
--xs′ que no la cumpla. Por ejemplo, para la propiedad “Todas las figuras de xs son rojas” se puede elegir las siguientes listas:
--5) Crear Recursividad


--6)
--Construirá una lista de figuras xs en las que se satisfagan progresivamente cada una de las siguientes sentencias. Formaliza las oraciones con la lógica de predicados.
--a) Alguna figura de xs es de tamaño mayor a 10.

xs = [(Círculo,Rojo,9),(Cuadrado,Azul,8)]
<Ax : x ∊ xs : tamx <= 10>

--b) Hay un cuadrado en xs.

xs = [(Triangulo, Amarillo, 9),(Cuadrado,Azul,8)]
<Ex : x ∊ xs : cuadrado x>

--c) En xs hay un cuadrado de tamaño no mayor a 10.

xs = [(Triangulo, Azul, 9),(Cuadrado,Azul,8),(Cuadrado,Amarillo,12)]
<Ex : x ∊ xs : cuadrado x ^ tam x <=10>

--d) De las figuras de xs, un cuadrado azul es más grande que alguno de los círculos.


xs = [(Triangulo, Azul, 93),(Cuadrado,Azul,32),(Circulo,Amarillo,12)]
<Ex : x ∊ xs : cuadrado x ^ azul x >= -> <Ey : y e xs : círculo y>
--otra opciòn
<Ex : x ∊ xs : cuadrado x ^ azul x tam x > 10 ∧ <Ey : y e xs : círculo y tam x < 10>

--e) Alg´un c´ırculo de xs no es azul

xs = [(Triangulo, Azul, 93),(Cuadrado,Amarillo,32),(Circulo,Azul,12)]
<Ex : x ∊ xs : Círculo x ^ -azul x>


--7. Da un ejemplo de una lista de figuras xs que satisfaga simultáneamente los siguientes predicados.
--a) ⟨∀x : x ∈ℓ xs ∧ (¬rojo.x ∨ triángulo.x) : tan.x > 10⟩

xs = [(Azul, Triángulo, 11), (Rojo, Triangulo, 13)]

--b) ⟨∃x : x ∈ℓ xs ∧ rojo.x : True⟩ ∧ ⟨∃y : y ∈ℓ xs : ¬rojo.y⟩


xs = [(Rojo, Cuadrado, 11), (Azul, Triángulo, 13)]


--c) ⟨∀x : x ∈ℓ xs ∧ rojo.x : cuadrado.x ∧ tan.x > 10⟩


xs = [(Rojo, Cuadrado, 11), (Rojo, Triángulo, 13)]


--8. Formalizó las siguientes sentencias escritas en lenguaje natural, utilizando cuantificadores y predicados arbitrarios para aquellas propiedades elementales.
--Cuando haya listas involucradas pod´es utilizar los operadores sobre listas que ya conocen. Por ejemplo, para la sentencia “Hay enteros pares” puede formalizarse
--con la f´ormula:
--a) Todo entero es par o impar.
    xs :: [Int]⟨∀x : x ∊ xs ^ mod x 2 = 0⟩
--b) La lista xs consiste solo de 0 'sy 1' s.
    xs :: [Int]⟨∀x : x ∊ xs ^ tam x == 1 v tam x == 0⟩
--c) Si el 1 está en xs, entonces tambiénen el 0 está.
    xs :: [Int]⟨Ex : x ∊ xs ^ tam x == 1 -> <Ey : y ∊ xs : tam y == 0⟩
--d) La lista xs contiene al menos un True.
  xs :: [Bool]  ⟨Ex: x ∊ xs ^ x == True⟩
--e) Si xs es no vac´ıa, su primer elemento es 0.
    xs :: [Int]⟨∀x : x ∊ xs ^ xs /= [] -> head xs == 0>
--f ) Todos los elementos de xs son iguales.
    xs :: [Int]⟨∀ x, y : x ∊ xs ^ y xs : x == y>  
--g) Todos los elementos de la lista xs son distintos.
    xs :: [Int] ⟨∀x, y : x ∊ xs ^ y ∊ xs : 0 < x < length xs ∧ 0 < y < length xs ∧  x /= y : xs !! x /= xs !! y >
--h) La lista xs está ordenada de manera decreciente.
    xs :: [Int]⟨∀j, i: 0 <= i < length xs - 1 ^ 0 <= j < length xs ∧  i < j : xs!!i >= xs!!j >
--i) Las listas xs e ys tienen los mismos elementos.
    xs :: [Int]⟨∀x, y : x ∊ xs ^ y ∊ xs : x ∊ ys ^ y ∊ xs>
--j) Todos los elementos de xs tienen al menos un elemento. Ayuda: ¿Cual debe ser el tipo de xs?
    xs :: [Int] ⟨ ∀ x : x ∈ xs : ⟨ ∃ y : y ∈ x : True⟩ ⟩

--9. Una propiedad que nos interesa expresar muchas veces es la unicidad, es decir, expresar que una propiedad
--se cumple una y sólo una vez. Expres´a las siguientes propiedades:
--a) Hay solo un hombre en el mundo que es Papá.
    xs :: [String] ⟨∃x : x ∈  xs ∧ hombre x : x == Papa ⟩
--b) En la lista xs hay solo un 0.
    xs :: [Int] ^ <E i : 0 <= i ^ i < length xs :  xs!!i == 0 ^ <A j : 0 <= j ^ j < length xs ^ i /= j : xs!!j /= 0 >>
--c) x aparece solo una vez en xs.
    xs :: [a] ^ <E x, i : x e xs : xs!!i == x ^ <Ey, j : y e ys : ys!!j /= xs!!i>
--d) Hay un ´único cuadrado azul en xs
    xs :: [Forma] ^ <E x, i : x e xs : 0 <= i < length xs ∧ cuadrado xs!!i ∧ azul xs!!i : <∀ j: 0 <= j < length xs ∧ i/=j:  ¬(azul.xs!!j) ∧  ¬(cuadrado.xs!!j)>> ?

-- 10. ¿Como expresar ́ıas la propiedad “x ocurre exactamente dos veces en xs”?
        xs :: [a] ^ <E x, i : x e xs ∧ y e xs : xs!!i == x <E y, j : ys!!j == x  >
            o
                   <E x, i : x e xs : xs!!i == x <E y, j : y e ys : ys!!j == x  >


--11. Demostr´a justificando cada paso con axiomas del c´alculo de cuantificadores los siguientes teoremas b´asicos.
--Una vez demostrados pod´es utilizarlos para los ejercicios siguientes.
--a) Intercambio entre rango y t´ermino ∃: ⟨∃x : R.x : T.x⟩ ≡ ⟨∃x : : R.x ∧ T.x⟩.

    ∃: ⟨∃x : R.x : T.x⟩ ≡ ⟨∃x : : R.x ∧ T.x⟩.
={A5 Definicion es E}
    ¬(∀x : r.x : ¬t.x) ≡ ⟨∃x : : R.x ∧ T.x⟩.
={A1 Intercambio entre rango y termino de A}
    ¬(∀x : r.x ⇒ ¬t.x) ≡ < ∃x : : r.x ∧ t.x >
={Caracterización ⇒: P ⇒ Q ≡ ¬P ∨ Q; P:= r.x, Q:= ¬t.x}
    -(∀x : -r.x v ¬t.x) ≡ < ∃x : : r.x ∧ t.x >
≡ {Fc de - }
    -(∀x : -(r.x v t.x)) ≡ < ∃x : : r.x ∧ t.x >
={T12 De morgan}
    (Ex : r.x ∧ t.x) ≡ <∃x : r.x ∧ t.x >

--b) Regla del T´ermino del ∃: ⟨∃x : : T.x⟩ ∨ ⟨∃x : : U.x⟩ ≡ ⟨∃x : : T.x ∨ U.x⟩.
    ⟨∃x : : T.x⟩ ∨ ⟨∃x : : U.x⟩ ≡ ⟨∃x : : T.x ∨ U.x⟩
= {A5 Definición de ∃ X3:}
    ¬<∀x : : ¬T.x> ∨ ¬<∀x : : ¬U.x> ≡ ¬<∀x : : ¬(T.x ∨ U.x)> -- Se aplica la negacion es nambos por que en el otro lado T.x y U.x son tèrminos?
= {De Morgan para ∧}
    ¬(<∀x : : ¬T.x> ∧ <∀x : : ¬U.x>) ≡ ¬<∀x : : ¬(T.x ∨ U.x)>
={Regla de término de ∀}
    ¬<∀x : : ¬T.x ∧ ¬U.x> ≡ ¬<∀x : : ¬(T.x ∨ U.x)>
={De Morgan para ∨}
    ¬<∀x : : ¬(T.x ∨ U.x)> ≡ ¬<∀x : : ¬(T.x ∨ U.x)>
={Reflexividad ≡}
    True

--c) Regla del T´ermino del ∀ (bis): ⟨∀x : R.x : T.x⟩ ∧ ⟨∀x : R.x : U.x⟩ ≡ ⟨∀x : R.x : T.x ∧ U.x⟩.
    ⟨∀x : R.x : T.x⟩ ∧ ⟨∀x : R.x : U.x⟩ ≡ ⟨∀x : R.x : T.x ∧ U.x⟩.
={A1 Intercambio entre rango y termino de para todo x2}
     (∀x :: r.x ⇒ t.x) ∧ (∀x :: r.x ⇒ U.x) ≡ ⟨∀x : R.x : T.x ∧ U.x⟩.
={A2 Regla del termino de para todo}
     (∀x :: ((r.x ⇒ t.x) ∧ (r.x ⇒ U.x))) ≡ ⟨∀x : R.x : T.x ∧ U.x⟩.
={Distributividad a derecha de la implicacion con la conjuncion}
    (∀x :: r.x ⇒ (t.x ∧ U.x)) ≡ ⟨∀x : R.x : T.x ∧ U.x⟩.
={A1 Intercambio entre Rango y termino de A}
    ⟨∀x : R.x : T.x ∧ U.x⟩. = ⟨∀x : R.x : T.x ∧ U.x⟩.

--d) Regla del T´ermino del ∃ (bis): ⟨∃x : R.x : T.x⟩ ∨ ⟨∃x : R.x : U.x⟩ ≡ ⟨∃x : R.x : T.x ∨ U.x⟩.


    <∃x : R.x : T.x> ∨ <∃x : R.x : U.x> ≡ <∃x : R.x : T.x ∨ U.x>
≡ { Def. ∃ }
    ⟨∃x : R.x : T.x⟩ ∨ ⟨∃x : R.x : U.x⟩ ≡ ¬ ⟨∀ x : R.x : ¬ (T.x ∨ U.x)⟩
≡ { De morgan ∨ }
    ⟨∃x : R.x : T.x⟩ ∨ ⟨∃x : R.x : U.x⟩ ≡ ¬ ⟨∀ x : R.x : ¬T.x ∧ ¬U.x)⟩
≡ { Regla del término de ∀ }
    ⟨∃x : R.x : T.x⟩ ∨ ⟨∃x : R.x : U.x⟩ ≡ ¬ ( ⟨∀ x : R.x : ¬T.x⟩ ∧ ⟨ ∀ x : R.x : ¬ U.x⟩ )⟩
≡ { De morgan ∧ }
    ⟨∃x : R.x : T.x⟩ ∨ ⟨∃x : R.x : U.x⟩ ≡ ¬⟨∀ x : R.x : ¬T.x⟩ ∨ ¬⟨∀ x : R.x : ¬ U.x⟩⟩
≡ { Def ∃, doble negación a ¬¬ T.x y a ¬ ¬ U.x}
    ⟨∃x : R.x : T.x⟩ ∨ ⟨∃x : R.x : U.x⟩ ≡ ⟨∃ x : R.x : T.x⟩ ∨ ⟨ ∃ x : R.x : U.x⟩⟩
≡ { Reflexividad ≡ }
    True

--e) Particion de Rango del ∀: ⟨∀x : R.x ∨ S.x : T.x⟩ ≡ ⟨∀x : R.x : T.x⟩ ∧ ⟨∀x : S.x : T.x⟩.
    ⟨∀x : R.x ∨ S.x : T.x⟩ ≡ ⟨∀x : R.x : T.x⟩ ∧ ⟨∀x : S.x : T.x⟩.
={A1 Intercambio entre rango y termino x3 }
    ⟨∀x : (R.x ∨ S.x) -> T.x⟩ ≡ ⟨∀x : R.x -> T.x⟩ ∧ ⟨∀x : S.x -> T.x⟩.
={Regla del termino de A}
    ⟨∀x  : (R.x ∨ S.x) ⇒ T.x⟩ ≡ <∀x :: (R.x ⇒ T.x) ∧ (S.x ⇒ T.x)>
={Distributividad de -T.x y v}
    ⟨∀x  : (R.x ∨ S.x) ⇒ T.x⟩ ≡ <∀x :: R.x ∧ S.x -> T.x>

--f) Particion de rango para ∃: ⟨∃x : R.x ∨ S.x : T.x⟩ ≡ ⟨∃x : R.x : T.x⟩ ∨ ⟨∃x : S.x : T.x⟩.
    ⟨∃x : R.x ∨ S.x : T.x⟩ ≡ ⟨∃x : R.x : T.x⟩ ∨ ⟨∃x : S.x : T.x⟩
={Regla del termino de E t.x =(R.x : T.x ) y s.x= (S.x : T.x)}
    ⟨∃x : R.x ∨ S.x : T.x⟩ ≡ ⟨∃x : (R.x : T.x) ∨ (S.x : T.x)⟩
={Distributividad de T.x}
    ⟨∃x : R.x ∨ S.x : T.x⟩ ≡ ⟨∃x :  T.x : (R.x ) ∨ (S.x)⟩
={Conmutatividad}
    ⟨∃x : R.x ∨ S.x : T.x⟩ ≡ ⟨∃x : R.x ∨ S.x : T.x⟩

--g) Rango unitario: ⟨∃x : x = A : T.x⟩ ≡ T.A, donde A representa una constante del universo
    ⟨∃x : x = A : T.x⟩ ≡ T.A
={Definicion de existe}
    -⟨Ax : x = A : -T.x⟩ ≡ T.A
={A4 Rango unitario de A}
        -(-T.A) = T.A
={Def. de doble negacion}
        T.A = T.A

--h) Distributividad de ∧ con ∃: Z ∧ ⟨∃x : : T.x⟩ ≡ ⟨∃x : : Z ∧ T.x⟩, si x no ocurre libre en Z.

    Z ∧ ⟨∃x : : T.x⟩ ≡ ⟨∃x : : Z ∧ T.x⟩
={A5 Definicion de E}
    Z ∧ -⟨Ax : : -T.x⟩ ≡ ⟨∃x : : Z ∧ T.x⟩
={A2 Regla de término de A}
     -⟨Ax : : Z ∧ -T.x⟩ ≡ ⟨∃x : : Z ∧ T.x⟩
={Definicion de E}
    ⟨∃x : : Z ∧ T.x⟩ ≡ ⟨∃x : : Z ∧ T.x⟩

--12. Demostr´a los siguientes teoremas utilizando axiomas y teoremas ya demostrados.

--a) Rango vac´ıo del ∀: ⟨∀x : False : T.x⟩ ≡ True.

    <∀x : False : T.x> ≡ True
≡ {Intercambio de R y T }
    <∀x : : False => T.x> ≡ True
≡ {Caract. de =>  }
    <∀x : : ¬False v T.x> ≡ True
≡ { Def. de True :  True ≡ ¬ False }
    <∀x : : True v T.x > ≡ True
≡ { Absorbente de v }
    <∀x : : True> ≡ True      
Válido por Teo Anterior

--b) Rango vac´ıo del ∃: ⟨∃x : False : T.x⟩ ≡ False.
    <∃x : False : T.x>__ ≡ False
≡ {Int de R y T del E}
    <∃x : : False ^ T.x> ≡ False
≡ {Absorbente de ^ }
    <∃x : : False> ≡ False
≡ {Def. de E }
    ¬<Ax : : ¬False> ≡ False
≡ {Def. de True }
    ¬<Ax : : True> ≡ False
≡ {Teo del principio }
    ¬True ≡ False

--c) Regla del Termino constante del ∀: ⟨∀x : : C⟩ ≡ C.

    <∀x : : C> ≡ C
≡ { Elemento Neutro del v  }
    <∀x : : C v False > ≡ C
≡ { Escape de A }
    C v <∀x : : False > ≡ C
 ≡ { ∀x : : False > ≡ False}
    C v False ≡ C

--d) Regla del T´ermino constante del ∃: ⟨∃x : : C⟩ ≡ C.

    ⟨∃x : : C⟩ ≡ C.
={Elemento neutro de ^ }    
    ⟨∃x : True ^ C⟩ ≡ C.
={Escape de E}
    c ^ ⟨∃x : True ⟩ ≡ C.
={Ex : True = True}
    c ^ True ≡ C

--13. Demostr´a que las siguientes f´ormulas son v´alidas, justificando en cada paso el axioma
--o teorema del C´alculo de Predicados utilizado.
--a) ⟨∀x : circulo.x : amarillo.x⟩ ≡ ⟨∀x : ¬amarillo.x : ¬circulo.x⟩.

    __<∀x : circulo.x : amarillo.x >__ ≡  <∀x : ¬amarillo.x : ¬circulo.x>
≡ { Int. de R y T  }
<∀x : : __circulo.x => amarillo.x__ > ≡  <∀x : ¬amarillo.x : ¬circulo.x>
≡ { Carac. de =>  }
<∀x : : ¬circulo.x v amarillo.x > ≡  __<∀x : ¬amarillo.x : ¬circulo.x>__
≡ { Int. de R y T  }
<∀x : : ¬circulo.x v amarillo.x > ≡  <∀x : : __¬amarillo.x => ¬circulo.x__>
≡ { Caract. de =>  }
<∀x : : ¬circulo.x v amarillo.x > ≡  <∀x : : __¬¬amarillo.x__ v ¬circulo.x>
≡ { Doble Neg.   }
<∀x : : ¬circulo.x v amarillo.x > ≡  <∀x : : __amarillo.x v ¬circulo.x>
≡ { Conmut.    }
<∀x : : ¬circulo.x v amarillo.x > ≡  <∀x : : ¬circulo.x v amarillo.x>


--b) ⟨∃x : cuadrado.x : amarillo.x⟩ ⇒ ⟨∃x : : cuadrado.x⟩.

    ⟨∃x : cuadrado.x : amarillo.x⟩ ⇒ ⟨∃x : : cuadrado.x⟩
={Caracterizacion del implica}
    ⟨∃x : cuadrado.x : amarillo.x⟩ v ⟨∃x : : cuadrado.x⟩ = ⟨∃x : : cuadrado.x⟩
={T6 Intercambio entre tango y término de E}
    ⟨∃x : cuadrado.x ^ amarillo.x⟩ v ⟨∃x : : cuadrado.x⟩ = ⟨∃x : : cuadrado.x⟩
={T7 Regla del termino de E}
    ⟨∃x : : (cuadrado.x ^ amarillo.x⟩ v cuadrado.x) = ⟨∃x : : cuadrado.x⟩
={Ley de absorcion}
    ⟨∃x : : cuadrado.x⟩ = ⟨∃x : : cuadrado.x⟩

--14. Demostr´a las siguientes propiedades. 

        pert :: Eq a => a -> [a] -> Bool
        pert e [ ] = False
        pert e (x:xs) = e==x !! (pert e xs)

--a) ⟨∀x : x ∈ℓ (k:ks) : T.x⟩ ≡ T.k ∧ ⟨∀x : x ∈ℓ ks : T.x⟩

    ⟨∀x : x ∈ℓ (k:ks) : T.x⟩ ≡ T.k ∧ ⟨∀x : x ∈ℓ ks : T.x⟩
={ pert implementa correctamente ∈l  , es decir: x ∈l xs ≡ pert x xs }
    ⟨∀x : x==k !! (pert x ks) : T.x⟩ ≡ T.k ∧ ⟨∀x : x ∈ℓ ks : T.x⟩
={!! = v, == -> =}
    ⟨∀x : x=k v (pert x ks) : T.x⟩ ≡ T.k ∧ ⟨∀x : x ∈ℓ ks : T.x⟩
={T1 Particion de rango para A}
    ⟨∀x : x=k : T.x> ^  ⟨∀x : (pert x ks) : T.x⟩ ≡ T.k ∧ ⟨∀x : x ∈ℓ ks : T.x⟩
={Por codigo pert e, es lo mismo decir pert x ks = x e xs}
    ⟨∀x : x=k : T.x> ^  ⟨∀x : (x e xs) : T.x⟩ ≡ T.k ∧ ⟨∀x : x ∈ℓ ks : T.x⟩
={Rango unitario}
    T.k ^ <∀x : x ∈l ks : T.x> ≡ T.k ∧ <∀x : x ∈l ks : T.x>    

--b) ⟨∃x : x ∈ℓ (k:ks) : T.x⟩ ≡ T.k ∨ ⟨∃x : x ∈ℓ ks : T.x⟩

    ⟨∃x : x ∈ℓ (k:ks) : T.x⟩ ≡ T.k ∨ ⟨∃x : x ∈ℓ ks : T.x⟩
={Por codigo, implementa e a pert}
    ⟨∃x : pert e (k:ks) : T.x⟩ ≡ T.k ∨ ⟨∃x : x ∈ℓ ks : T.x⟩
={Por codigo, pert e (x:xs) = e==x !! (pert e xs)}
    ⟨∃x : e==x !! (pert e xs) : T.x⟩ ≡ T.k ∨ ⟨∃x : x ∈ℓ ks : T.x⟩
={!! = v, y == -> =}
    ⟨∃x : e=x v (pert e xs) : T.x⟩ ≡ T.k ∨ ⟨∃x : x ∈ℓ ks : T.x⟩
={T10 Particion de rango de E}
    ⟨∃x : e=x : T.x> v <Ex : (pert e xs) : T.x⟩ ≡ T.k ∨ ⟨∃x : x ∈ℓ ks : T.x⟩
={T9, Rango unitario de E}
    T.k v <Ex : (pert e xs) : T.x⟩ ≡ T.k ∨ ⟨∃x : x ∈ℓ ks : T.x⟩
={Por codigo, pert e xs = x e ks}
    T.k v <Ex : x ∈ℓ ks : T.x⟩ ≡ T.k ∨ ⟨∃x : x ∈ℓ ks : T.x⟩

--15. Dada la definici´on de la funci´on algunCuadrado:

algunCuadrado :: [Figura] -> Bool
algunCuadrado [ ] = False                                   1
algunCuadrado (x : xs) = cuadrado.x || algunCuadrado xs     2

pert :: Eq a => a -> [a] -> Bool                            
pert e [ ] = False                                          3
pert e (x:xs) = e==x || (pert e xs)                         4

--demostr´a por inducci´on la siguiente f´ormula

        algunCuadrado xs ≡ ⟨∃x : x ∈ℓ xs : cuadrado.x⟩

        1) Para caso base, xs = []

            algunCuadrado [] ≡ ⟨∃x : x ∈ℓ [] : cuadrado.x⟩
        ={Implementacion de codigo de 1 }
            algunCuadrado [] ≡ ⟨∃x : pert x [] : cuadrado.x⟩
        ={Por codigo, 1}
            False ≡ ⟨∃x : pert x [] : cuadrado.x⟩
        ={Por codigo}
            False ≡ ⟨∃x : False : cuadrado.x⟩
        ={T14 Rango vacio}
            False = False
            Verdad por equiv.
        
      --2) Planteo de HI 

    --Fijo x y xs como valores genéricos arbitrarios
 
    --Asumo P(xs) como mi Hipótesis Inductiva. 

    --Asumo que algunCuadrado xs ≡ <∃x : x  ∈l  xs : cuadrado.x>   es V para esa x y xs. 

    --Como ya estoy usando una x, voy a hacer un cambio de la variable cuantificada
    
            algunCuadrado xs ≡ <∃y : y  ∈l  xs : cuadrado.y>

        --3) Demuestro que vale para p(x:xs)

                algunCuadrado x:xs ≡ <∃y : y  ∈l  x:xs : cuadrado.y>
            ={Implementacion de codigo 2}
                cuadrado.x || algunCuadrado xs ≡ <∃y : y  ∈l  x:xs : cuadrado.y>
            ={Implementacion de codigo de pert t}
                cuadrado.x || algunCuadrado xs ≡ <∃y : y==x || (pert y xs) : cuadrado.y>
            ={|| es v y == es =}
                cuadrado.x v algunCuadrado xs ≡ <∃y : y=x v (pert y xs) : cuadrado.y>
            ={Uso de HI}
                cuadrado.x v <∃y : y  ∈l  xs : cuadrado.y> ≡ <∃y : y=x v (pert y xs) : cuadrado.y>
            ={T10 Particion de rango de E}
                cuadrado.x v <∃y : y  ∈l  xs : cuadrado.y> ≡ <∃y : y=x : cuadrado.y> v <∃y : (pert y xs) : cuadrado.y>
            ={T9 Rango unitario de E}
                cuadrado.x v <∃y : y  ∈l  xs : cuadrado.y> ≡ cuadrado.x v <∃y : (pert y xs) : cuadrado.y>
                
                Valido por ref. 


        --17. Dada la definici´on de la funci´on soloCeros:
        
        soloCeros :: [Num] -> Bool
        soloCeros [ ] = True                                   1
        soloCeros (x : xs) = x==0 && soloCeros xs              2

        pert :: Eq a => a -> [a] -> Bool                            
        pert e [ ] = False                                     3
        pert e (x:xs) = e==x || (pert e xs)                    4
        
        --demostr´a por inducci´on la siguiente f´ormula
            
                soloCeros xs ≡ ⟨∀x : x ∈ℓ xs : x = 0⟩

        -- Caso base, xs = []

            soloCeros [] ≡ ⟨∀x : x ∈ℓ [] : x = 0⟩
        ={Implementacion de codigo de 1}
            True = ⟨∀x : x ∈ℓ [] : x = 0⟩
        ={Impl. de e a pert}
            True = ⟨∀x : pert x [] : x = 0⟩
        ={Impl. De pert x caso base 3}
            True = ⟨∀x : False : x = 0⟩
        ={T5 Rango vacio de A}
            True = True

        -- Queda probado el caso base, xs = []

        -- 2) Planteo de la Hi

        --Fijo x y xs como valores genéricos arbitrarios
 
        --Asumo P(xs) como mi Hipótesis Inductiva. 

        --Asumo que soloCeros xs ≡ ⟨∀x : x ∈ℓ xs : x = 0⟩   es V para esa x y xs. 

        --Como ya estoy usando una x, voy a hacer un cambio de la variable cuantificada

            soloCeros xs ≡ ⟨∀y : y ∈ℓ xs : y = 0⟩

        --3) Paso inductivo, pruebo que vale para P(x:xs)

            soloCeros x:xs ≡ ⟨∀y : y ∈ℓ x:xs : y = 0⟩
        ={Implementacion de codigo soloCeros en 2}
            x==0 && soloCeros xs ≡ ⟨∀y : y ∈ℓ x:xs : y = 0⟩
        ={Impl. e como pert x}
            x==0 && soloCeros xs ≡ ⟨∀y : pert y x:xs : y = 0⟩
        ={Impl. == es =, && es ^}
            x=0 ^ soloCeros xs = ⟨∀y : pert y x:xs : y = 0⟩
        ={uso de HI}
            x=0 ^ ⟨∀y : y ∈ℓ xs : y = 0⟩ = ⟨∀y : pert y x:xs : y = 0⟩
        ={Impl codigo de pert x en 4}
            x=0 ^ ⟨∀y : y ∈ℓ xs : y = 0⟩ = ⟨∀y : y==x || (pert y xs) : y = 0⟩
        ={Impl, == es =, || es v }
            x=0 ^ ⟨∀y : y ∈ℓ xs : y = 0⟩ = ⟨∀y : y=x v (pert y xs) : y = 0⟩
        ={T1 Particion de rango de A}
            x=0 ^ ⟨∀y : y ∈ℓ xs : y = 0⟩ = ⟨∀y : y=x  : y = 0⟩ ^ ⟨∀y : (pert y xs) : y = 0⟩
        ={A4 Rango unitario}
            x=0 ^ ⟨∀y : y ∈ℓ xs : y = 0⟩ = x=0 ^ ⟨∀y : (pert y xs) : y = 0⟩
        ={Impl Codigo de e como pert y}
            x=0 ^ ⟨∀y : (pert y xs) : y = 0⟩ = x=0 ^ ⟨∀y : (pert y xs) : y = 0⟩


    --16. Demostr´a por inducci´on que las funciones definidas en el Ejercicio 5 (implementaciones) satisfacen las
    --propiedades del Ejercicio 3 que las especifican. (A esta tarea se la denomina verificaci´on).
    --Por ejemplo, para el ´ıtem 3a hay que probar que
    propA xs ≡ ⟨∀x : x ∈ℓ xs : rojo.x⟩.

    --Donde propA se defini´o como

    propA :: [Figura] -> Bool
    propA [ ] = True                            1
    propA (x : xs) = rojo x && propA xs         2

    pert :: Eq a => a -> [a] -> Bool                            
    pert e [ ] = False                          3
    pert e (x:xs) = e==x || (pert e xs)         4

        --1 Caso base, xs = []

        propA [] ≡ ⟨∀x : x ∈ℓ [] : rojo.x⟩.
    ={Caso base de propA y cambio de x e a pert e 1} 
        True = ⟨∀x : pert x [] : rojo.x⟩.
    ={Imp caso base de pert 3}
        True = ⟨∀x : False : rojo.x⟩.
    ={T5 Rango vacio de A}
        True = True

        --2 Planteo de HI

        --X y xs son valores arbitrarios, asumo p(xs) como mi Hi

        --Asumo que soloCeros xs ≡ ⟨∀x : x ∈ℓ xs : x = 0⟩   es V para esa x y xs. 

        --Como ya estoy usando una x, voy a hacer un cambio de la variable cuantificada
                        propA xs ≡ ⟨∀y : y ∈ℓ xs : rojo.y⟩.

        --3 Paso inductivo, muestro que es valido para P (x:xs)

            propA x:xs ≡ ⟨∀y : y ∈ℓ x:xs : rojo.y⟩.
        ={Impl cod propA, y e como pert y}
            rojo x && propA xs ≡ ⟨∀y : (pert y x:xs) : rojo.y⟩
        ={Uso de HI}    
            rojo x && ⟨∀y : y ∈ℓ xs : rojo.y⟩ ≡ ⟨∀y : (pert y x:xs) : rojo.y⟩  
        ={Impl de codigo pert y x:xs}
           rojo x && ⟨∀y : y ∈ℓ xs : rojo.y⟩ ≡ ⟨∀y : y==x || (pert y xs) : rojo.y⟩   
        ={Impl, == es =, && es ^ y || es v}
            rojo x ^ ⟨∀y : y ∈ℓ xs : rojo.y⟩ ≡ ⟨∀y : y=x v (pert y xs) : rojo.y⟩   
        ={T1 Particion de rango de A}
            rojo x ^ ⟨∀y : y ∈ℓ xs : rojo.y⟩ ≡ ⟨∀y : y=x : rojo.y⟩ ^ ⟨∀y : (pert y xs) : rojo.y⟩
        ={A4 Rango unitario de A}
            rojo x ^ ⟨∀y : y ∈ℓ xs : rojo.y⟩ ≡ rojo x ^ ⟨∀y : (pert y xs) : rojo.y⟩
        ={impl de codigo, de y e xs como pert y xs}
            rojo x ^ ⟨∀y : pert y xs : rojo.y⟩ ≡ rojo x ^ ⟨∀y : (pert y xs) : rojo.y⟩

            --b) Todas las figuras de xs son de tamaño menor a 5.

        propB xs = <∀ x : x ∊l xs  : tam x < 5>

        propB :: [Figura] -> Bool
        propB [] = True                             1
        propB (x : xs) = tam x <5 && espB xs             2

        pert e :: Eq a => a -> [a] -> Bool                            
        pert e [ ] = False                          3
        pert e (x:xs) = e==x || (pert e xs)         4

        --1 Caso base, xs = []

            propB [] = <∀ x : x ∊l []  : tam x < 5>
        ={Impl. Codigo en caso base, 1 y x e xs como pert x }
            True = <∀ x : pert x [] : tam x < 5>
        ={Caso base de Pert x 3}
            True = <∀ x : False : tam x < 5>
        ={T5 Rango vacio de A}
            True = True

        --2 Hipotesis inductiva

        -- sea x y xs arbirtrarios, no puedo repetir x de nuevo
        -- cambio x por y tal forma que queda:
                propB xs = <∀y : y ∊l xs  : tam y < 5>

        --3 paso inductivo, pruebo que vale para x:xs

            propB x:xs = <∀y : y ∊l x:xs  : tam y < 5>
        ={Impl Codigo en 2, cambio y el x:xs por pert}
            tam x<5 && propB xs = <∀y : pert y x:xs  : tam y < 5>
        ={Uso de HI y cambio de y el xs a pert y}
            tam x<5 && <∀y : pert y xs  : tam y < 5> = <∀y : pert y x:xs : tam y < 5>
        ={impl. Codigo de pert y xs 4}
            tam x<5 && <∀y : pert y xs : tam y < 5> = <∀y : y==x || (pert y xs) : tam y < 5>
        ={Cambio de && es ^, || es v, == es = }
            tam x<5 ^ <∀y : pert y xs : tam y < 5> = <∀y : y=x v (pert y xs) : tam y < 5>
        ={T1 Particion de rango de A}
            tam x<5 ^ <∀y : pert y xs : tam y < 5> = <∀y : y=x : tam y < 5> ^ <∀y : (pert y xs) : tam y < 5>
        ={A4 Rango unitario de A}
            tam x < 5 ^ <∀y : pert y xs : tam y < 5> = tam x < 5 ^ <∀y : (pert y xs) : tam y < 5>

            --Valido por ref de =

        --c) Todos los tri´angulos de xs son rojos.

        propC xs = <∀ x : x ∊ xs ^ Triangulo x : roja x>

        propC :: [Figura] ->Bool 
        propC [] = True                                         1
        propC (x : xs) = (triangulo x && rojo x) && propC xs    2

        pert e :: Eq a => a -> [a] -> Bool                            
        pert e [ ] = False                          3
        pert e (x:xs) = e==x || (pert e xs)         4

        --1) Caso base, xs = []

            propC [] = <∀ x : x ∊ [] ^ Triangulo x : roja x>
        ={Imp codigo 1}
            True = <∀ x : x ∊ [] ^ Triangulo x : roja x>
        ={Cambio x e [] por pert, y uso 3}
            True = <∀ x : False ^ Triangulo x : roja x>
        ={T10 Elemento absobente}
            True = <∀ x : False : roja x>
        ={T5 Rango vacio de A}
            True = True 

        --2) Planteo de la HI
        -- como a x lo estoy usando, no puedo repetirlo, hago un cambio de variable quedando:
                propC xs = <∀y : y ∊ xs ^ Triangulo y : roja y>

        --3) Planteo el paso inductivo, demuestro que vale para P(x:xs)

                propC x:xs = <∀y : y ∊ x:xs ^ Triangulo y : roja y>
            ={Imp de codigo de 2}
                (triangulo x && rojo x) && propC xs = <∀y : y ∊ x:xs ^ Triangulo y : roja y>
            ={Cambio de y e x:xs por pert y}
                (triangulo x && rojo x) && propC xs = <∀y : pert y x:xs ^ Triangulo y : roja y>
            ={Imp codigo de 4}
                (triangulo x && rojo x) && propC xs = <∀y : y==x || (pert y xs) ^ Triangulo y : roja y>
            ={Cambio de && es ^, || es v, == es = }
                (triangulo x ^ rojo x) ^ propC xs = <∀y : y=x v (pert y xs) ^ Triangulo y : roja y>
            ={T15 Distributividad de ^ con v, p= y=x, q= pert y xs, r= Triangulo y}
                (triangulo x ^ rojo x) ^ propC xs = <∀y : (y=x ^ (pert y xs)) v ((pert y xs) ^ Triangulo y) : roja y>
            ={T1 Particion de rango de A}
                (triangulo x ^ rojo x) ^ propC xs = <∀y : (y=x ^ (pert y xs)) : roja y> v <∀y : ((pert y xs) ^ Triangulo y) : roja y>
            ={Uso de hi (me olvide xD)}
                (triangulo x ^ rojo x) ^ <∀y : y ∊ xs ^ Triangulo y : roja y> = <∀y : (y=x ^ Triangulo y) : roja y> v <∀y : ((pert y xs) ^ Triangulo y) : roja y>
            ={A4 Rango unitario de A}
                (triangulo x ^ rojo x) ^ <∀y : y ∊ xs ^ Triangulo y : roja y> =  (Triangulo x ^ roja y) v <∀y : ((pert y xs) ^ Triangulo x) : roja y>
            




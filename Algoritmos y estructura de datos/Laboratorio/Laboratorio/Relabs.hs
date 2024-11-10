data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si 
data Alteracion = Bemol | Natural | Sostenido 
data NotaMusical = Nota NotaBasica Alteracion 

sonidoNatural :: NotaBasica -> Int 
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11

sonidoCromatico :: NotaMusical -> Int 
sonidoCromatico (Nota s Sostenido) = sonidoNatural  s + 1
sonidoCromatico (Nota s Bemol) = sonidoNatural s  - 1
sonidoCromatico (Nota s Natural) = sonidoNatural s

instance Eq NotaMusical
    where 
        nota1 == nota2 = --Si las dos nota (que es NotaMusical) son iguales, entonces:
            sonidoCromatico nota1 == sonidoCromatico nota2

{-
Ok, one module loaded.
ghci> Nota Do Sostenido == Nota Re Natural
False
ghci> Nota Do Sostenido == Nota Re Sostenido
False
ghci> Nota Do Sostenido == Nota Do Sostenido
True
ghci> 
-}

instance Ord NotaMusical where
    -- Definir cómo comparar si una nota es menor o igual a otra.
    nota1 <= nota2 = sonidoCromatico nota1 <= sonidoCromatico nota2

    -- Definir cómo comparar si una nota es mayor que otra.
    nota1 >= nota2 = sonidoCromatico nota1 >= sonidoCromatico nota2

    -- Definir cómo comparar el orden en que las notas deben ser ordenadas.
    compare nota1 nota2 = compare (sonidoCromatico nota1) (sonidoCromatico nota2)

    -- Definir el operador de menor que.
    nota1 < nota2 = sonidoCromatico nota1 < sonidoCromatico nota2

    -- Definir el operador de mayor que.
    nota1 > nota2 = sonidoCromatico nota1 > sonidoCromatico nota2

primerElemento :: [a] -> Maybe a 
primerElemento [] = Nothing 
primerElemento (x:xs) = Just x 

--a)atender :: Cola -> Maybe Cola, que elimina de la cola a la persona que est ́a en la primer posici ́on
-- de una cola, por haber sido atendida. Si la cola est ́a vac ́ıa, devuelve Nothing.

type Altura = Int
type NumCamiseta = Int

-- Tipos algebraicos sin parámetros (aka enumerados)
data Zona = Arco | Defensa | Mediocampo | Delantera deriving(Show, Eq)

data TipoReves = DosManos | UnaMano deriving(Show)

data Modalidad = Carretera | Pista | Monte | BMX deriving(Show)

data PiernaHabil = Izquierda | Derecha deriving(Show)


-- Sinónimo
type ManoHabil = PiernaHabil

-- Tipo algebraico con constructores paramétricos

data Deportista = 
      Ajedrecista                  -- Constructor sin argumentos
    | Ciclista Modalidad           -- Constructor con un argumento
    | Velocista Altura             -- Constructor con un argumento
    | Tenista TipoReves ManoHabil Altura  -- Constructor con tres argumentos
    | Futbolista Zona NumCamiseta PiernaHabil Altura -- Constructor con varios argumentos
    deriving(Show)

data Cola = VaciaC | Encolada Deportista Cola deriving(Show)

atender :: Cola -> Maybe Cola
atender VaciaC = Nothing 
atender (Encolada deportista cola) = Just cola 

{-
y::Cola
y = Encolada Tenista (Encolada Ciclista VaciaC)

--chekiada !
--para probar:
-- encolar y
-}

encolar :: Deportista -> Cola -> Cola
encolar n VaciaC = Encolada n VaciaC
encolar n (Encolada deportista cola) = Encolada n (Encolada deportista cola) --Lo ultimo es Cola. n es el deportista

busca :: Cola -> Zona -> Maybe Deportista
busca VaciaC z = Nothing 
busca (Encolada (Futbolista zona n p a) cola) z | z == zona = Just (Futbolista zona n p a) 
                                                | otherwise = busca cola z
busca (Encolada _ cola) z = busca cola z

y :: Cola 
y = Encolada (Futbolista Delantera 1 Izquierda 180) 
    (Encolada (Futbolista Defensa 2 Derecha 175) 
    (Encolada (Velocista 9) 
    (Encolada (Futbolista Arco 3  Izquierda 170) VaciaC)))


{-
ghci> busca y Arco
Just (Futbolista Arco 3 Izquierda 170)
ghci> busca y Defensa
Just (Futbolista Defensa 2 Derecha 175)
ghci> 
-}
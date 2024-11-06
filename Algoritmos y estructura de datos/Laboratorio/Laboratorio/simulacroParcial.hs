type Altura = Int                                       --Para representar la altura en centimetros
data Modalidad = Carretera | Pista deriving (Show)      --Modalidad del ciclista, Carretera o Pista

data Deportista = Velocista Altura | Ciclista Modalidad deriving (Show)

juan :: Deportista
juan = Velocista 172

pedro :: Deportista
pedro = Ciclista Carretera

maria :: Deportista
maria = Velocista 180

esVelocistaAlto :: Deportista -> Int -> Bool 
esVelocistaAlto (Velocista altura) n = altura > n 
esVelocistaAlto _ _ = False

{-
Ejemplos 
- esVelocistaAlto (Velocista 150) 160 --> False
- esVelocistaAlto (Velocista 180) 160 --> True 
- esVelocistaAlto juan 160 --> True 

Sirve para que el profe entienda como lo pensaste vos y rascar puntos ¡ 
-}

contarVelocistas :: [Deportista] -> Int
contarVelocistas [] = 0                                  --Caso base
contarVelocistas ((Ciclista _ : xs )) = contarVelocistas xs 
contarVelocistas ((Velocista _ : xs )) = 1 + contarVelocistas xs


{-
Ejemplos:
- contarVelocistas [Velocistas 150, Ciclista Pista, Velocista 170] --> 2
- contarVelocistas [Ciclista Carretera, Ciclista Pista, Ciclista Pista] --> 0
- contarVelocistas [juan] --> 1
-}


esCiclista :: Deportista -> Bool
esCiclista (Ciclista _) = True 
esCiclista (Velocista _) = False
--alt:
-- esCiclista _ = False 

{-
Ejemplos:
- esCiclista (Ciclista Pista) --> True
- esCilcista (Velocista 167) --> False 
- esCiclista juan --> False
-}

data Cola = VaciaC | Encolada Deportista Cola deriving (Show)

encolar :: Deportista -> Cola -> Cola
encolar d VaciaC = Encolada d VaciaC
encolar d (Encolada d' cola) = Encolada d cola

{-
Ejemplos:
cola1 = encolar juan VaciaC
cola2 = encolar pedro cola1
cola3 = encolar maria cola2

para probar: 
print cola1
print cola2
print cola3
-}


--Parcial 2024 tema D
-- 1 a)
--LibroGlobal:
type Nombre = String 
type Autor = String
type NumeroDePaginas = Int 
type Precio = Int 

--Novela:
data Genero = Drama | Romance | Misterio | Aventura deriving (Show)
--Ensayo:
data Tema = Politica | Filosofia | Ciencia | Historia deriving (Show)
--Poesia:
data Estilo = Clasica | Contemporanea | Experimental deriving (Show)
--Cientifico:
data AreaDeEstudio = Astronomia | Fisica | Matematicas | Computacion deriving (Show) 

--Tipos de libros:
data Libro = Novela Nombre Genero Autor NumeroDePaginas Precio 
            | Ensayo Nombre Tema Autor NumeroDePaginas
            | Poesia Nombre Estilo Autor NumeroDePaginas Precio
            | Cientifico Nombre AreaDeEstudio Autor NumeroDePaginas
    deriving (Show)

--b)

cuantasNovelasPorGenero :: [Libro] -> Genero -> Int
cuantasNovelasPorGenero [] _ = 0
cuantasNovelasPorGenero ((Novela _ Drama _ _ _ ): xs) Drama = 1 + cuantasNovelasPorGenero xs Drama  
cuantasNovelasPorGenero ((Novela _ Romance _ _ _ ): xs) Romance = 1 + cuantasNovelasPorGenero xs Romance  
cuantasNovelasPorGenero ((Novela _ Misterio _ _ _ ): xs) Misterio = 1 + cuantasNovelasPorGenero xs Misterio  
cuantasNovelasPorGenero ((Novela _ Aventura _ _ _ ): xs) Aventura = 1 + cuantasNovelasPorGenero xs Aventura  

--c)
instance Eq Libro where
    (Novela n g a _ _) == (Novela n' g' a' _ _) = eqGenero g g' && n == n' && a == a'    
    (Ensayo n t a _) == (Ensayo n' t' a' _) = eqTema t t' && n == n' && a == a'    
    (Poesia n e a _ _) == (Poesia n' e' a' _ _) = eqEstilo e e' && n == n' && a == a'    
    (Cientifico n ae a _) == (Cientifico n' ae' a' _) = eqAreaDeEstudio  ae ae' && n == n' && a == a'
    _ == _ = False

eqGenero :: Genero -> Genero -> Bool
eqGenero Drama Drama = True
eqGenero Romance Romance = True
eqGenero Misterio Misterio = True
eqGenero Aventura Aventura = True
eqGenero _ _ = False

eqTema :: Tema -> Tema -> Bool
eqTema Politica Politica = True
eqTema Filosofia Filosofia = True
eqTema Ciencia Ciencia = True
eqTema Historia Historia = True
eqTema _ _  = False

eqEstilo :: Estilo -> Estilo -> Bool
eqEstilo Clasica Clasica = True
eqEstilo Contemporanea Contemporanea = True
eqEstilo Experimental Experimental = True
eqEstilo  _ _ = False

eqAreaDeEstudio :: AreaDeEstudio -> AreaDeEstudio -> Bool
eqAreaDeEstudio Astronomia Astronomia = True
eqAreaDeEstudio Fisica Fisica = True
eqAreaDeEstudio Matematicas Matematicas = True
eqAreaDeEstudio Computacion Computacion = True
eqAreaDeEstudio  _ _ = False

--d)

hayDosDistintosConsecutivos :: [Libro] -> Bool
hayDosDistintosConsecutivos [] = False 
hayDosDistintosConsecutivos [x] = False 
hayDosDistintosConsecutivos (y:(x:xs)) | x /= y = True 
                                       | otherwise = hayDosDistintosConsecutivos (x:xs) 

{-
y :: [Libro]
y = [Novela "abc" Drama "Pepe" 200 20, 
     Novela "abc" Drama "Pepe" 220 210, 
     Novela "abc" Drama "Pepe" 210 230]

x :: [Libro]
x = [Ensayo "ab1c" Historia "Pep2e" 200, 
     Ensayo "ab1c" Historia "Pep2e" 200 , 
     Ensayo "ab1c" Historia "Pep2e" 200 ]

-}

--2)
type NombreCompleto = String 
type Edad = Int 
type Calificaciones = [Int]

--Constructores:
data EstadoEstudiantes = EvolucionDeEstudiante NombreCompleto Edad Calificaciones| NoHayEstudiantes  deriving Show
data NoHayEStudiantes = Nothing deriving Show

--Funcion aux

promedioNota :: Calificaciones -> Int -- se que debe ser float, pero si pongo fromIntegral me deforma todo a algo q no se arreglar
promedioNota [] = 0
promedioNota (x:xs) 
  | any (< 1) xs || any (> 10) xs = error "Las notas deben estar entre 1 y 10"
  | otherwise = sum xs `div` length xs

avanzarAño :: [EstadoEstudiantes] -> NombreCompleto -> Bool 
avanzarAño [] _ = False 
avanzarAño ((EvolucionDeEstudiante nombre _ calificaciones ):xs) nombreBuscado 
  | nombre == nombreBuscado = promedioNota calificaciones >= 6
  | otherwise = avanzarAño xs nombreBuscado

{-
estudiantes :: [EstadoEstudiantes]
estudiantes = [
    EvolucionDeEstudiante "Juan Pérez" 16 [8, 9, 10],
    EvolucionDeEstudiante "Ana Gómez" 15 [7, 6, 5],
    EvolucionDeEstudiante "Luis Fernández" 17 [5, 4, 6],
    EvolucionDeEstudiante "María López" 16 [10, 9, 10],
    NoHayEstudiantes
  ]

  probar:

  avanzarAño estudiantes "Luis Fernández"
-}

--b)

promedioGeneral :: EstadoEstudiantes -> String -> Maybe Float
promedioGeneral NoHayEstudiantes _ = Nothing --NoHayEstudiantes 
promedioGeneral (EvolucionDeEstudiante nombre _ calificaciones) nombredepersona = Just (promedioNota, calificaciones) || NoHayEstudiantes --NoHayEstudiantes 
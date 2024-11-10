type Nombre = String 
type Autor = String 
type NumeroDePaginas = Int 
type Precio = Int 
data Tema = Politica | Filosofia | Ciencia | Histori deriving (Show, Eq)
data Estilo = Clasica | Contemporanea | Experimental deriving (Show, Eq)
data AreaDeEstudio = Astronomia | Fisica | Matematicas | Computacion deriving (Show, Eq) 
data Genero = Drama | Romance | Misterio | Aventura    deriving (Show, Eq)

data Libro = Novela Nombre Genero Autor NumeroDePaginas Precio 
            | Ensayo Nombre Tema Autor NumeroDePaginas
            | Poesia Nombre Estilo Autor NumeroDePaginas Precio 
            | Cientifico Nombre AreaDeEstudio Autor NumeroDePaginas deriving (Show, Eq)

cuantasNovelasPorGenero :: [Libro] -> Genero -> Int 
cuantasNovelasPorGenero [] g = 0 
cuantasNovelasPorGenero ((Novela n genero a np p):xs) g | g == genero = 1 + cuantasNovelasPorGenero xs g 
                                                        | otherwise = cuantasNovelasPorGenero xs g 

--Alternativamente
cuantasNovelasPorGenero1 :: [Libro] -> Genero -> Int 
cuantasNovelasPorGenero1 [] g = 0 
cuantasNovelasPorGenero1 ((Novela _ Drama _ _ _):xs) Drama = 1 + cuantasNovelasPorGenero xs Drama 
cuantasNovelasPorGenero1 ((Novela _ Romance _ _ _):xs) Romance = 1 + cuantasNovelasPorGenero xs Romance 
cuantasNovelasPorGenero1 ((Novela _ Misterio _ _ _):xs) Misterio = 1 + cuantasNovelasPorGenero xs Misterio 
cuantasNovelasPorGenero1 ((Novela _ Aventura _ _ _):xs) Aventura = 1 + cuantasNovelasPorGenero xs Aventura 
cuantasNovelasPorGenero1 (_:xs) g = cuantasNovelasPorGenero xs g 

hayDosDistintosConsecutivos :: [Libro] -> Bool 
hayDosDistintosConsecutivos [] = False 
hayDosDistintosConsecutivos [x] = False 
hayDosDistintosConsecutivos (x:y:xs) | x /= y = hayDosDistintosConsecutivos xs 
                                     | otherwise = False 

type Edad = Int 
type Calificaciones = [Int] 

data EstadoEstudiantes = NoHayEstudiantes | EvolucionDeEstudiante Nombre Edad Calificaciones EstadoEstudiantes deriving (Show, Ord, Eq)

promedioNotas :: Calificaciones -> Int 
promedioNotas [] = 0
promedioNotas calificaciones = sum calificaciones `div` length calificaciones

estaAprobado :: EstadoEstudiantes -> Nombre -> Bool 
estaAprobado NoHayEstudiantes _ = False
estaAprobado (EvolucionDeEstudiante nombre _ calificaciones estadoEstudiantes) nombre1| nombre == nombre1 && promedioNotas calificaciones >= 7 = True 
                                                                                      | nombre == nombre1 && promedioNotas calificaciones < 7 && promedioNotas calificaciones > 6 && minimum calificaciones >= 8 = True 
                                                                                      | nombre == nombre1 && promedioNotas calificaciones < 6 = False 

avanzarDeAño :: EstadoEstudiantes -> String -> Bool
avanzarDeAño NoHayEstudiantes nombre = False 
avanzarDeAño (EvolucionDeEstudiante nombre _ calificaciones estadoEstudiantes) nombre1 | nombre == nombre1 = estaAprobado (EvolucionDeEstudiante nombre 0 calificaciones NoHayEstudiantes) nombre1
                                                                                       | otherwise = avanzarDeAño estadoEstudiantes nombre1 
ejemplo :: EstadoEstudiantes
ejemplo = EvolucionDeEstudiante "asd" 12 [10, 10, 10, 10] (EvolucionDeEstudiante "Elias" 12 [1, 3, 4, 5](EvolucionDeEstudiante "as123d" 145 [12, 30, 40, 50] NoHayEstudiantes))

promedioGeneral :: EstadoEstudiantes -> String -> Maybe Int 
promedioGeneral NoHayEstudiantes _ = Nothing 
promedioGeneral (EvolucionDeEstudiante nombre _ calificaciones estadoEstudiantes) nombre1 | nombre == nombre1 = Just (fromIntegral (sum calificaciones) `div` fromIntegral (length calificaciones))
                                                                                          | otherwise = promedioGeneral estadoEstudiantes nombre1   
{-
Ok, one module loaded.
ghci> avanzarDeAño ejemplo "asd"
True
ghci> avanzarDeAño ejemplo "asd"
True
ghci> :r
[1 of 2] Compiling Main             ( testFunciones.hs, interpreted ) [Source file changed]
Ok, one module loaded.
ghci> avanzarDeAño ejemplo "Elias"
False
ghci> :r
[1 of 2] Compiling Main             ( testFunciones.hs, interpreted ) [Source file changed]
Ok, one module loaded.
ghci> promedioGeneral ejemplo "Elias"
Just 3
ghci> promedioGeneral ejemplo "asd"
Just 10
ghci> 
-}
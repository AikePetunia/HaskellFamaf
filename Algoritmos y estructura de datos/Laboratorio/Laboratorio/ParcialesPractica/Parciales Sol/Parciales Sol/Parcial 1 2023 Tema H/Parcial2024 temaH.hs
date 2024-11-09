data Luminosidad = Supergigante | Gigante | SecuenciaPrincipal | Enana deriving (Show, Eq, Ord) 
data Temperatura = A | B | F | G | K | M | O deriving (Show, Eq, Ord)
data Estructura = Rocoso | Gaseoso deriving (Show, Eq, Ord)
type NumSatelites = Int 
type DistEstrella = Float 
type Nombre = String 
data Astro = Estrellas Luminosidad Temperatura Nombre 
            | Planeta  Estructura NumSatelites DistEstrella   deriving (Show, Eq, Ord) 

masSatelites :: [Astro] -> Int -> [Astro]
masSatelites [] n = []
masSatelites [x] n = [x]
masSatelites ((Planeta luminosidad numSatelites nombre):xs) n | n >= numSatelites = Planeta luminosidad numSatelites nombre : masSatelites xs n 
                                               | otherwise = masSatelites xs n 

type Nivel = Int 
type N1 = Int 
type N2 = Int 
type NotaFinal = Int 
data NotasDeIngles = NoHayMasEstudiantes | EvolucionDelEstudiante Nombre Nivel N1 N2 NotaFinal NotasDeIngles

condicion :: NotasDeIngles -> Bool 
condicion NoHayMasEstudiantes = False 
condicion (EvolucionDelEstudiante _ nivel n1 n2 notaFinal notasDeIngles) | (nivel == 1 || nivel == 2 || nivel == 3) && (n1 > 8 && n2 > 7 || n2 > 8 && n1 > 7) && notaFinal > 7 = True 
                                                                         | otherwise = False 

pasaDeNivel :: NotasDeIngles -> String -> Bool
pasaDeNivel NoHayMasEstudiantes _ = False
pasaDeNivel (EvolucionDelEstudiante nombre nivel n1 n2 notaFinal notasDeIngles) nombre1
    | nombre == nombre1 && (nivel == 1 || nivel == 2 || nivel == 3)  && ((n1 > 8 && n2 > 7) || (n2 > 8 && n1 > 7)) && notaFinal > 7 = True
    | nombre /= nombre1 = pasaDeNivel notasDeIngles nombre1
    | otherwise = False
-- no se por que, pero independientemente de que le de, dará false 

ejemplo :: NotasDeIngles
ejemplo = EvolucionDelEstudiante "asddd" 1 10 7 9 
             (EvolucionDelEstudiante "diablo" 1 5 9 10 
             (EvolucionDelEstudiante "asd" 3 2 4 5 NoHayMasEstudiantes))

devolverNotaFinal :: NotasDeIngles -> String -> Maybe Int 
devolverNotaFinal NoHayMasEstudiantes s = Nothing 
devolverNotaFinal (EvolucionDelEstudiante nombre _ _ _ notaFinal notasDeIngles) s | s == nombre = Just notaFinal 
                                                                                  | otherwise = devolverNotaFinal notasDeIngles s
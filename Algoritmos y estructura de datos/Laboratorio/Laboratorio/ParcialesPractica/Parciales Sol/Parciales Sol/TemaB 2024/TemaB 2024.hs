type Nombre = String
type Director = String 
type Duracion = Int 
type AñoEstreno = Int 
type Temporada = Int 
type NroCapitulo = Int 

data Video = Pelicula Nombre Director Duracion AñoEstreno 
            | CapSerie Nombre NroCapitulo Temporada AñoEstreno  deriving (Show)

odisea2001 :: Video
odisea2001 = Pelicula "2001: Odisea del espacio" "Stanley Kubrick" 142 1968

theOfficeS02E05 :: Video
theOfficeS02E05 = CapSerie "The Offiece" 5 2 2005

esDelDirector :: Video -> String -> Bool 
esDelDirector (Pelicula _ director _ _) d | d == director = True 
                                          | otherwise = False 

esActual :: Video -> Bool
esActual (CapSerie _ _ _ año) | año >= 2020 = True 
                              | otherwise = False 

tiempoPelis :: [Video] -> Int -> Int
tiempoPelis [] añoDado = 0
tiempoPelis ((Pelicula _ _ duracion añoEstreno):xs) añoDado | añoEstreno == añoDado = duracion + tiempoPelis xs añoDado
                                                            | otherwise = tiempoPelis xs añoDado 

{-
ghci> tiempoPelis [(Pelicula "as" "asd" 120 2024), (Pelicula "asd" "sdfoji" 1222 2020)] 2020
1222
ghci> tiempoPelis [(Pelicula "as" "asd" 120 2024), (Pelicula "asd" "sdfoji" 1222 2020)] 2024
120
-}

data ColaVideo = Vacia | Encolada Video ColaVideo deriving Show

colaReproduccion :: ColaVideo
colaReproduccion = Encolada theOfficeS02E05 (Encolada theOfficeS02E05 Vacia)

seriesActuales :: ColaVideo -> ColaVideo
seriesActuales Vacia = Vacia 
seriesActuales (Encolada (CapSerie nombre nroCap temporada 2024) colaVideo) = Encolada (CapSerie nombre nroCap temporada 2024) (seriesActuales colaVideo) 
seriesActuales (Encolada _ colaVideo) = seriesActuales colaVideo

import Distribution.Compat.Lens (_1)
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
theOfficeS02E05 = CapSerie "The Office" 5 2 2005

esDelDirector :: Video -> String -> Bool 
esDelDirector (Pelicula _ director _ _) directorBuscado = director == directorBuscado
esDelDirector _ directorBuscado = False

esDelAño :: Video -> Int -> Bool
esDelAño (Pelicula _ _ _ año) añoBuscado = año == añoBuscado
esDelAño (CapSerie _ _ _ año) añoBuscado = año == añoBuscado
esDelAño _ _ = False

tiempoPelis :: [Video] -> Int -> Int 
tiempoPelis [] n = 0 
tiempoPelis ((Pelicula _ _ duracion _):xs) n = duracion + tiempoPelis xs n
tiempoPelis (_:xs) n = tiempoPelis xs n 

data ColaVideo = Vacia | Encolada Video ColaVideo deriving (Show)


colaReproduccion :: ColaVideo
colaReproduccion = Encolada odisea2001 (Encolada theOfficeS02E05 Vacia)

seriesActuales :: ColaVideo -> ColaVideo
seriesActuales Vacia = Vacia
seriesActuales (Encolada (CapSerie nombre nroCap temp año) xs) | año >= 2020 = Encolada (CapSerie nombre nroCap temp año) (seriesActuales xs)
                                                               | otherwise = seriesActuales xs
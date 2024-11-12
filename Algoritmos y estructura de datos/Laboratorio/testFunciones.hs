type Nombre = String 
type Director = String 
type Duracion = Int
type NroCapitulo = Int
type Temporada = Int
type AñoEstreno = Int
data Video = Pelicula Nombre Director Duracion AñoEstreno
            | CapSerie Nombre NroCapitulo Temporada AñoEstreno deriving (Show)

elPadrino :: Video 
elPadrino = Pelicula "El Padrino" "Francis Ford Coppola" 177 1972

breakingBads01e01 :: Video
breakingBads01e01 = CapSerie "Breaking Bad" 1 1 2008

esPrimerCapitulo :: Video -> Bool
esPrimerCapitulo (CapSerie _ 1 1 _) = True
esPrimerCapitulo _ = False

esEstreno :: Video -> Bool
esEstreno (Pelicula _ _ _ 2024) = True
esEstreno _ = False

duracionPelimasLarga :: [Video] -> Int
duracionPelimasLarga [] = 0
duracionPelimasLarga ((Pelicula _ _ duracion _ ): xs) = max duracion (duracionPelimasLarga xs)
duracionPelimasLarga (CapSerie _ _ _ _:xs) = 0
duracionPelimasLarga (_:xs) = duracionPelimasLarga xs

data ColaVideo = Vacia | Encolada Video ColaVideo deriving (Show)

pelisDelDirector :: ColaVideo -> Director -> ColaVideo 
pelisDelDirector Vacia _ = Vacia
pelisDelDirector (Encolada (Pelicula nombre director duracion añoEstreno) cola) d | d == director = Encolada (Pelicula nombre director duracion añoEstreno) (pelisDelDirector cola d)
                                                                                  | otherwise = pelisDelDirector cola d 
pelisDelDirector (Encolada (CapSerie nombre nroCapitulo temporada añoEstreno) cola) d = pelisDelDirector cola d

-- Ejemplos de videos
inception :: Video 
inception = Pelicula "Inception" "Christopher Nolan" 148 2010

breakingBads01e02 :: Video
breakingBads01e02 = CapSerie "Breaking Bad" 2 1 2008

peliculaNueva :: Video
peliculaNueva = Pelicula "Estreno Inesperado" "Nuevo Director" 120 2024

-- Ejemplos de una cola de reproducción
colaReproduccion :: ColaVideo
colaReproduccion = Encolada elPadrino (Encolada breakingBads01e01 (Encolada inception (Encolada peliculaNueva Vacia)))

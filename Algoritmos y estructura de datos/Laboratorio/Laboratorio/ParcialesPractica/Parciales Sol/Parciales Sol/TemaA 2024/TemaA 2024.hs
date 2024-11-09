
type Nombre = String
type Director = String 
type Duracion = Int 
type AñoEstreno = Int 
type Temporada = Int 
type NroCapitulo = Int 

data Video = Pelicula Nombre Director Duracion AñoEstreno 
            | CapSerie Nombre NroCapitulo Temporada AñoEstreno  deriving (Show)

elPadrino :: Video
elPadrino = Pelicula "El Padrino" "Francis Ford Coppola" 177 1972

breakingBadS01E01 :: Video
breakingBadS01E01 = CapSerie "Breaking Bad" 1 1 2008

esPrimerCapitulo :: Video -> Bool 
esPrimerCapitulo (CapSerie _ 1 1 _ ) = True 
esPrimerCapitulo _ = False 

esEstreno :: Video -> Bool 
esEstreno (Pelicula _ _ _ 2024) = True 
esEstreno _ = False 

duracionPeliMasLarga :: [Video] -> Int 
duracionPeliMasLarga [] = 0
duracionPeliMasLarga ((Pelicula _ _ duracion _):xs) = max duracion (duracionPeliMasLarga xs)

data ColaVideo = Vacia | Encolada Video ColaVideo deriving (Show)

colaReproduccion :: ColaVideo
colaReproduccion = Encolada elPadrino (Encolada breakingBadS01E01 Vacia)

pelisDelDirector :: ColaVideo -> String -> ColaVideo
pelisDelDirector Vacia _ = Vacia  
pelisDelDirector (Encolada (Pelicula titulo director anio duracion) colaVideo) d
    | d == director = Encolada (Pelicula titulo director anio duracion) (pelisDelDirector colaVideo d)  -- Caso coincide el director
    | otherwise = pelisDelDirector colaVideo d 

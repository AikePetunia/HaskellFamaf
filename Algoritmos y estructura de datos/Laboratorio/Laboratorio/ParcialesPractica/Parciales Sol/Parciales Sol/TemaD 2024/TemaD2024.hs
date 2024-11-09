type Año = Int
type Nombre = String 
type Artista = String 
type Temas = [String]
type Duracion = Int 

data Lanzamiento = Album Nombre Artista Temas Año
                   | Sencillo  Nombre Artista Duracion Año deriving (Show)


thriller :: Lanzamiento
thriller = Album "Thriller" "Michael Jackson" ["Wanna be starting Something", "Baby me mine", "This girl is mine", "Thriller", "Beat it", "Billie Jean", "Human nature", "Pretty young thing", "The lady in my life"] 1982

yesterday :: Lanzamiento
yesterday = Sencillo "Yesterday" "The Beatles" 125 1965

esDiscoLargo :: Lanzamiento -> Bool 
esDiscoLargo (Album _ _ temas _) = length temas >= 5
esDiscoLargo _ = False 

esSencilloActual :: Lanzamiento -> Bool
esSencilloActual (Sencillo _ _ _ año) = año >= 2020 
esSencilloActual _ = False  

tracksAlbumMasLargo :: [Lanzamiento] -> Int 
tracksAlbumMasLargo [] = 0
tracksAlbumMasLargo ((Album _ _ temas _):xs) = max (length temas) (tracksAlbumMasLargo xs)
tracksAlbumMasLargo (_:xs) = tracksAlbumMasLargo xs 


data ColaLanzamiento = Vacia | Encolada Lanzamiento ColaLanzamiento deriving (Show)

colaReproduccion :: ColaLanzamiento
colaReproduccion = Encolada thriller (Encolada yesterday Vacia)

albumsDelArtista :: ColaLanzamiento -> String -> ColaLanzamiento
albumsDelArtista Vacia _ = Vacia 
albumsDelArtista (Encolada (Album n artista t a) colaLanzamiento) artistaDado | artista == artistaDado = Encolada (Album n artista t a) (albumsDelArtista colaLanzamiento artistaDado)
                                                                              | otherwise = albumsDelArtista colaLanzamiento artistaDado
albumsDelArtista (Encolada _ cs) a = albumsDelArtista cs a


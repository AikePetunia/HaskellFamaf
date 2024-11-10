type Nombre = String 
type Artista = String 
type Temas = [String]
type Año = Int 
type Duracion = Int 
data Lanzamiento = Album Nombre Artista Temas Año
                  | Sencillo Nombre Artista Duracion Año  deriving (Show)

thriller :: Lanzamiento
thriller = Album "Thriller" "Michael Jackson" ["Thriller", "Wanna be starting something", "Baby me mine", "The girl is mine", "Beat it", "Billie Jean", "Human Nature", "Pretty young thing", "The lady in my life"] 1982

yesterday :: Lanzamiento
yesterday = Sencillo "Yesterday" "The beatles" 125 1965

esDiscoLargo :: Lanzamiento -> Bool 
esDiscoLargo (Album _ _ temas _) = length temas >= 5
esDiscoLargo _ = False 

esSencilloActual :: Lanzamiento -> Bool 
esSencilloActual (Sencillo _ _ _ 2024) = True 
esSencilloActual _ = False 

tracksAlbumMasLargo :: [Lanzamiento] -> Int 
tracksAlbumMasLargo [] = 0
tracksAlbumMasLargo ((Album nombre artista temas año):xs) = max (length temas) (tracksAlbumMasLargo xs)
tracksAlbumMasLargo (_:xs) = tracksAlbumMasLargo xs 

data ColaLanzamiento = Vacia | Encolada Lanzamiento ColaLanzamiento deriving (Show)

colaReproduccion :: ColaLanzamiento
colaReproduccion = Encolada thriller (Encolada yesterday Vacia)

albumsDelArtista :: ColaLanzamiento -> String -> ColaLanzamiento
albumsDelArtista Vacia _ = Vacia 
albumsDelArtista (Encolada (Album nombre artista temas año) cola) nombreBuscado | nombreBuscado == nombre = Encolada (Album nombre artista temas año) (albumsDelArtista cola nombreBuscado)
                                                                                | otherwise = albumsDelArtista cola nombreBuscado
albumsDelArtista (Encolada _ cola) nombreBuscado = albumsDelArtista cola nombreBuscado  
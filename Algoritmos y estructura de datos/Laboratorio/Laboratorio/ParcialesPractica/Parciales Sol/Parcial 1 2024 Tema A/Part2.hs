type Titulo = String
type Megusta = Int -- 0,1,2
data Estado = Reproducido | SinReproducir deriving (Show, Eq)
type Duracion = Int 
data MovieList = SinMovie | Movie Titulo Megusta Estado Duracion MovieList deriving (Show, Eq)

minutosReproducidos :: MovieList -> Megusta -> Duracion
minutosReproducidos SinMovie _ = 0
minutosReproducidos (Movie titulo megusta e duracion movieList) mg | mg <= 2 || mg <= 0 && mg >= megusta = duracion + minutosReproducidos movieList mg    
                                                             | otherwise = minutosReproducidos movieList mg 

listaPeliculas :: MovieList
listaPeliculas = Movie "Movie1" 2 Reproducido 120 (Movie "Hola" 1 Reproducido 122 SinMovie)


estadoDePeli :: Titulo -> MovieList -> Maybe Estado
estadoDePeli t (Movie titulo megusta estado duracion movielist) | t == titulo && estado == Reproducido = Just Reproducido 
                                                                | otherwise = Nothing

{-
ghci> estadoDePeli "Movie1" listaPeliculas 
Just Reproducido
ghci> estadoDePeli "Movie3" listaPeliculas 
Nothing
ghci> estadoDePeli "Mov123ie3" listaPeliculas 
Nothing
ghci> estadoDePeli "Hola" listaPeliculas 
Nothing
-}
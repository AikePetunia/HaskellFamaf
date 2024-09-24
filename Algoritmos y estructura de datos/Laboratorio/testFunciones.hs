type Titulo = String
type Megusta = Int
data Estado = Reproducido | SinReproducir
    deriving Show
type Duracion = Int
data MovieList = SinMovie | Movie Titulo Megusta Estado Duracion MovieList
    deriving Show

condicionmegusta :: Megusta -> Bool
condicionmegusta m  | m < 0 || m > 2 = False
                    | m == 0 = True
                    | m == 1 = True
                    | m == 2 = True


minutosReproducidos :: MovieList -> Megusta -> Duracion
minutosReproducidos (Movie  a m1 b d resto) m2  | condicionmegusta (m1) = minutosReproducidos (Movie  a m1 b d resto) m2
                                                | condicionmegusta (m2) = minutosReproducidos (Movie  a m1 b d resto) m2
                                                | m1 >= m2 = d + minutosReproducidos resto m2
                                                | otherwise = minutosReproducidos resto m2
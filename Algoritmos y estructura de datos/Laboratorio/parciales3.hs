-- Estrella:
data Luminosidad = Supergigante | Gigante | SecuenciaPrincipal | Enana deriving Show
data Temperatura = A | B | F | G | K | M | O deriving Show
type Nombre = String 

-- Planeta: 
data Estructura = Rocoso | Gaseoso deriving Show
type NumSat = Int 
type DistEstrella = Float 

data Astro = Estrella Luminosidad Temperatura Nombre 
            | Planeta Estructura NumSat DistEstrella 
            deriving Show

masSatelites ::  [Astro] -> Int -> [Astro] 
masSatelites [] _ = []
masSatelites ((Planeta a numsat b):as) n | n > numsat = Planeta a numsat b : masSatelites as n
                                        | otherwise = masSatelites as n

masSatelites (_:as) n = masSatelites as n

y :: [Astro]
y = [
    Planeta Rocoso 20 300,
    Planeta Gaseoso 30 220,
    Planeta Gaseoso 123 123]

x :: [Astro]
x = [
    Planeta Rocoso 20 300,
    Planeta Gaseoso 30 220,
    Estrella Gigante A "123"]

instance Ord Eq Astro
    where
        ()


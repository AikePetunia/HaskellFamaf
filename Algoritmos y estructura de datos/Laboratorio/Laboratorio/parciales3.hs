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

{-
instance Ord Astro
    where
        compare (Estrella O _ _) (Estrella B _ _) = compare O B 
        compare (Estrella B _ _) (Estrella A _ _) = compare B A 
        compare (Estrella A _ _) (Estrella F _ _) = compare A F 
        compare (Estrella F _ _) (Estrella G _ _) = compare F G
        compare (Estrella G _ _) (Estrella K _ _) = compare G K 
        compare (Estrella K _ _) (Estrella M _ _) = compare K M

estrellaIgual :: (Luminosidad Temperatura Nombre) -> (Luminosidad Temperatura Nombre) -> Bool 
estrellaIgual (Estrella A t1 n1) (Estrella A t1' n1') = True 
estrellaIgual (Estrella B t1 n1) (Estrella B t1' n1') = True 
estrellaIgual (Estrella F t1 n1) (Estrella F t1' n1') = True 
estrellaIgual (Estrella G t1 n1) (Estrella G t1' n1') = True 
estrellaIgual (Estrella K t1 n1) (Estrella K t1' n1') = True 
estrellaIgual (Estrella M t1 n1) (Estrella M t1' n1') = True 
estrellaIgual (Estrella O t1 n1) (Estrella O t1' n1') = True 
-}




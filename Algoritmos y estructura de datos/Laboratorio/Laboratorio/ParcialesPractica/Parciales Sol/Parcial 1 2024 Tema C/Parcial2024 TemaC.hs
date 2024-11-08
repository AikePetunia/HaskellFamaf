data Color = Azul | Rosa | Amarillo | Marron | Gris | Blanco deriving (Show, Eq)
data Dureza = MuyDura | Dura | Fragil deriving (Show, Eq)
type Peso = Int 
type Precio = Int
data ColorRubi = Sangre | Carmesi deriving (Show, Eq)

data PiedrasPreciosas = Diamante Color Dureza Peso Precio
                        | Esmeralda Dureza Peso Precio
                        | Rubi ColorRubi Precio 
                        | Zafiro Color Precio deriving (Show, Eq)

cuantosDiamantes :: [PiedrasPreciosas] -> Color -> Int
cuantosDiamantes [] n = 0
cuantosDiamantes ((Diamante color _ _ _):xs) cl | color == cl = 1 + cuantosDiamantes xs cl 
                                                | otherwise = cuantosDiamantes xs cl 
cuantosDiamantes _ cl = 0 

listaTest :: [PiedrasPreciosas]
listaTest = [Diamante Amarillo Dura 20 10, Diamante Rosa Dura 20 20, Diamante Marron Dura 20 20, Diamante Blanco Dura 20 20]

{-
ghci> cuantosDiamantes listaTest Rosa
1
ghci> cuantosDiamantes listaTest Amarillo 
1
-}

hayDosDistintas :: [PiedrasPreciosas] -> Bool 
hayDosDistintas [] = True 
hayDosDistintas (x:y:xs) | x /= y = hayDosDistintas xs 
                         | otherwise = False 


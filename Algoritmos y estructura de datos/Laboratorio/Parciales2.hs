
--Globales:

type Precio = Int -- TODAS
type Peso = Int -- Diamante, Esmeralda

data Dureza = MuyDura | Dura | Fragil deriving Show -- Diamante, Esmeralda

data Color = Azul | Rosa | Amarillo | Marron | Gris | Blanco deriving Show -- Diamante y zafiro

data ColorRubi = Sangre | Carmesi  deriving Show -- Rubi 

data PiedrasPreciosas = Diamante Color Dureza Peso Precio 
                | Esmeralda Dureza Peso Precio 
                | Rubi ColorRubi Precio
                | Zafiro Color Precio 
            deriving Show 

cuantosDiamantes :: [PiedrasPreciosas] -> Color -> Int
cuantosDiamantes [] _ = 0 
cuantosDiamantes ((Diamante Azul _ _ _):xs) Azul = 1 + cuantosDiamantes xs Azul  
cuantosDiamantes ((Diamante Rosa _ _ _):xs)Rosa = 1 + cuantosDiamantes xs Rosa  
cuantosDiamantes ((Diamante Amarillo _ _ _):xs) Amarillo = 1 + cuantosDiamantes xs Amarillo  
cuantosDiamantes ((Diamante Marron _ _ _):xs) Marron = 1 + cuantosDiamantes xs Marron  
cuantosDiamantes ((Diamante Gris _ _ _):xs) Gris = 1 + cuantosDiamantes xs Gris  
cuantosDiamantes ((Diamante Blanco _ _ _):xs) Blanco = 1 + cuantosDiamantes xs Blanco  
cuantosDiamantes (_:xs) n = cuantosDiamantes xs n

y :: [PiedrasPreciosas]
y = [
    Diamante Azul MuyDura 10 20,
    Diamante Azul MuyDura 10 20,
    Diamante Azul MuyDura 10 20]


z :: [PiedrasPreciosas]
z = [
    Diamante Rosa MuyDura 102 20,
    Diamante Rosa MuyDura 10 210,
    Diamante Rosa Fragil 103 214]
    

x :: [PiedrasPreciosas]
x = [
    Diamante Gris MuyDura 130 20,
    Diamante Gris Dura 120 210,
    Diamante Rosa Dura 110 214]
    

instance Eq PiedrasPreciosas 
    where 
    (Diamante _ _ precio peso) == (Diamante _ _ precio' peso') = 
        eqDiamante (precio, peso) (precio', peso')
    (Esmeralda dureza _ precio) == (Esmeralda dureza' _ precio') = 
        eqEsmeralda (dureza, precio) (dureza', precio')
    (Rubi _ precio) == (Rubi _ precio') = 
        eqRubies precio precio'
    (Zafiro color precio) == (Zafiro color' precio') = 
       eqZafiros (color, precio) (color', precio')
    _ == _ = False

eqDiamante :: (Precio, Peso) -> (Precio, Peso) -> Bool
eqDiamante (precio, peso) (precio', peso') = True 

eqEsmeralda :: (Dureza, Precio) -> (Dureza, Precio) -> Bool 
eqEsmeralda (MuyDura, precio) (MuyDura, precio') = True
eqEsmeralda (Dura, precio) (Dura, precio') = True
eqEsmeralda (Fragil, precio) (Fragil, precio') = True

eqRubies :: Precio -> Precio -> Bool 
eqRubies precio precio' = precio == precio'

eqZafiros :: (Color, Precio) -> (Color, Precio) -> Bool
eqZafiros (Azul, precio) (Azul, precio') = True 
eqZafiros (Rosa, precio) (Rosa, precio') = True
eqZafiros (Amarillo, precio) (Amarillo, precio') = True
eqZafiros (Marron, precio) (Marron, precio') = True
eqZafiros (Gris, precio) (Gris, precio') = True
eqZafiros (Blanco, precio) (Blanco, precio') = True

--d)

hayDosDistintas :: [PiedrasPreciosas] -> Bool
hayDosDistintas [] = False 
hayDosDistintas (y:(x:xs)) | x /= y = True 
                           | otherwise = False

--2)

type NombreApellido = String  
type Estado1 = Int 
type Estado2 = Int 
type Estado3 = Int 

data Raza = Pastor | Labrador | Golden | Siveriano | Otro deriving Show

data EstadoMascotas = NoHayMascotas 
                    | EvolucionMascota NombreApellido Raza Estado1 Estado2 Estado3 EstadoMascotas deriving Show

deAltaoNo :: EstadoMascotas -> Bool 

deAltaoNo (EvolucionMascota _ Golden e1 e2 e3 _) 
    | e1 < 1 || e1 > 10 || e2 < 1 || e2 > 10 || e3 < 1 || e3 > 10 = error "Los estados deben estar entre 1 y 10"
    | e1 > 7 && e2 > 7 && e3 > 7 && e1 < 6 && e2 < 6  && e3 < 6 = True
    | otherwise = False

deAltaoNo (EvolucionMascota _ Siveriano e1 e2 e3 _) 
    | e1 < 1 || e1 > 10 || e2 < 1 || e2 > 10 || e3 < 1 || e3 > 10 = error "Los estados deben estar entre 1 y 10"
    | e1 > 7 || e2 > 7 || e3 > 7 && e1 > 6 && e2 > 6  && e3 > 6 = True
    | otherwise = False

deAltaoNo (EvolucionMascota _ Pastor e1 e2 e3 _) 
    | e1 < 1 || e1 > 10 || e2 < 1 || e2 > 10 || e3 < 1 || e3 > 10 = error "Los estados deben estar entre 1 y 10"
    | e1 > 7 && e2 > 7 && e3 > 7  = True
    | otherwise = False

deAltaoNo (EvolucionMascota _ Labrador e1 e2 e3 _) 
    | e1 < 1 || e1 > 10 || e2 < 1 || e2 > 10 || e3 < 1 || e3 > 10 = error "Los estados deben estar entre 1 y 10"
    | e1 > 8 && e2 > 8 && e3 > 8 = True
    | otherwise = False

deAltaoNo (EvolucionMascota _ Otro e1 e2 e3 _) 
    | e1 < 1 || e1 > 10 || e2 < 1 || e2 > 10 || e3 < 1 || e3 > 10 = error "Los estados deben estar entre 1 y 10"
    | e1 > 8 && e2 > 8 && e3 > 8 = True
    | otherwise = False

deAltaoNo NoHayMascotas = False

seVaALaCasa :: EstadoMascotas -> String -> Bool
seVaALaCasa (EvolucionMascota nombreApellido raza e1 e2 e3 cola) nombreBuscado | nombreApellido == nombreBuscado = deAltaoNo cola 
                                                                         | otherwise = deAltaoNo cola 

estado :: EstadoMascotas
estado = EvolucionMascota "Firulais" Golden 8 9 10 (EvolucionMascota "Luna" Labrador 6 7 8 (EvolucionMascota "Max" Pastor 5 6 9 NoHayMascotas))

--seVaALaCasa estado "Luna" 

devolverMejorEstado :: EstadoMascotas -> String -> Maybe Int
devolverMejorEstado _ nombreBuscado = Nothing  
devolverMejorEstado (EvolucionMascota nombreApellido raza e1 e2 e3 cola) nombreBuscado | nombreApellido == nombreBuscado = Just (max e1 (max e2 e3)) 
                                                                                       | otherwise = devolverMejorEstado cola nombreBuscado  

estado2 = EvolucionMascota "Firulais" Golden 8 6 9 (EvolucionMascota "Luna" Labrador 5 7 6 (EvolucionMascota "Max" Pastor 10 9 8 NoHayMascotas))

{-
devolverMejorEstado estado2 "Luna"  
devolverMejorEstado estado2 "Max"     
devolverMejorEstado estado2 "Firulais" 
devolverMejorEstado estado2 "Rex"     
-}
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

devolverMejorEstado :: EstadoMascotas -> String -> Maybe Int
devolverMejorEstado _ nombreBuscado = Nothing  
devolverMejorEstado (EvolucionMascota nombreApellido raza e1 e2 e3 cola) nombreBuscado | nombreApellido == nombreBuscado = Just (max e1 (max e2 e3)) 
                                                                                       | otherwise = devolverMejorEstado cola nombreBuscado  

estado2 = EvolucionMascota "Firulais" Golden 8 6 9 (EvolucionMascota "Luna" Labrador 5 7 6 (EvolucionMascota "Max" Pastor 10 9 8 NoHayMascotas))

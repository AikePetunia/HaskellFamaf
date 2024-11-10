type Altura = Int 
type CantidadHojas = Int 
type EdadMeses = Int 
data EstadoHojas = MuchasQuemadas | PocasQuemadas | Saludables deriving (Ord, Eq, Show)

data RegistroPlanta = NoDato | DataPlanta EstadoHojas Altura CantidadHojas EdadMeses RegistroPlanta  deriving (Ord, Eq, Show)

condicion :: RegistroPlanta -> Bool 
condicion (DataPlanta estadoHojas altura cantidadHojas _ registroPlanta) | estadoHojas == PocasQuemadas || estadoHojas == Saludables && altura > 40 = True 
                                                                           | estadoHojas == MuchasQuemadas && cantidadHojas < 10 = False 
                                                                           | otherwise = condicion registroPlanta 

trasPlantar :: RegistroPlanta -> Int -> Bool 
trasPlantar NoDato n = False 
trasPlantar (DataPlanta _ _ _ edadMeses registroPlanta) n | edadMeses > n = True 
                                             | otherwise = trasPlantar registroPlanta n 

devolverEstado :: RegistroPlanta -> Int -> Maybe EstadoHojas 
devolverEstado NoDato n = Nothing 
devolverEstado (DataPlanta estadoHojas altura cantidadHojas edadMeses registroPlanta) n | trasPlantar registroPlanta n = Just estadoHojas
                                                                                        | otherwise = devolverEstado registroPlanta n 

-- Registro de plantas completo
registroPlantas :: RegistroPlanta
registroPlantas = DataPlanta MuchasQuemadas 35 12 3
                    (DataPlanta Saludables 25 8 24
                        (DataPlanta MuchasQuemadas 30 5 18
                            (DataPlanta PocasQuemadas 45 15 12
                                (DataPlanta Saludables 50 20 5 NoDato))))

{-
ghci> devolverEstado registroPlantas 2
Just MuchasQuemadas
ghci> devolverEstado registroPlantas 3
Just MuchasQuemadas
ghci> devolverEstado registroPlantas 40
Nothing
ghci> trasPlantar registroPlantas 30
False
ghci> trasPlantar registroPlantas 1
True
ghci> trasPlantar registroPlantas 20
True
ghci> condicion registroPlantas 
False
ghci> 
-}
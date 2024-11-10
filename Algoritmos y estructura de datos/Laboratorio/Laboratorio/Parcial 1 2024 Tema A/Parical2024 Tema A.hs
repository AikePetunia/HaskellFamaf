data Categoria = Bulbosas | Rosales | Frutales | Trepadoras deriving (Show, Eq)
data Floracion = Primavera | Verano | Invierno deriving (Show, Eq)
data TipoSemilla = Flores | Hortalizas | Aromaticas deriving (Show, Eq)
data Material = Plastico | Barro  deriving (Show, Eq)
type Hoja = String
type Precio = Int

data ProductosVivero = Planta Categoria Floracion Hoja Precio
            | Semilla TipoSemilla Hoja Precio
            | Maceta Material Precio deriving (Show, Eq) --Se que no va Eq, pero no voy a definir las igualdades

cuantasPlantas :: [ProductosVivero] -> Categoria -> Int
cuantasPlantas [] c = 0
cuantasPlantas ((Planta Bulbosas _ _ _ ):xs) Bulbosas = 1 + cuantasPlantas xs Bulbosas
cuantasPlantas ((Planta Rosales _ _ _ ):xs) Rosales = 1 + cuantasPlantas xs Rosales
cuantasPlantas ((Planta Frutales _ _ _ ):xs) Frutales = 1 + cuantasPlantas xs Frutales
cuantasPlantas ((Planta Trepadoras _ _ _ ):xs) Trepadoras = 1 + cuantasPlantas xs Trepadoras
cuantasPlantas (_:xs) c = cuantasPlantas xs c

hayDosIguales :: [ProductosVivero] -> Bool
hayDosIguales [] = False
hayDosIguales (((Planta c1 fl h p):(Planta c1' fl' h' p'):xs)) = Planta c1 fl h p == Planta c1' fl' h' p'
hayDosIguales (((Semilla t h p):(Semilla t' h' p'):xs)) = Semilla t h p == Semilla t' h' p'
hayDosIguales (((Maceta m p):(Maceta m' p'):xs)) = Maceta m p == Maceta m' p'

--Ej 2


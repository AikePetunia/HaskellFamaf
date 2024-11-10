
data Dias = Lunes | Martes | Miercoles | Jueves | Vienes | Sabado | Domingo deriving (Eq, Show)
data Billetera = PersonalPay | Uala | BnaMas | NaranjaX deriving Show
data Categoria = Combustible | Supermercado | ComidaRapida deriving Show
type TopeDescuento = Int
type PorcDescuento = Int
type MontoReintegro = Int

data Ahorro = Descuento Billetera Categoria PorcDescuento TopeDescuento Dias  
            | Reintegro Billetera Categoria MontoReintegro deriving Show

naftaPP :: Ahorro
naftaPP = Descuento PersonalPay Combustible 25 2500 Lunes
naftaPP2 :: Ahorro
naftaPP2 = Descuento PersonalPay Combustible 25 2500 Martes

macNX :: Ahorro
macNX = Reintegro NaranjaX ComidaRapida 3000

hayDescuentoDia :: Ahorro -> Dias -> Bool
hayDescuentoDia (Descuento _ _ _ _ Lunes) Lunes = True
hayDescuentoDia (Descuento _ _ _ _ Martes) Martes = True
hayDescuentoDia (Descuento _ _ _ _ Miercoles) Miercoles = True
hayDescuentoDia (Descuento _ _ _ _ Jueves) Jueves = True
hayDescuentoDia (Descuento _ _ _ _ Vienes) Vienes = True
hayDescuentoDia (Descuento _ _ _ _ Sabado) Sabado = True
hayDescuentoDia (Descuento _ _ _ _ Domingo) Domingo = True
hayDescuentoDia _ _ = False

{-
ghci> hayDescuentoDia (Descuento Uala Combustible 20 20 Lunes) Lunes
True
ghci> hayDescuentoDia (Reintegro Uala Combustible 20) Lunes
False
ghci> 
-}

esDescuentoCombustible :: Ahorro -> Bool
esDescuentoCombustible (Descuento _ Combustible _ _ _) = True
esDescuentoCombustible _ = False

mayorDescuentoOReintegro :: [Ahorro] -> Int
mayorDescuentoOReintegro [] = 0
mayorDescuentoOReintegro (x:xs) = 
    case x of
        Descuento _ _ porc _ _ -> max porc (mayorDescuentoOReintegro xs)
        Reintegro _ _ monto    -> max monto (mayorDescuentoOReintegro xs)

{-
ghci> mayorDescuentoOReintegro [(Descuento Uala Combustible 100 10 Lunes), (Reintegro Uala Combustible 1000)]
1000
-}

data ColaAhorro = NoHayAhorro | AgregarAhorro Ahorro ColaAhorro deriving Show


ahorrosMaria :: ColaAhorro
ahorrosMaria = AgregarAhorro naftaPP (AgregarAhorro macNX NoHayAhorro)

-- para testear, hago ahorrosCombustible ahorrosMaria 

esDescuentoCombustible1 :: Ahorro -> Bool
esDescuentoCombustible1 (Descuento _ Combustible _ _ _) = True
esDescuentoCombustible1 (Reintegro _ Combustible _) = True
esDescuentoCombustible1 _ = False

-- Función recursiva para filtrar la cola
ahorrosCombustible :: ColaAhorro -> ColaAhorro
ahorrosCombustible NoHayAhorro = NoHayAhorro  -- Caso base: si no hay ahorros, retornamos NoHayAhorro
ahorrosCombustible (AgregarAhorro ahorro cola)
    | esDescuentoCombustible1 ahorro = AgregarAhorro ahorro (ahorrosCombustible cola)  -- Si es combustible, lo mantenemos
    | otherwise = ahorrosCombustible cola  -- Si no es combustible, lo descartamos

{-
ghci> ahorrosCombustible ahorrosMaria 
AgregarAhorro (Descuento PersonalPay Combustible 25 2500 Lunes) NoHayAhorro
-}
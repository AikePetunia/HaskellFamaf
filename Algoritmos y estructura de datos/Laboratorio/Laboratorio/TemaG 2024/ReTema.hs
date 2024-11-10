data Dia = Lunes | Martes | Miercoles | Jueves | Viernes | Sabado | Domingo deriving (Show, Eq)
data Billetera = PersonalPay | Uala | BnaMas | NaranjaX deriving (Show, Eq)
data Categoria = Combustible | Supermercado | ComidaRapida deriving (Show, Eq)
type TopeDescuento = Int
type PorcDescuento = Int
type MontoReintegro = Int

data Ahorro = Descuento Billetera Categoria PorcDescuento TopeDescuento Dia  
            | Reintegro Billetera Categoria MontoReintegro deriving (Show, Eq)

naftaPP :: Ahorro
naftaPP = Descuento PersonalPay Combustible 25 2500 Lunes
naftaPP2 :: Ahorro
naftaPP2 = Descuento PersonalPay Combustible 25 2500 Martes

hayDescuentoDia :: Ahorro -> Dia -> Bool 
hayDescuentoDia (Descuento _ _ _ _ Lunes) Lunes = True 
hayDescuentoDia (Descuento _ _ _ _ Martes) Martes = True 
hayDescuentoDia (Descuento _ _ _ _ Miercoles) Miercoles = True 
hayDescuentoDia (Descuento _ _ _ _ Jueves) Jueves = True 
hayDescuentoDia (Descuento _ _ _ _ Viernes) Viernes = True 
hayDescuentoDia (Descuento _ _ _ _ Sabado) Sabado = True 
hayDescuentoDia (Descuento _ _ _ _ Domingo) Domingo = True 
hayDescuentoDia _ _ = False 

esDescuentoCombustible :: Ahorro -> Bool
esDescuentoCombustible (Descuento _ categoria _ _ _) = categoria == Combustible 
esDescuentoCombustible _ = False 

mayorDescuentoOReintegro :: [Ahorro] -> Int 
mayorDescuentoOReintegro [] = 0
mayorDescuentoOReintegro ((Descuento _ _ porcDescuento _ _):xs) = max porcDescuento( mayorDescuentoOReintegro xs )
mayorDescuentoOReintegro ((Reintegro _ _ montoReintegro):xs) = max montoReintegro( mayorDescuentoOReintegro xs )


data ColaAhorro = NoHayAhorro | AgregarAhorro Ahorro ColaAhorro deriving Show


ahorrosMaria :: ColaAhorro
ahorrosMaria = AgregarAhorro naftaPP (AgregarAhorro naftaPP2 NoHayAhorro)

-- para testear, hago ahorrosCombustible ahorrosMaria 

ahorrosCombustible :: ColaAhorro -> ColaAhorro 
ahorrosCombustible NoHayAhorro = NoHayAhorro 
ahorrosCombustible (AgregarAhorro (Descuento n Combustible pd td d) cola) = AgregarAhorro (Descuento n Combustible pd td d) (ahorrosCombustible cola)
ahorrosCombustible (AgregarAhorro _ cola) = ahorrosCombustible cola
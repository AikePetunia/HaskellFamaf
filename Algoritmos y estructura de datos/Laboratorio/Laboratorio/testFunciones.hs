
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

data ColaAhorro = NoHayAhorro | AgregarAhorro Ahorro ColaAhorro deriving Show


ahorrosMaria :: ColaAhorro
ahorrosMaria = AgregarAhorro naftaPP (AgregarAhorro macNX NoHayAhorro)

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
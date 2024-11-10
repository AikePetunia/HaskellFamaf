--1
data Nombre = PersonalPay | Uala | BnaMas | NaranjaX deriving Show
data Categoria = Combustible | Supermercado | ComidaRapida deriving Show
type MontoDescuento = Int
type MontoReintegro = Int
type MesDescuento = Int
type Concepto = String

data Ahorro = Descuento Nombre Categoria MontoDescuento MesDescuento
            | Reintegro Nombre Concepto MontoReintegro deriving Show

--2

supermercadoUa :: Ahorro
supermercadoUa = Descuento Uala Combustible 30 1 

premioBna :: Ahorro
premioBna = Reintegro BnaMas "Premio" 3000

esReintegro :: Ahorro -> String -> Bool
esReintegro (Reintegro Uala _ _) uala = True 
esReintegro (Reintegro PersonalPay _ _) personalPay = True 
esReintegro (Reintegro BnaMas _ _) bnaMas = True 
esReintegro (Reintegro NaranjaX _ _) naranjaX = True 
esReintegro _ _ = False

esDescuentoPrimavera :: Ahorro -> Bool 
esDescuentoPrimavera (Descuento _ _ _ 9) = True 
esDescuentoPrimavera (Descuento _ _ _ 10) = True 
esDescuentoPrimavera (Descuento _ _ _ 11) = True 
esDescuentoPrimavera _ = False 

data ColaAhorro = NoHayAhorro | AgregarAhorro Ahorro ColaAhorro deriving Show

ahorrosJuan :: ColaAhorro
ahorrosJuan = AgregarAhorro supermercadoUa (AgregarAhorro premioBna NoHayAhorro)

buenosAhorros :: ColaAhorro -> ColaAhorro
buenosAhorros NoHayAhorro = NoHayAhorro
buenosAhorros (AgregarAhorro ahorro cola)
    | montoAhorro ahorro > 5000 = AgregarAhorro ahorro (buenosAhorros cola)
    | otherwise = buenosAhorros cola

-- Función auxiliar para obtener el monto de un Ahorro
montoAhorro :: Ahorro -> Int
montoAhorro (Descuento _ _ monto _) = monto
montoAhorro (Reintegro _ _ monto) = monto
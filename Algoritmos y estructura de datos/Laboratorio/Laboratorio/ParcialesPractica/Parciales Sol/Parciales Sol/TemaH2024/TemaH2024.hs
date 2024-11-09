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
esReintegro (Reintegro nombre _ _) b = b == nombre 
esReintegro _ _ = False

{-
ghci> esReintegro  (Reintegro Uala "Abc" 200) Uala
True
ghci> esReintegro  (Reintegro Uala "Abc" 200) BnaMas
False
-}

esDescuentoPrimavera :: Ahorro -> Bool 
esDescuentoPrimavera (Descuento _ _ _ 9) = True
esDescuentoPrimavera (Descuento _ _ _ 10) = True
esDescuentoPrimavera (Descuento _ _ _ 11) = True
esDescuentoPrimavera _ = False 

{-
ghci> esDescuentoPrimavera (Descuento Uala Supermercado 300 10)
True
ghci> esDescuentoPrimavera (Descuento Uala Supermercado 300 2)
False
-}

totalDecuentosMes :: [Ahorro] -> Int -> Int
totalDecuentosMes (x:xs) n = 0
totalDecuentosMes ((Descuento _ _ monto mes):xs) mesDado
    | mes == mesDado = monto + totalDecuentosMes xs mesDado  -- Si el mes coincide, suma el monto
    | otherwise      = totalDecuentosMes xs mesDado          -- Si no coincide, sigue con el resto
totalDecuentosMes (_:xs) mesDado = totalDecuentosMes xs mesDado  -- Ignora si no es un Descuento

{-
ghci> totalDecuentosMes [(Descuento Uala Supermercado 13100 10), (Descuento BnaMas ComidaRapida 20331230 10)] 11
0
ghci> totalDecuentosMes [(Descuento Uala Supermercado 13100 10), (Descuento BnaMas ComidaRapida 20331230 10)] 10
20344330
ghci> 
-}

data Ahorro = Descuento Nombre Categoria MontoDescuento MesDescuento
            | Reintegro Nombre Concepto MontoReintegro deriving (Show, Eq)


buenosAhorros :: ColaAhorro -> ColaAhorro
buenosAhorros NoHayAhorro = NoHayAhorro
buenosAhorros (AgregarAhorro ahorro cola)
    | montoAhorro ahorro > 5000 = AgregarAhorro ahorro (buenosAhorros cola)
    | otherwise = buenosAhorros cola

-- Función auxiliar para obtener el monto de un Ahorro
montoAhorro :: Ahorro -> Int
montoAhorro (Descuento _ _ monto _) = monto
montoAhorro (Reintegro _ _ monto) = monto

y::ColaAhorro
y = AgregarAhorro (Descuento BnaMas Supermercado 1500 10) 
                            (AgregarAhorro (Reintegro PersonalPay "Compra" 500) NoHayAhorro)

--chekiada !
--para probar:
-- buenosAhorros y
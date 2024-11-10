data TipoMaceta = Terracota | FibroCemento | Plastico 
data Forma = Cuadrada | Redonda 
data TipoSemilla = Hortalizas | Aromaticas | Cesped 
data Agua = MuyResistente | Resistente | NadaResistente 
data Ubicacion = Exterior | Interior 
data TipoPlanta = PlenoSol | MediaSombra | Floral | Frutal 
type Precio = Int 
type Peso = Int 
data ProductoDevivero = Planta TipoPlanta Ubicacion Agua Precio 
                       | BolsaSemilla  TipoSemilla Peso Precio
                       | Maceta TipoMaceta Forma Precio

cuantasPlantas :: [ProductoDevivero] -> TipoPlanta -> Int
cuantasPlantas [] tp = 0
cuantasPlantas ((Planta PlenoSol _ _ _):xs) PlenoSol = 1 + cuantasPlantas xs PlenoSol
cuantasPlantas ((Planta MediaSombra _ _ _):xs) MediaSombra = 1 + cuantasPlantas xs MediaSombra
cuantasPlantas ((Planta Floral _ _ _):xs) Floral = 1 + cuantasPlantas xs Floral
cuantasPlantas ((Planta Frutal _ _ _):xs) Frutal = 1 + cuantasPlantas xs Frutal
cuantasPlantas (_:xs) tp = cuantasPlantas xs tp 

-- Lista de productos de vivero para probar
productos :: [ProductoDevivero]
productos = [
    Planta PlenoSol Exterior MuyResistente 500,
    Planta MediaSombra Interior Resistente 300,
    Planta Floral Exterior NadaResistente 450,
    Planta Frutal Exterior MuyResistente 600,
    Planta PlenoSol Interior Resistente 520,
    BolsaSemilla Hortalizas 200 100,
    Maceta Terracota Cuadrada 150,
    Planta PlenoSol Exterior Resistente 490,
    BolsaSemilla Aromaticas 100 80,
    Planta Frutal Interior Resistente 550
    ]
{-
ghci> cuantasPlantas productos Frutal 
2
ghci> cuantasPlantas productos Floral 
1
ghci> cuantasPlantas productos MediaSombra 
1
ghci> cuantasPlantas productos PlenoSol 
3
ghci> 
-}
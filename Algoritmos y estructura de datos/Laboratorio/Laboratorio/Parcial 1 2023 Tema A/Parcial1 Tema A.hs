data TipoLadrillo = Ceramico | Hormigon | Tradicional 
data UsoDeLadrillo = Pared | Techo 
data MaterialViga = Hierro | Madera 
data MarcaCemento = Minetti | LomaNegra 
type Precio = Int 
type Largo = Float  
data MaterialesConstruccion = Ladrillo TipoLadrillo UsoDeLadrillo Precio
                            | Vigueta Largo MaterialViga Precio
                            | Cemento MarcaCemento Precio

ladrillosDeMenorPrecio :: [MaterialesConstruccion] -> Int -> [MaterialesConstruccion]
ladrillosDeMenorPrecio [] n = []
ladrillosDeMenorPrecio ((Ladrillo tipoLadrillo usoDeLadrillo precio):xs) n | precio <= n = Ladrillo tipoLadrillo usoDeLadrillo precio : ladrillosDeMenorPrecio xs n 
                                                                           | otherwise = ladrillosDeMenorPrecio xs n 
ladrillosDeMenorPrecio (_:xs) n = ladrillosDeMenorPrecio xs n 
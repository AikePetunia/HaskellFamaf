type Precio = Int 
type Peso = Int 
data TipoDeLeche = Descremada | Entera | Condenzada | Polvo 
data Corte = Bife | Molida | Pulpa 
data TipoDeQueso = Barra | Cremoso | Duro 
data UsoDeLeche = Bebida | Preparaciones 
data Perecedero = Leche TipoDeLeche UsoDeLeche Precio
                | Carne Corte Peso Precio 
                | Queso TipoDeQueso Peso Precio  

cuantosQuesos :: [Perecedero] -> TipoDeQueso -> Int 
cuantosQuesos [] tq = 0 
cuantosQuesos ((Queso Barra _ _ ):xs) Barra = 1 + cuantosQuesos xs Barra 
cuantosQuesos ((Queso Cremoso _ _ ):xs) Cremoso = 1 + cuantosQuesos xs Cremoso 
cuantosQuesos ((Queso Duro _ _ ):xs) Duro = 1 + cuantosQuesos xs Duro 
cuantosQuesos (_:xs) tq = cuantosQuesos xs tq 

-- Lista de productos perecederos
productosPerecederos :: [Perecedero]
productosPerecederos = [
    Queso Barra 500 300,
    Carne Molida 1000 800,
    Queso Cremoso 400 250,
    Leche Entera Bebida 100,
    Queso Duro 600 350,
    Queso Duro 300 200,
    Leche Descremada Bebida 90,
    Queso Duro 450 280,
    Carne Bife 800 750,
    Queso Duro 550 340
    ]

{-
ghci> cuantosQuesos product
product               productosPerecederos
ghci> cuantosQuesos productosPerecederos  Cremoso
2
ghci> cuantosQuesos productosPerecederos Barra
2
ghci> cuantosQuesos productosPerecederos Duro
2
ghci> :r
[1 of 2] Compiling Main             ( testFunciones.hs, interpreted ) [Source file changed]
Ok, one module loaded.
ghci> 
ghci> cuantosQuesos productosPerecederos Duro
4
ghci> 
-}
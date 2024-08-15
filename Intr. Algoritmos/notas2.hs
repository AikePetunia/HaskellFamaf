{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use even" #-}
module Main where
main :: IO ()
main = putStrLn "Iniciando prueba!"

-- -----------------------------------------------------------------------
-- --------------INFORMACION RELEVANTE------------------------------------
-- -----------------------------------------------------------------------

-- mauricio.tellechea@unc.edu.ar --> Profe principial
-- imoretti@unc.edu.ar --> Profe de los lunes

-- -----------------------------------------------------------------------
-- --------------MIERCOLES 13 DE MARZO------------------------------------
-- -----------------------------------------------------------------------

cuadrado_viejo:: Int -> Int
cuadrado_viejo x = x*x

sumatoria :: Int -> Int -> Int
sumatoria x y = x+y

 -- Ejercicio 14 de la guia 1 de Intro a Algoritmos
promedio :: Double -> Double -> Double
promedio x y = (x + y) / 2

promedio2 :: Int -> Int -> Int
promedio2 x y = (x + y) `div` 2

  -- Estas funciones son alternativas a la interior, con la diferencia que cada una sería un subconjunto de la funcion "promedio"
  --Double y Float se diferencian entre si en la precision y espacio de memoria que ocupa cada valor
promedioAlt :: Double -> Double ->Double
promedioAlt x y = (x + y) / 2
promedioAlt2 :: Float -> Float  ->Float 
promedioAlt2 x y = (x + y) / 2
  --siendo Float la menos precisa, pero la que utiliza menos recursos

-- -----------------------------------------------------------------------
-- ------------DOMINGO 17 DE MARZO----------------------------------------
-- -----------------------------------------------------------------------

square :: Num a => a -> a
square x = x*x

doubleMe :: Num a => a -> a
doubleMe x = x + x

doubleUs :: Num a => a -> a -> a
doubleUs x y = doubleMe x + doubleMe y

-- --------------------------------------------------

doubleSmallNumber :: (Ord a, Num a) => a -> a
doubleSmallNumber x = if x > 100
                        then x 
                        else x*2

doubleSmallNumber' :: (Ord a, Num a) => a -> a
doubleSmallNumber' x = (if x > 100 then x else x*2) + 1

-- -----------------------------------------------------------------------
-- ------------ULUNES 18 DE MARZO----------------------------------------
-- -----------------------------------------------------------------------

-- Ejemplo de funcion por casos
sgn :: Int -> Int
sgn x | x>0 = 1
      | x<0 = -1
      | x==0 = 0

-- Ejercicio 18 ----------------------------

entre0y9 :: Int -> Bool
entre0y9 x | x < 0 || x > 9 = False
            | x > 0 && x < 9 = True
            
rangoPrecio :: Int -> String
rangoPrecio x | x > 0 && x < 2000 = "muy barato"
              | x > 2000 && x < 5000 = "hay que verlo bien"
              | x > 5000 = "demasiado caro"
              | x < 0 = "esto no puede ser!"

absoluto :: Int -> Int
absoluto x | x < 0 = x - x*2
            | x > 0 = x
            | x == 0 = 0

esMultiplo2 :: Int -> Bool
esMultiplo2 x 
      | x `mod` 2 == 0 = True
      | otherwise = False
              
-- Ejercicio 19 ----------------------------

esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y | y `mod` x == 0 = True
                  |otherwise = False
      
-- Ejercicio 20 ----------------------------

esBiciesto :: Int -> Bool
esBiciesto x | (x `mod` 400 == 0 || x `mod` 4 == 0) && x`mod`100 /= 0 = True
              |otherwise = False

-- Ejercicio 21 ----------------------------

dispersion :: Int -> Int -> Int -> Int
dispersion x y z = ((x `max` y) `max` z) - ((x `min` y) `min` z)

-- Ejercicio 22 ----------------------------
celsiusToFahr :: Int -> Int
celsiusToFahr x = ((x*18) + 320) `div` 10

--                                                                                          ----------------------------
--                                                                                          "cat" [Nombre de archivo.hs] permite ver el contenido del archivo
--                                                                                          ----------------------------

-- Ejercicio 23 ----------------------------
fahrToCelsius :: Double -> Double
fahrToCelsius x = ((x-32)*10) / 18

-- Ejercicio 24 ----------------------------
haceFrioF :: Double -> Bool
haceFrioF x  | (((x-32)*10)/ 18) < 8 = True
              |otherwise = False

-- Ejercicio 25.a ----------------------------
segundo3 :: (Double,Double,Double) -> Double
segundo3 (x,y,z) = y

-- Ejercicio 25.b ----------------------------
-- Controlado por el profe -------------------
--                                                                                           -- El Double permite trabajar con enteros y fraccionales a la vez
ordena :: (Double,Double) -> (Double,Double)
ordena (x,y) = (x`min`y,x`max`y)

-- Ejercicio 25.c ----------------------------
rangoPrecioParametrizado :: Double -> (Double,Double) -> String
rangoPrecioParametrizado x (p_bajo,p_alto) | x > (p_bajo`max`p_alto) = "demasiado caro"
                                            | (x < (p_bajo`min`p_alto) && x > 0) = "barato"
                                            | ((x < (p_bajo`max`p_alto))&&(x > (p_bajo`min`p_alto))) = "hay que verlo bien"
                                            | x < 0 = "eso es imposible"

-- Ejercicio 25.d ----------------------------
mayor3 :: (Double,Double,Double) -> (Bool,Bool,Bool)
mayor3 (x,y,z) = (x>3,y>3,z>3)

-- Ejercicio 25.e ----------------------------
todosiguales :: (Double,Double,Double) -> Bool
todosiguales (x,y,z) = x==y && x==z

-- -----------------------------------------------------------------------
-- ------------MIERCOLES 20 DE MARZO--------------------------------------
-- -----------------------------------------------------------------------

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Ejercicio 3a -----------------------------
soloParesNR :: [Int] -> [Int]
soloParesNR lista = filter (\x -> x `mod` 2 == 0) lista


solopares2NR :: [Int] -> [Int]
solopares2NR x = [x | x <- x, x `mod` 2 == 0]


-- Ejercicio 3b -----------------------------
mayoresQue10NR :: [Int] -> [Int]
mayoresQue10NR x = filter (\x -> x > 10) x

-- Ejercicio 3c -----------------------------
mayoresQueNR :: Int -> [Int] -> [Int]
mayoresQueNR valor_filtro x = filter (\x -> x > valor_filtro) x

-- Ejercicio 4a -----------------------------
sumar1NR :: [Int] -> [Int]
sumar1NR x = map (\x -> x + 1) x

-- Ejercicio 4b -----------------------------
duplicaNR :: [Int] ->[Int]
duplicaNR x = map (\x -> x * 2) x

-- Ejercicio 4c -----------------------------
multiplicaNR :: Int -> [Int] -> [Int]
multiplicaNR valor_filtro x = map(\x -> x * valor_filtro) x

-- Ejercicio 5a -----------------------------
todosMenores10NR :: [Int] -> Bool
                        -- acc = accumulator
todosMenores10NR x = foldl(\acc x -> if x > 10 then False else acc) True x

-- Ejercicio 5b -----------------------------
hay0NR :: [Int] -> Bool
hay0NR x = foldl(\acc x -> if x == 0 then True else acc) False x

-- Ejercicio 5c -----------------------------
sum1NR :: [Int] -> Int
sum1NR x = foldl(\acc x -> acc + x) 0 x

-- -----------------------------------------------------------------------
-- ------------LUNES 25 DE MARZO------------------------------------------
-- -----------------------------------------------------------------------

-- Ejercicio 3a -----------------------------
soloPares :: [Int] -> [Int]
soloPares [] = [] 
soloPares (x:xs) | x `mod` 2 == 0 = (x:soloPares xs)
                 |x `mod` 2 == 1 = (soloPares xs)

-- Ejercicio 3b -----------------------------
mayoresQue10 :: [Int] -> [Int]
mayoresQue10 [] = []
mayoresQue10 (x:xs)| x > 10 = (x:mayoresQue10 xs)
                    |otherwise = (mayoresQue10 xs)

-- Ejercicio 3c -----------------------------
mayoresQue :: Int -> [Int] -> [Int]
mayoresQue valor_filtro [] = []
mayoresQue valor_filtro (x:xs) | x > valor_filtro = (x:mayoresQue valor_filtro xs)
                              | otherwise = (mayoresQue valor_filtro xs)

-- Ejercicio 4a -----------------------------
sumar1 :: [Int] -> [Int]
sumar1 [] = []
sumar1 (x:xs) = (x+1:sumar1 xs)

-- Ejercicio 4b -----------------------------
duplica :: [Int] ->[Int]
duplica [] = []
duplica (x:xs) = (x*2:duplica xs)

-- Ejercicio 4c -----------------------------
multiplica :: Int -> [Int] -> [Int]
multiplica valor_filtro [] = []
multiplica valor_filtro (x:xs) = (x*valor_filtro:multiplica valor_filtro xs)

-- Ejercicio 5a -----------------------------
todosMenores10 :: [Int] -> Bool
todosMenores10 [] = True
todosMenores10 (x:xs) | x > 10 = False
                      | x < 10 = (todosMenores10 xs)

-- Ejercicio 5b -----------------------------
hay0 :: [Int] -> Bool
hay0 [] = False
hay0 (x:xs) | x == 0 = True
            | x /= 0 = (hay0 xs)

-- Ejercicio 5c -----------------------------
sum1 :: Num a => [a] -> a
sum1 [] = 0
sum1 (x:xs) = (x+(sum1 xs))

-- Ejercicio 6 -----------------------------
-- Zip function
repartir :: [String] -> [String] -> [(String,String)]
repartir [] [] = []
repartir (x:xs)(y:ys) = ((x,y):repartir xs ys) 

-- Ejercicio 7 -----------------------------
-- Unzip fuction
apellidos :: [(String,String,Int)] -> [String]
apellidos [] = []
apellidos ((x,y,z):xs) = (y:(apellidos (xs)))

-- Ejercicio 8 Lenght -----------------------------
lenghtRecursivo :: [a] -> Int
lenghtRecursivo [] = 0
lenghtRecursivo (x:xs) = (1+lenghtRecursivo xs)

-- Ejercicio 8 !! -----------------------------
ubicacionRec :: (Eq a) => a -> [a] -> Int --MALA INTERPRETACION
ubicacionRec valor_filtro [] = 0
ubicacionRec valor_filtro (x:xs) | (x == valor_filtro) = 0
                                 | otherwise = 1+(ubicacionRec valor_filtro xs)

ubiRec2 :: Int -> [a] -> a      -- RESOLUCION CORRECTISIMA2
ubiRec2 0 (x:xs) = x
ubiRec2 (n) [] | (n>0) = error "Error numero mayor a la cantidad de valores en la lista"
               | (n<0) = error "Error numero inferior a 0"
ubiRec2 n (x:xs) = (ubiRec2 (n-1) xs)
                

-- Ejercicio 8 Take -----------------------------
takeRec :: Int -> [a] -> [a]
takeRec valor_filtro [] = []
takeRec valor_filtro (x:xs) |(valor_filtro>0) = x:takeRec (valor_filtro-1) xs
                            |(valor_filtro<=0) = takeRec (valor_filtro-1) xs 

-- Ejercicio 8 Drop -----------------------------
dropRec :: Int -> [a] -> [a]
dropRec valor_filtro [] = []
dropRec valor_filtro (x:xs) | valor_filtro>0 = dropRec (valor_filtro-1) xs
                            | valor_filtro<=0 = x:xs

-- Ejercicio 8 ++ -----------------------------
concatRec :: (Eq a) => [a] -> [a] -> [a]
concatRec [] ys = ys
concatRec (x:xs) ys = x:(concatRec xs ys)

-- -----------------------------------------------------------------------
-- ------------MIERCOLES 27 DE MARZO--------------------------------------
-- -----------------------------------------------------------------------

-- Ejercicio 9a--------------------------------
maximo :: [Int] -> Int
maximo [] = error "Lista vacia"
maximo [a] = a
maximo (x:y:xs) | y >= x = maximo(y:xs)
                | y < x= maximo (x:xs) 

-- Ejercicio 9b-------------------------------- 
sumaPares :: [(Int,Int)] -> Int
sumaPares [] = 0
sumaPares ((x,y):xs) = (x+y)+sumaPares xs

-- Ejercicio 9c-------------------------------- 
todos0y1 :: [Int] -> Bool
todos0y1 [] = False
todos0y1 [a] |((a == 0 )||(a == 1)) = True
             | otherwise = False
todos0y1 (x:xs) | ((x == 0 )||(x == 1)) = todos0y1(xs)
                | otherwise = False

-- Ejercicio 9d-------------------------------- 
quitar0s :: [Int] -> [Int]
quitar0s [] = []
quitar0s (x:xs) | (x == 0) = quitar0s xs
                | (x/=0) = (x:quitar0s xs)

-- Ejercicio 9e-------------------------------- 
ultimo :: [Int] -> Int
ultimo [] = 0
ultimo [a] = a
ultimo (x:xs) = ultimo xs

-- Ejercicio 9f-------------------------------- 
repetir :: Int -> Int -> [Int]
repetir x 0 = []
repetir x repetidor = x:repetir x (repetidor - 1) 

-- Ejercicio 9g-------------------------------- 
concatlistas :: [[Int]] -> [Int]
concatlistas [] = []
concatlistas ([]:lm) = (concatlistas lm)
concatlistas ((x:xs):lm) = x:concatlistas(xs:lm) 

-- Ejercicio 9h-------------------------------- 
rev :: [a] -> [a]
rev [] = []
rev (x:xs) = (rev xs)++[x]

-- -----------------------------------------------------------------------
-- ------------MIERCOLES 3 DE ABRIL--------------------------------------
-- -----------------------------------------------------------------------

------
pe :: [Int] -> Int
pe [] = 0
pe xs = (((rev xs)!!0)*10^(length xs -1)) + pe (take (length xs -1) xs)

pe1 :: [Int] -> Int
pe1 [] = 0
pe1 (x:xs) = x*10^(lenghtRecursivo xs) + pe1 xs -- Aca "modulizamos"

p2 :: [Int] -> Int
p2 [] = 0
p2 (x:xs) = (p2 xs)*10+x -- Algoritmo de Horner
{--
pe [1,2,3]
[3,2,1]!!0 => 3^
--}

-- -----------------------------------------------------------------------
-- ------------MIERCOLES 8 DE MAYO--------------------------------------
-- -----------------------------------------------------------------------

data Color = Rojo | Amarillo | Azul | Verde 
 deriving (Show,Eq)

data Forma = Triangulo | Cuadrado | Rombo | Circulo
 deriving (Show,Eq)

type Figura = (Forma,Color,Int)

-- Ejercicio 1-------------------------------- 

rojo :: Figura -> Bool
rojo (f,c,t) = c == Rojo

amarillo :: Figura -> Bool
amarillo (f,c,t) = c == Amarillo

azul :: Figura -> Bool
azul (f,c,t) = c == Azul

verde :: Figura -> Bool
verde (f,c,t) = c == Verde

cuadrado :: Figura -> Bool
cuadrado (f,c,t) = f == Cuadrado

circulo :: Figura -> Bool
circulo (f,c,t) = f == Circulo

triangulo :: Figura -> Bool
triangulo (f,c,t) = f == Triangulo

rombo :: Figura -> Bool
rombo (f,c,t) = f == Rombo

-- Ejercicio 2-------------------------------- 

tam :: Figura -> Int
tam (f,c,t) = t

-- Ejercicio 4 -------------------------------- 

propA :: [Figura] -> Bool
propA [ ] = True
propA (x : xs) = rojo x && propA xs

propB :: [Figura] -> Bool
propB [] = True
propB (x:xs) = (tam x) < 5 && propB xs 

propC :: [Figura] -> Bool
propC [] = True
propC (x:xs) | (triangulo x == True) && (rojo x == True) = propC xs
             | (triangulo x == True) && (rojo x == False) = False
             | otherwise = propC xs

propCv2 :: [Figura] -> Bool
propCv2 [] = True
propCv2 (x:xs) = (not(triangulo x) || rojo x) && propCv2 xs          -- USO DE CARACTERIZACION DE -> -----------

propD :: [Figura] -> Bool
propD [] = False
propD (x:xs) | cuadrado x && verde x = True
             |otherwise = propD xs

propDv2 :: [Figura] -> Bool
propDv2 [] = False
propDv2 (x:xs) = (cuadrado x && verde x) || propDv2 xs
             

propE :: [Figura] -> Bool
propE [] = True
propE (x:xs) |circulo x && (azul x == False) = False 
             |(circulo x && (azul x == True)) && (((tam x) < 10) == False) = False
             |otherwise = propE xs

propEv2 :: [Figura] -> Bool
propEv2 [] = True
propEv2 (x:xs) = (not(circulo x) || (azul x && ((tam x)<10))) && propEv2 xs

propF :: [Figura] -> Bool
propF [] = True
propF (x:xs) | triangulo x && (azul x == True) = False
             | otherwise = propF xs
             
propFv2 :: [Figura] -> Bool
propFv2 [] = True
propFv2 (x:xs) = (not(triangulo x) || not(azul x)) && propFv2 xs

propG :: [Figura] -> Bool
propG [] = True
propG (x:xs) = (not(circulo x) || not(amarillo x || verde x)) && propG xs

propH :: [Figura] -> Bool
propH [] = False
propH (x:xs) | cuadrado x && (tam x)<5 = True
              |otherwise = propH xs

 -- Corregir este punto de debajo ----------------------
propIAntec :: [Figura] -> Bool
propIAntec [] = True
propIAntec (x:xs) = (not(circulo x) || rojo x)  && propIAntec xs

propIConsec :: [Figura] -> Bool
propIConsec [] = True
propIConsec (x:xs) = (not(cuadrado x) || rojo x)  && propIAntec xs


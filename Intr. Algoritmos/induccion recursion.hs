soloPares :: [Int] -> [Int]
soloPares [] = []             --1
soloPares (x:xs) | mod x 2 == 0 = x : soloPares xs       --2a
                 | otherwise = soloPares xs              -- 2b


--soloPares [3,0,-2,12] = [0,-2, 12] 

-- soloPares [3, 0 -2, 12]
-- ={Notacion en terminos constructores}
-- otherwise = soloPares [0, -2, 12]
-- ={Caso recursivo en 2b, x=3, xs=[0, -2, 12]}
-- mod 0 2 == 0 = 0 : soloPares [-2, 12]
-- ={caso recursivo 2a, x=0, xs=[-2, 12], guarda 0}
-- 0 : (mod -2 2 == 0 = -2 : soloPares [12])
-- ={Caso recursivo 2a, x=-2, xs=[12], guarda -2}
-- 0:(-2:(mod 12 2 == 0 = 12 : soloPares []))
-- ={Caso recursivo 2a, x=12, xs=[]}
--    0:(-2:(12:) soloPares [])
-- ={Caso base, 1}
--    [0,-2,12]


--todosMenores10 :: [Int] -> Bool, que dada una lista devuelve True si ésta consiste sólo de números menores que 10.
--Por ejemplo: todosMenores10 [1,3,9] = True

todosMenores10 :: [Int] -> Bool
todosMenores10 [] = True         --caso 1
todosMenores10 (x:xs) | x<10 = todosMenores10 xs                  -- caso 2a
                      | otherwise = False                        -- caso 2b


-- todosMenores10 [1,3,9] 
-- ={notacion en terminos de constructores}
-- 1<10 = todosMenores10 [3,9]
-- ={Caso recursivo en 2a, x=1, xs=[3,9]}
-- 3<10 = todosMenores10 [9]
-- ={caso recursivo 2a, x=3, xs=[9]}
-- 9<10 = todosMenores10 []
-- ={caso recursivo 2a, x=9, xs=[]}
-- todosMenores10 [] = True
-- ={caso base 1}
-- True



--c) length (duplica xs) = length xs

--duplica :: [Int] -> [Int]
--duplica [] = []
--duplica (x : xs) | otherwise = (x * 2) : duplica xs

--myLength :: [a] -> Int
--myLength [] = 0
--myLength ( x : xs) = 1 + myLength xs

-- length (duplica xs) = length xs
-- 1) caso base, xs = []


-- length (duplica []) = length []
-- ={notacuion en terminos consstructores}
-- length ([]) = 0
-- = {def caso base length y duplica, xs=[]}
-- 0 = 0
-- ={Verdad, o igualdad.}

-- 2) HI length (duplica xs) = length xs

-- 3) Paso inductivo, xs=x:xs

-- length (duplica x:xs) = length x:xs
-- ={Notacion en terminos de constructores}
-- lenght (duplica x:xs) = 1 + lenght xs
-- ={Caso recursivo de lenght xs=x:xs}
-- lenght (( x * 2 : duplica xs)) = 1 + lenght xs
-- ={caso recursivo de duplica xs}
-- lenght (( x * 2 : duplica xs)) = 1 + length (duplica xs)
-- = {Hipotesis inductiva}
-- 1 + lenght xs = 1 + length (duplica xs)
-- {caso recursivo de lenght}
-- lenght xs = lenght (duplica xs)
-- {Hipotesis inductiva verdadera}
-- True


-- a) sum (sumar1 xs) = sum xs + (length xs)

--sumar1 [] = []
--sumar 1 (x:xs) = (x+1): sumar xs

--sum [ ] = 0 
--sum x:xs = x + sum xs



-- 1) Caso base, xs = []

-- sum (sumar1 []) = sum [] + (length [])
-- ={Def en terminos de constructores, xs=[]}
-- sum ([]) = 0 + 0
-- {def de sum y lenght}
-- 0 = 0
-- {verdad}

-- 2) Hipotesis inductiva
-- sum (sumar1 xs) = sum xs + (length xs)

-- 3) paso inductivo, xs=x:xs

--sum (sumar1 x:xs) = sum x:xs + (length x:xs)
-- {notacion de terminos construcotres}
-- sum ((x+1) : sumar1 xs) = x + sum xs + (1 + lenght xs)
-- {recursivo de sum, sumar y lenght}
-- (x+1) + sum (sumar1 xs) = x + sum xs + (1 + lenght xs)
-- {def de sum}
-- sum (sumar1 xs) = sum xs + (lenght xs)
-- {HI}
-- True


-- soloPares [] = []
-- soloPares (x:xs)
-- | mod x 2 == 0 = x:(soloPares xs)
-- | mod x 2 /= 0 = soloPares xs



-- soloPares (xs ++ ys) = (soloPares xs) ++ (soloPares ys)

-- 1) caso base, xs = []

-- soloPares ([] ++ ys) = (soloPares []) ++ (soloPares ys)
-- {notacion en terminos de consturecotres}
-- [] ++ ys == [] ++ soloPares ys
-- {caso base de solo pares en xs}
-- [] == []

-- 2) Hipotesis inductiva 
-- soloPares (xs ++ ys) = (soloPares xs) ++ (soloPares ys)

-- 3) Paso inducitvo, xs=x:xs

-- soloPares (x:xs ++ ys) = (soloPares x:xs) ++ (soloPares ys)
-- {Notacion en terminos de consturctores.}
-- soloPares (x : (xs ++ ys)) = (soloPares x:xs) ++ (soloPares ys)
-- {caso recursivo de ++ con ys y xs}


-- Debido a que soloPares tiene 2 casos, la induccion la dividiré en dos casos. 

-- caso 1 de induccion mod x 2 == 0

-- soloPares (x : (xs ++ ys)) = (soloPares x:xs) ++ (soloPares ys)
-- {reescritura}
-- soloPares (x:(xs ++ ys)) = x: (soloPares xs) ++ (soloPares ys)
-- {Caso recursivo soloPares xs}
-- x : soloPares (xs ++ ys) = x : (soloPares xs ) ++ (soloPares ys)
-- {Aritmetica}
-- soloPares (xs ++ ys) = (soloPares xs) ++ (soloPares ys)
-- {HI}

-- caso 2 de induccion mod x 2 /= 0

-- soloPares (x : (xs ++ ys)) = (soloPares x:xs) ++ (soloPares ys)
-- {reescritura}
-- soloPares (x : (xs ++ ys)) = (soloPares xs ) ++ (soloPares ys)
-- {Caso recursivo de soloPares }
-- soloPares (xs ++ ys) = (soloPares xs) ++ (soloPares ys)
-- {HI}


--(4)	(++) [ ] ys = ys
--(5)	(++) (x:xs) ys = x : (xs ++ ys)

--myLength :: [a] -> Int
--myLength [] = 0
--myLength ( x : xs) = 1 + myLength xs

-- lenght (xs ++ ys) = lenght (xs) + lenght(xs)

-- 1) caso base, xs = []

-- lenght ([] ++ ys) = lenght [] + lenght ys

-- lenght ys = 0 + lenght ys

-- lenght ys = lenght ys

-- 2) Hipotesis inductiva, lenght (xs ++ ys) = lenght xs + lenght ys

--3) Paso inductivo, xs=x:xs

-- lenght (x:xs ++ ys) = lenght x:xs + lenght ys

-- 1 + lenght xs ++ ys = 1 + lenght xs + lenght ys

-- lenght xs ++ ys = lenght xs + ys

--

-- b) length xs ⩾ 0

-- 1) caso base, xs = []

-- lenght [] >= 0
-- {caso base de lenght}
-- 0 >= 0 
-- {Logica}
-- True

-- 2) Hipotesis inductiva
--  length xs ⩾ 0

-- 3) Paso inductivo,  
-- length x:xs ⩾ 0
--{notacion en terminos de consturctors}
-- 1 + lenght xs >= 0
-- {Def. de lenght recursivo}
-- 1 + 0 >= 0
-- {Hipotesis inductiva}
-- 1 >= 0
-- {Logica}
-- True
type Altura = Int                                       --Para representar la altura en centimetros
data Modalidad = Carretera | Pista deriving (Show)      --Modalidad del ciclista, Carretera o Pista

data Deportista = Velocista Altura | Ciclista Modalidad deriving (Show)

juan :: Deportista
juan = Velocista 172

pedro :: Deportista
pedro = Ciclista Carretera

maria :: Deportista
maria = Velocista 180

esVelocistaAlto :: Deportista -> Int -> Bool 
esVelocistaAlto (Velocista altura) n = altura > n 
esVelocistaAlto _ _ = False

{-
Ejemplos 
- esVelocistaAlto (Velocista 150) 160 --> False
- esVelocistaAlto (Velocista 180) 160 --> True 
- esVelocistaAlto juan 160 --> True 

Sirve para que el profe entienda como lo pensaste vos y rascar puntos ¡ 
-}

contarVelocistas :: [Deportista] -> Int
contarVelocistas [] = 0                                  --Caso base
contarVelocistas ((Ciclista _ : xs )) = contarVelocistas xs 
contarVelocistas ((Velocista _ : xs )) = 1 + contarVelocistas xs


{-
Ejemplos:
- contarVelocistas [Velocistas 150, Ciclista Pista, Velocista 170] --> 2
- contarVelocistas [Ciclista Carretera, Ciclista Pista, Ciclista Pista] --> 0
- contarVelocistas [juan] --> 1
-}


esCiclista :: Deportista -> Bool
esCiclista (Ciclista _) = True 
esCiclista (Velocista _) = False
--alt:
-- esCiclista _ = False 

{-
Ejemplos:
- esCiclista (Ciclista Pista) --> True
- esCilcista (Velocista 167) --> False 
- esCiclista juan --> False
-}

data Cola = VaciaC | Encolada Deportista Cola deriving (Show)

encolar :: Deportista -> Cola -> Cola
encolar d VaciaC = Encolada d VaciaC
encolar d (Encolada d' cola) = Encolada d cola

{-
Ejemplos:
cola1 = encolar juan VaciaC
cola2 = encolar pedro cola1
cola3 = encolar maria cola2

para probar: 
print cola1
print cola2
print cola3
-}
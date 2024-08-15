--Clase 05 - Introducción a los Algoritmos C6 - 25 de Marzo
--Practico:
--https://famaf.aulavirtual.unc.edu.ar/pluginfile.php/38108/mod_resource/content/1/practico2.pdf

--1)
--a)
length [5,6,7] 
≡{def. de lenght}
	3

b) [5,3,57] !! 1 = 3

	 [5,3,57] !! 1
≡ {def de !!}
	3

c)  [0,11,2,5]:[ ] 
	 [0,11,2,5]:[ ] 
≡ {def. de : con []}
	[[0,11,2,5]]
	
d)take 2 [5,6,7] = [5, 6]
	
take 2 [5,6,7] 
≡{def. de take 2}
	[5,6]

e)drop 2 [5,6,7] = [7]

	drop 2 [5,6,7]
≡{def. drop 2}
	[7]

f) head (0:[1,2,3])  = head [0, 1, 2 ,3]

	head (0:[1,2,3])  
≡ {def. de :}
	head [0,1,2,3]
≡ {def. de head}
	0

g)([1,2] ++ [3,4]) ++ [(2+3)] = [1,2,3,4,5]

	([1,2] ++ [3,4]) ++ [(2+3)]
≡ {def. de +}
	([1,2] ++ [3,4]) ++ [5]
≡ {def. de ++ en () por procedencia}
([1,2,3,4] ++ [5])
≡ {def. de ++ }
	[1,2,3,4,5]
	
h) take 2 (([[1]] ++ [[2]]) ++ [[3]]) = [1,2,3]
take 2 (([[1]] ++ [[2]]) ++ [[3]])
≡ {def. de ++}
	take 2 ([[1], [2]] ++ [[3]])
≡{def. de ++}
	take 2 ([[1], [2], [3]])
≡ {eliminacion de parentesis superfluos}
	take 2 [[1], [2], [3]]
≡{def. de take 2}
	[[1],[2]]

 i) take (length ([ ]:[[ ]])) (([[ ]] ++ [[ ]]) ++ [([ ] ++ [ ])])  = [[ ],[ ]]
	
	take (length ([ ]:[[ ]])) (([[ ]] ++ [[ ]]) ++ [([ ] ++ [ ])])  = [[ ],[ ]]
≡{def- de : en superfluos}
	take (length ( [ [ [ ] ] ] )) ( ( [ [  ] ] ++ [ [  ] ] ) ++ [ ( [  ] ++ [ ] ) ] )  = [[ ],[ ]]
≡{def de ++ en superfluos}
	take (length ( [ [ [ ] ] ] ))  ( ( [ [  ] ] ++ [ [  ] ] ) ++ [([])] )
≡{def de ++ en superfluos}
take (length ( [ [ [ ] ] ] ))  ( ([[ ]]) ++ [([])] )
≡{def de ++ en superfluos}
	take (length ( [ [ [ ] ] ] ))  ([[],[]])
≡{def de length en superfluos}
	take (1)  ([[],[]])
≡{def de take en superfluos}
		[[ ],[ ]]

2) 

a) -45:[1,2,3] Verdadero
 b) ([1,2] ++ [3,4]) ++ [5]  Verdadero
c) 0 ++ [[1,2,3]] Falso [[0]]++ [[1,2,3]] 
d) [ ]:[ ] Verdadero [[]]
e) ([1] ++ [2]) ++ [[3]] Falso, o pongo [3] o agrego [] en 1 y 3
f ) [1,5,False ] Falso, es Num, Bool. No se mezclan tipos
g) head [[5]] Verdadero 
h) head [True,False ] ++ [False ] Falso, tendría que agregar [] en [True, False]

clase 2 de guia 2, doc:
Clase 06 - Introducción a los Algoritmos C6 - 27 de Marzo

3)
Sin recursividad: (uso filter)
soloPares :: [Int] -> [Int]
esPar x = x `mod` 2 == 0
soloPares xs = filter esPar xs


Con recursividad, sin filter.
soloPares :: [Int] -> [Int]
soloPares [] = [] 
soloPares (x:xs)
    | (mod x 2) == 0 = x : soloPares xs 
    | otherwise = soloPares xs   


Sin recursividad, usando filter.
mayoresQue10 :: [Int] -> [Int]
mayor10 x = x>10
mayoresQue10 xs = filter mayor10 xs

b) recursivo.
mayoresQue10 :: [Int] -> [Int]
mayoresQue10 [] = []
mayoresQue10 (x:xs)
                    | x > 10 = x : mayoresQue10 xs
                    | otherwise = mayoresQue10 xs 

sin recursividad, usando filter
mayoresQue :: Int -> [Int] -> [Int]
mayoresQue n xs = filter (\x -> x > n) xs

c) con recursividad.

mayoresQue :: Int -> [Int] -> [Int]
mayoresQue _ [] = [] 
mayoresQue n (x:xs)
    | x > n     = x : mayoresQue n xs 
    | otherwise = mayoresQue n xs  

Preguntas:
a) ¿Se te ocurre algún otro ejemplo de una función de este tipo?

Una especia de “Delete” en una comparación, ej, n>x delete x.


4) 
sin recursividad
sumar1 :: [Int] -> [Int]
sumar1 x = map (+1) x 

con recursividad

sumar1 :: [Int] -> [Int]
sumar1 [] = []
sumar1 (x:xs)
    | otherwise = (x + 1) : sumar1 xs



b) sin recursividad
duplica :: [Int] -> [Int]
duplica x = map (* 2) x

b) con recursividad
duplica :: [Int] -> [Int]
duplica [] = []
duplica (x : xs)
  | otherwise = (x * 2) : duplica xs

sin recursividad
multiplica :: Int-> [Int] -> [Int]
multiplica n x = map (* n) x

c) con recursividad

multiplica :: Int-> [Int] -> [Int]
multiplica _ [] = []
multiplica n (x:xs) 
              | otherwise = (x * n) : multiplica n xs


pregunta)
a) ¿Se te ocurre algún otro ejemplo de una función de este tipo? 
nop

5)
sin recursividad
todosMenores10 :: [Int] -> Bool
todosMenores10 = foldl (\acc x -> acc && x < 10) False

Recursivo
todosMenores10 :: [Int] -> Bool
todosMenores10 [] = True

todoMenores10 (x : xs)
  | x >= 10 = True
  | x <= 10 = False
  | otherwise = todosMenores10 xs


b)
hay0 :: [Int] -> Bool
hay0 = foldl (\acc x -> acc || x == 0) False

recursion
hay0 :: [Int] -> Bool
hay0 [] = True
hay0 (x : xs)
  | x == 0 = True
  | x /= 0 = False
  | otherwise = hay0 xs


c) 
sumatoria :: [Int] -> Int
sumatoria = foldl (+) 0

recursivo
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x : xs) = (x + 1) + sumatoria xs

pregunta)
¿Se te ocurre algún otro ejemplo de una función de este tipo? 
si, uno que no sea de izq a derecha, fold solo está bien, no se me ocurre por q sumar de izq a der o de der a izq, ??

6) 

repartir :: [String] -> [String] -> [(String, String)]
repartir x y = zip x y

6) recursivamente
repartir :: [String] -> [String] -> [(String, String)]
repartir _ [] = []
repartir [] _ = []
repartir (x : xs) (y : ys) = (x, y) : repartir xs ys


7) ???

8) 
Length

myLength :: [a] -> Int
myLength [] = 0
myLength ( _ : xs) = 1 + myLength xs

!! 

quitar :: [a] -> Int -> a
quitar (x : _) 0 = x
quitar (_ : xs) n = quitar xs (n - 1)

 da mal? 

take

tomarNum :: Int -> [a] -> [a]
tomarNum 0 _ = []
tomarNum _ [] = []
tomarNum n (x : xs) = x : tomarNum (n - 1) xs

drop

dejarLista :: Int -> [a] -> [a]
dejarLista 0 xs = xs
dejarLista _ [] = []
dejarLista n (_ : xs) = dejarLista (1 - n) xs

++

está mal)?


sumarListas :: [a] -> [a] -> [a]
sumarListas [] ys = ys
sumarListas (x : xs) ys = x : (xs sumarListas ys)

clase 3 de coso: 
Clase 07 - Introducción a los Algoritmos C6 - 3 de Abril 


clase 4 coso:

Clase 08 - Introducción a los Algoritmos C6 - 8 de Abril

9) 

maximo [2,3,4,5]

a)maximo :: [Int] -> Int
maximo [x] = x					←- 1
maximo (x : xs) = max x (maximo xs)                ←- 2

maximo [2,5,1,7,3]
≡{notación de constructores}
maximo 2:5:1:7:3:[]
≡{def. de máximo caso recursivo, con x=2 , xs=5:1:7:3:[]}
max 2 (maximo 5:1:7:3:[])
≡{def. de máximo caso recursivo, con x=5 , xs=1:7:3:[]}
max 2 (max 5 (maximo 1:7:3:[]))
≡{def. de máximo caso recursivo, con x=1 , xs=7:3:[]}
max 2 (max 5 (max 1 (maximo 7:3:[])))
≡{def. de máximo caso recursivo, con x=7 , xs=3:[]}
max 2 (max 5 (max 1 (max 7 (maximo 3:[]))))
≡{def. de máximo caso base, con x=[3])}
max 2 (max 5 (max 1 (max 7 3)))
≡{def. de max con 7 y 3}
max 2 (max 5 (max 1 7)
≡{def. de max con 1 y 7}
max 2 (max 5 7)
≡{def. de max con 5 y 7}
max 2 7
≡{def. de max con 2 y 7}
7 



o

maximo :: [Int] -> Int
maximo [x] = x
maximo (x : xs)
  | x >= maximo xs = x
  | x < maximo xs = maximo xs

o

maximo (x:y:xs)
                  | x >= y = maximo (x:xs)
                  | otherwise = maximo (y:xs)

maximo :: [Int] -> Int
maximo [ ] = error “No existe el máximo de una lista vacía”
(1) maximo [x] = x
maximo(x:y:xs) 
(2)	| x >= y = maximo (x:xs) 
(3)	| otherwise = maximo (y:xs)

maximo [1,8,19]
= {reescritura}
maximo (1:8:[19])
= {caso recursivo, x = 1, y = 8, xs = [19], (3)}
maximo (8:[19])
= {reescritura}
maximo (8:19:[ ])
= {caso recursivo, x= 8, y = 19, xs = [ ]}
maximo (19:[ ])
= {reescritura}
maximo [19]
= {caso base}
19


Clase de consulta del 12/4 de benjamin bau


b)
sumaPares :: [(Int, Int)] -> Int
sumaPares [] = 0
sumaPares (x : xs) = (fst x)  + (snd x) + (sumaPares xs)

sumaPares [(1,2),(3,4)]
≡ { def. en notación de constructores }
	((1,2) : [(3,4)]) = (fst 1) + (snd 2) + (sumaPares [(4,5)])
≡ {def. de sumaPares en caso 2, siendo x = (1,2), xs = [(4,5)], guarda tupla 1,2}
	(1+2) ((3,4) : [] = (fst 3) + (snd 4) + (sumaPares [])	
≡{def. de sumaPares caso 2 siendo x = (3,4), xs = [], guarda tupla 3,4}
	(1+2) + (3+4) sumaPares [] = 0
≡{def. de sumaPares caso 1}
	(1+2) + (3+4) + (0)
≡{aritmética}
	10

c)

Consulta Primer Parcial 12/04

todos0y1 :: [Int] -> Bool
todos0y1 [] = True
todos0y1 (x:xs)
             | x /= 0 && x /= 1 = False
              | otherwise = todos0y1 xs

	todos0y1 [1,0,0,1]
≡ {def. todos0y1. Notacion en terminos de constructores.}
	todos0y1 (1:[0,0,1])
          	 		     | 1 /= 0 && 1 /= 1 = False
         			     | otherwise = 1: todos0y1 0:0:1:[]

≡{def. todos0y1 en caso 2, en otherwise, siendo x=1, y xs= 0:0:1:[], guarda verdadera en otherwise, ya que uno no es distinto de 1}

	todos0y1 (1:0:[0,1])
          	 		     | 0 /= 0 && 0 /= 1 = False
         			     | otherwise = 1:0 :todos0y1 [0,1]

≡{def. todos0y1 en caso 2, en otherwise, siendo x=0, y xs= 0:1[], guarda verdadera en otherwise, ya que 0 no es distinto de 0}

	todos0y1 (1:0:0:[1])
          	 		     | 0 /= 0 && 0 /= 1 = False
         			     | otherwise = 1:0:0: todos0y1 1:[]

≡{def. todos0y1 en caso 2, en otherwise, siendo x=0, y xs= 1:[], guarda verdadera en otherwise, ya que cero no es distinto de 0}
	todos0y1 (1:0:0:1:[])
          	 		     | 0 /= 0 && 0 /= 1 = False
         			     | otherwise = 1:0:0:1: todos0y1 []

≡{def. todos0y1 en caso 2, en otherwise, siendo x=1, y xs=[], guarda verdadera en otherwise, ya que 1 no es distinto de 1}
	1:0:0:1: todos0y1 []
≡{def. Caso base}
	1:0:0:1: []

todos0y1 :: [Int] -> Bool
todos0y1 [] = True
todos0y1 (x:xs)
  | x /= 0 && x /= 1 = False
  | otherwise = todos0y1 xs

todos0y1 [1,0,1,0]
= {reescritura} (este paso no es 100% necesario) 
todos0y1 (1:[0,1,0])
= {caso recursivo, x = 1, xs = [0,1,0], (3)}
todos0y1 [0,1,0]
={reescritura} (este paso no es 100% necesario)
todos0y1 (0:[1,0])
= {caso recursivo, x = 0, xs = [1,0], (3)}
todos0y1 [1,0]
= {caso recursivo, x = 1, xs = [0], (3)}
todos0y1 [0]
= {caso recursivo, x = 0, xs = [ ], (3)}
todos0y1 [ ]
= {caso base}
True

clase de consulta. 


d)

quitar0s :: [Int] -> [Int]
quitar0s [] = []
quitar0s (x:xs) | x == 0 = quitar0s xs
                | x /= 0 = x : quitar0s xs

	quitar0s [2,0,3,4] 
≡ {notación en términos de constructores}
     quitar0s 2:0:3:4:[] 
≡ {caso recursivo de quitar0s con x = 2, xs= 0:3:4:[], y guarda verdadera 2 /= 0}
    2 : quitar0s 0:3:4:[]
≡ {caso recursivo de quitar0s con x = 0, xs= 3:4:[], y guarda verdadera 0 == 0}
    2 : quitar0s 3:4:[]
≡ {caso recursivo de quitar0s con x = 3, xs= 4:[], y guarda verdadera 3 /= 0}
    2 : 3 : quitar0s 4:[]
≡ {caso recursivo de quitar0s con x = 4, xs= [], y guarda verdadera 4 /= 0}
    2 : 3 : 4 : quitar0s []
≡ {caso base de quitar0s}
    2 : 3 : 4 : []

e)

ultimo :: [a] -> a
ultimo [x] = x
ultimo (x : xs) = ultimo xs

	ultimo [“abc”]
≡ {notacion en terminos de constructores}
ultimo ‘a’:’b’:’c’:[]
≡{def. caso 2, x=a, xs=’b’:’c’:[]}
	ultimo ‘b’:’c’:[]
≡{def. caso 2, x=b, xs=’c’:[]}
ultimo ’c’:[]
≡{def. caso 1, x=c}
	c



f) 

repetir :: Int -> Int -> [Int]
repetir n 0 = []
repetir n k = n : repetir n (k-1)

	repetir 2 3
≡{def. de n y k, siendo n el que se repetira k veces. n=2, k=3}
	repetir 3 2 = 3 : repetir 3 (2-1)
≡{def. de repetir caso 2 siendo 3 el repetir, disminuyo n 1 vez y guarda a 3 }
	repetir 3 2 = 3 : repetir 3 (2-1)
≡{def. de repetir caso 2 siendo 3 el repetir, disminuyo n 1 vez y guarda a 3 }
repetir 3 1 = 3 : repetir 3 (1-1)
≡{def. de repetir caso 2 siendo 3 pero }
repetir 3 0 = []
≡{lista completa}
	[3,3]
	
g)

concat :: [[a]] -> [a]
concat [] = []
concat (xs:xss) = xs ++ concat xss

	concat [ [ 1,4 ],[ ],[ 2 ] ]
≡{notacion en terminos de consturctores}
	[1,4] ++ concat []
≡{def. caso 2, con xs= [1,4] y xss[], guarda de [1,4]}
	[1,4] ++ concat [] = []
≡{def. caso 1, xs = []}
	 [1,4] ++ [2] ++ concat []
≡{def. caso 2, con xs= [2] y xss= [1,4], guarda de 2}
	[1,4] ++ [2] concat [] 
≡{def. caso 1}
	[1,4] ++ [2]
≡{def. de ++}
	[1,4,2]

h)


rev :: [a] -> [a]
rev [] = []
rev (x:xs) = rev xs ++ [x]

rev [1,2,3] 
≡{Notacion en terminos de constructores}
	rev 2:3:[] ++ [1]
≡{def. caso 2 , con x=1, xs = 2:3[] guarda 1}
	[1] ++ rev 3:[] ++ [2]
≡{def. caso 2 , con x=2, xs = 3[] guarda 2}
	[1] ++ [2] ++ rev [] ++ [3]
≡{def. caso 2 con x= 3, xs = [] guarda 3}
	[1] ++ [2] ++ [3] rev [] = []
≡{def. caso 2 con x = []}
	[1] ++ [2] ++ [3]
???????

10)
PASOS:
	1) ejemplito barato, [6,7]
2) caso base xs =[]
3) Hipotesis inductiva
4) Paso inductivo

PASO 1)
 
sum (sumar1 xs) = sum xs + (length xs)
xs= [6,7]

→ 	sum (sumar1 [6,7] = sum [6,7] + (lenght [6,7]

→	sum [7,8] = 13 + 2

→	15 = 15


PASO 2) Caso Base. Lista de tamaño 0

sum (sumar1[]) = sum [] + length []
≡{def. sumar1, sum y length}
sum [] = 0 + 0
≡{def. de sum}
0 = 0
≡{aritmetica}
True

PASO 3)  Hipotesis inductiva.

-Suponemos que vale para xs de tamaño n

sum(sumar xs) = sum xs + lenght xs  ←— ESTO VALE ES VERDADERO

-Paso inductivo ¿(x:xs)? (tamaño n+1)

USO:
sumar1 [] = []
sumar 1 (x:xs) = (x+1): sumar xs
sum [ ] = 0 
sum x:xs = x + sum xs
y otros…..

sum (sumar1 (x:xs)) = sum (x:xs) + lenght(x:xs)
≡ {Def. sumar1, sum, length}
	sum((x+1):sumar1 xs) = x + sum xs + 1 +lenght + xs 
≡ {Def. de sum}
	(x+1) + sum(sumar1 xs) = x + sum xs + 1 + length + xs
≡{Aritmetica, cancelo 1 y x}
	sum(sumar1 xs) =  sum xs + length + xs
≡{Hipotesis inductiva.}
	True

/////Ambas están bien, abajo como hace carlos, arriba como las chicas//////

sum xs + lenght xs = sum xs + length + xs

*Vale para []
*Si es verdad que vale para xs, entonces vale para (x:xs)
	Por A y B: vale para [x] (x:[]) ←- para un solo elemento
	Entonces vale para lista de un elemento mas [x1,x2,x3]

10b)


b) sum (duplica xs) = 2 * sum xs 

1)caso base xs=[]


sum(duplica []) = 2 * sum []
≡{def. funciones para induccion}
sum ([ ]) = 2 * 0
≡{def. de duplica [] y sum [] en caso base}
sum [ ] = 0
≡{def. de sum en caso base, y hago aritmetica 2*0}
0 = 0

2) Hipotesis inductiva

	sum (duplica xs) = 2 * sum xs

si vale para uno, vale para el siguiente, xs=(x:xs).  Paso inductivo.

3) 
sum (duplica(x:xs)) = 2 * sum (x:xs)
≡{def. paso inductivo, xs= (x:xs)}
	sum (( 2*x ) : duplica xs ) = 2 * x + sum xs
≡ {def. paso recursivo en duplica y sum}	
	x + sum xs = 2 * x + sum xs
≡{def. de sum xs y duplica}
	x + sum (duplica xs) = 2 * x +  sum xs
≡ {Paso inductivo, se por HI q sum xs es duplica xs}
	sum (duplica xs) = 2 + sum xs
≡{aritmetica, cancelo x con x y quedoa HI}
	true

11)Demostrá por inducción las siguientes propiedades. Ayuda: Recordá la denición de cada uno de los operadores implicados en cada expresión.

a) xs ++ [ ] = xs (la lista vacía es el elemento neutro de la concatenación)
b) length xs ⩾ 0

caso base xs=[]

[] ++ [ ] = []
≡{def. notacion de constructores}
	[ ] = [ ]
≡{def. de concatenacion y igualdad verdadera}
	True

Hipotesis inductiva
xs ++ [] = xs

     3) Paso inductivo, siendo xs := (x:xs)
	(x:xs) ++ [] = x:xs
≡{def. en notacion de constructores.}
	x : (xs ++ []) = x:xs
≡{def. de concatenación (++)}
x : (xs) = x:xs
≡{def. de concatenacion(++)}
	xs = xs
≡{HI. cancelacion aritemtica, cancelo x con x}
	True


b)	length xs ⩾ 0	

caso base, xs = []

length [] >= 0 
≡{ def. en notacion de terminos constructores}
	0 >= 0 
≡ {def de length }

Hipotesis inductiva, xs = xs 
length xs >= 0 
	
Paso inductivo, xs = x:xs

lenght (x:xs) >= 0 
≡{def. en notacion de constructores}


que explique el maldito profe !!!

12)
	sum (quitarCeros xs) = sum xs

caso base, xs = []

sum (quitar0 []) = sum []
≡{def. en notacion de terminos constructores}
sum ([]) = 0
≡{def de sum y quitar 0 en caso base}
0 = 0
≡{def de sum y igualdad}
	true

Hipotesis inductiva, uso xs
sum (quitar0 xs) = sum xs

paso inductivo, si vale para uno vale para el siguiente, quedando xs=x:xs

sum (quitar0 (x:xs)) = sum (x:xs)
≡{def. en notacion de terminos constructores}
	sum ( quitar0 (x:xs)) = x + sum xs
≡{def. de sum en su caso recursivo}

	Reparto en dos casos debido a la fun. Quitar0 tiene 2 casos
	
CASO x /= 0 
	sum (quitar0 (x:xs)) = x + sum xs
≡{reescritura}
	sum ( x : quitar0 xs ) = x + sum xs
≡{def. de quitar0, tomo que x:xs es x/= 0}
	x + sum xs = x + sum xs 
≡{igualdad}
	sum xs = sum xs
≡{Cancelacion de x por que tengo x en ambos lados, aritmetica}
	sum (quitar0 xs) = sum xs
≡{Hipotesis inductiva}




Caso == 0

sum(quitar0 (x:xs)) = x + sum xs 
≡{reescritura}
	sum ( quitar0 xs) = x + sum xs 
≡{def. de quitar0, tomo que x:xs es x/= 0}	 ///////////pregunta q onda acá
	x + sum xs = x + sum xs 
≡{igualdad}
	sum xs = sum xs
≡{Cancelacion de x por que tengo x en ambos lados, aritmetica}
	sum (quitar0 xs) = sum xs
≡{Hipotesis inductiva}

13 hecho en una consulta kkkkk
	
14) Considerando la función sum :: [Int] -> Int que toma una lista de números y devuelve la suma de ellos, define sum y demostrá que:

sum (xs ++ ys) = sum xs + sum ys

caso base xs=[]

sum ([] ++ ys) =sum [] + sum ys
≡ {def en notacion de terminos consturctores}
 sum (ys) = 0 + sum ys
≡{def de ++ con [], caso base de sum }
	sum ys = sum ys
≡{aritmetica, 0 es el elemento neutro de la suma produciendo ningun cambio}
	
Hipotesis inducitva xs
sum (xs ++ ys) = sum xs + sum ys

paso inductivo, xs = x:xs

sum ((x:xs) ++ ys) sum (x:xs) + sum ys
≡{def. de el paso inductivo xs = x:xs, ys = ys}
	sum ( x : (xs ++ ys)) = x : (xs ++ ys) + sum ys
≡{def. de caso recursivo de ++ y sum x=x xs= xs ++ ys}
	x + sum xs ++ ys = x + sum xs + sum ys
≡{def. def de sum media rara xd}
	sum xs ++ ys = sum xs + sum ys
≡{HI}






15) 
	Demostrar que
 					length (repetir n x) = n

caso base n = 0

length (repetir 0 x) = 0
≡{def. en terminos de constructores}
	lenght ([]) = 0
≡{def. de repetir 0}
	lenght [] = 0
≡{eliminacion de parentesis superfluos}
	0 = 0
≡{igualdad, true}
	True

Hipotesis inductiva:
	length (repetir n x) = n
Paso inductivo: si vale para n vale para n+1

length (repetir (n+1) x) = n +1
≡{Notacion en constructores.}
	length ( x : (repetir n x)) = n +1 
≡{def. de repetir en caso recursivo}
	////////////// aca ni idea la verdad ////////////
	length ( x : (repetir n x)) = length ( x:xs)
≡{def de lenght}
	1 + lenght xs = 1 + lenght xs 

re ilegal jklasd


16)
concat (xss ++ yss) = (concat xss) ++ (concat yss)
	
caso base, siendo xss = []

	concat ([] ++ yss) = (concat []) ++ (concat yss)
≡{def de concat xss encaso base}
	concat yss = [] ++ (concat yss)
≡{def de ++ y concat []}
	concat yss = concat yss
≡{igualdad}
	true

	


Hipotesis inductiva
concat (xss ++ yss) = (concat xss) ++ (concat yss)

paso inductivo, xss= xs:xss
concat (xs:xss) ++ yss) = (concat (xs:xss)) ++ (concat yss)
≡{Notacion en terminos constructores}
	xs ++ (concat xss)  ++ yss = xs ++ (concat xss) ++ (concat yss)
≡{def. de concat xs:xss en caso recursivo}
	concat (xss  ++ yss) = (concat xss) ++ (concat yss)
≡{HI, elim de parentesis superfluos y cancelacion de xs ++ con xs ++}


17)
rev (xs ++ ys) = (rev ys) ++ rev xs 

caso base, xs = []

	rev ( [] ++ ys) = (rev ys) ++ rev []
≡{notacion en terminos de consturctores}
	[ ] ++ ys = (rev ys) ++ []
≡ { def de ++ en caso base}
	ys = ys

hipotesis inductiva
	rev (xs ++ ys) = (rev ys) ++ rev xs 
paso inductivo, xs = x:xs
	rev ( (x:xs) ++ ys = (rev ys) ++ rev (x:xs)
≡{notacion en terminos de consturctores}
	rev( x : (xs ++ ys)) = (rev ys) ++ rev xs ++ [x]
≡{def. de caso recursivo en xs de ++ y de rev xs}
	rev xs + [x] ++ ys = (rev ys) ++ rev xs ++ [x] 
≡{Cancelacion de [x]}
	rev (xs ++ ys) = (rev ys) ++ rev xs
≡{aritmetica}

18)	

a) xs ++ (ys ++ zs) = (xs ++ ys) ++ zs (la concatenación es asociativa) 

caso base, xs = []
[ ] ++ (ys ++ zs) = ([ ] ++ ys) ++ zs
≡{def en términos de constructores}
[ ] ++ yszs = (ys) ++ zs
≡{def de ++}
	yszs = yszs

Hipotesis inductiva 
xs ++ (ys ++ zs) = (xs ++ ys) ++ zs
Paso inductivo, xs= x:xs


x:xs ++ (ys ++ zs) = (x:xs ++ ys) ++ zs
≡{def. en notacion de terminos constructores}
	x: ((xs ++ ys) ++ zs) = (x : xs ++ ys) ++ zs
≡{def. de ++}
	xs ++ (ys ++ zs) = (xs ++ ys) ++ zs
≡{HI}

b)
take (length xs) (xs ++ ys) = xs

caso base xs = []

	take (length []) ([] ++ ys) = []
≡{def. en notación de constructores}
	take 0 (ys) = []
≡{def. de length}
	0 = 0
≡{def de take y []}
	True

Hipótesis inductiva
take (length xs) (xs ++ ys) = xs

paso inductivo, xs = x:xs

take (length x:xs) (x:xs ++ ys) = x:xs
≡{def. en notación de constructores}
	take (1 + length xs) (x : (xs ++ ys)) = x:xs
≡{def. de length y ++ en caso recursivo}
 







sumar1 [] = []
sumar 1 (x:xs) = (x+1): sumar xs

sum [ ] = 0 
sum (x:xs) = x + sum xs

duplica :: [Int] -> [Int]
duplica [] = []
duplica (x : xs)
  | otherwise = (x * 2) : duplica xs

quitarCeros [] = []
quitarCeros (x:xs)
| x /= 0 = x:quitarCeros xs
| x == 0 = quitarCeros xs

soloPares [] = []
soloPares (x:xs)
| mod x 2 == 0 = x:(soloPares xs)
| mod x 2 /= 0 = soloPares xs

repetir 0 x = [ ]
repetir (n+1) x = x:(repetir n x)


lenght [ ]  =  0		 (1)		                          
lenght (x:xs)  =  1 + lenght xs       (2)

concat [ ] = [ ]
concat (xs:xss) = xs ++ (concat xss)

(++) :: [Int] -> [Int] -> [Int]
(4)	(++) [ ] ys = ys
(5)	(++) (x:xs) ys = x : (xs ++ ys)

rev [ ] = [ ]
rev (x :xs) = rev xs ++ [x]



glosario: 
ternas: 3 elementos (a, b, c)


[20 pto(s)] Definir la funci´on recursiva pesifica :: [Int] → Int → [Int], que dada una lista de precios en d´olares xs y una cotizaci´on del d´ıa n, devuelve la lista de los precios en pesos a la cotizaci´on del d´ıa. Ejemplo: (i) pesifica [2, 100, 5] 400 = [800, 40000, 2000]. 

pesifica :: [Int] → Int → [Int]
pesifica [] _ = []
pesifica [] n = 0
pesifica (x:xs) n = (x*n) : pesifica xs x




pesifica [2, 100, 5] 400
≡{Def. en notacion de terminos constructores}
	(2*400) : pesifica [100, 5] 400
≡{def. x=2, xs:= [100, 5], n = 400 caso recursivo 2}
	800: (100*400) : pesifica [5] 100
≡{def. x=10, xs:= [5], n = 400 caso recursivo 2}
	800: 40000: (5*400) pesifica [] 5
≡{def. x=5, xs:= [], n = 400 caso recursivo 2}
	800 : 40000 : 2000 : []
≡{def caso base}
	[800, 40000, 2000]
≡{pegado de listas}

Definir la funci´on recursiva cuentaVacia :: [[a]] → Int, que dada una lista de listas xss (de cualquier tipo), devuelve cuantas listas dentro de xss son vac´ıas. Ejemplo: (i) cuentaVacia [ [2, 3], [ ], [1], [ ] ] = 2.

cuentaVacia :: [[a]] → Int
cuentaVacia [xs] = xs
cuentaVacia (xs:xss) | xs == [] = 1 + cuentaVacia xss
          | otherwise = cuentavacia xss  


codigo escrito sin copilador arriba


cuentaVacia :: [[a]] -> Int
cuentaVacia [] = error "Escriba una lista con elementos"
cuentaVacia [xs] = 0
cuentaVacia (xs:xss) |  null xs = 1 + cuentaVacia xss	← 1
               	           | otherwise = cuentaVacia xss   	← 2

cuentaVacia [ [2, 3], [ ], [1], [ ] ] 
≡{Notacion en terminos de constructores}
	cuentaVacia [[], [1], []]
≡{Caso 2, x:= [2,3] xs:= [[ ], [1], [ ] ]}
	null [] = 1 + cuentaVacia [[1], [ ] ] 
≡{Caso 1, x:=[], xs:=[[1], [ ] ]}
	1 + cuentaVacia [ [ ] ]
≡{Caso 2, x:=[1], xs:=[[]]}
	1 + null [] = 1 + cuentaVacia [[]]
≡{ def. caso 1, x=[], xs:=[]}
	1 + 1
≡{aritmetica}
	2




checkMayor :: [(Int,Int)] -> [Bool]
checkMayor [ ] = [ ]          					--- (1)
checkMayor ((x,y):xs) | (x>y) = True : (checkMayor xs)	 --- (2a)
| (x<=y) = False : (checkMayor xs)	 --- (2b)

length :: [a] -> Int
length [] = 0 --- (3)
length (x:xs) = 1 + length xs --- (4)


Demostrar:	length (checkMayor xs) = length xs

caso base xs=[]

length (checkMayor []) = length []
≡{Notacion en terminos de constructores}
	length ([]) = lenght []
≡{def. de checkMayor (1) siendo xs=[]}
	0 = 0
≡{def. de length por caso (3)}
	True

Hipotesis inductiva

	length (checkMayor xs) = length xs

paso inductivo, xs= x:xs

	length (checkMayor x:xs) = length x:xs
≡{Notacion en terminos de constructores}
	length (checkMayor (x,y:xs)) = 1 + length xs
≡{Def. de length en caso (4) y agrego y en checkMayor para poder que funcione el programa}
	

	Acá divido en dos casos, uno cuando x>y y otro cuando x<=y 

	Caso x>y

	length (checkMayor (x,y):xs)) = length x:xs
≡{Reescritura}
	length (True : (checkMayor xs)) = 1 + length xs
≡{def. de length (4), y checkMayor en (2a)}
	1 + length ( lenght xs ) = 1 + length xs
≡{def. de checkMayor (2a)}
	1 + length (checkMayor xs)  = 1 + length xs
≡{def. de length (4)}
length (checkMayor xs) = length xs
≡{Cancelacion de 1+ y HI}

	casox<=y

	length (checkMayor (x,y):xs)) = length x:xs
≡{Reescritura}
	length (False : (checkMayor xs) = 1 + length xs
≡{def. de lenght en caso 4 y checkmayor en 2b}
	1 + length ( lenght xs ) = 1 + length xs
≡{def. de checkMayor (2a)}
	1 + length (checkMayor xs)  = 1 + length xs
≡{def. de length (4)}
	length (checkMayor xs) = length xs
≡{Cancelacion de 1+ y HI}



	clase 7 creo ya me perdi clase pre parcial

Clase 09 - Introducción a los Algoritmos C6 - 15 de Abril

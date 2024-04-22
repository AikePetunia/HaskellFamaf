LINKS:
Cronograma https://docs.google.com/spreadsheets/d/1uqIAqYlwsiWiiqjQR0N8Z4tArhjNj5m7nfUCRL3cODA/edit
https://famaf.aulavirtual.unc.edu.ar/pluginfile.php/37074/mod_resource/content/1/practico1-2024.pdf
https://docs.google.com/document/d/1eFpoykGRExEi2lTYVkoDGXVgBSB271xBQXLShsFIJvs/edit
http://aprendehaskell.es/content/Introduccion.html#sobre-esta-guia
ayuda para coso 
Parte de ayuda practico 1:
https://famaf.aulavirtual.unc.edu.ar/course/view.php?id=285&section=5#tabs-tree-start
cosas 2023:
https://drive.google.com/drive/folders/1Ak3O1FT2ElFWa7rISbpUVBn4qsYMQmlB

1)
No, no son comprensibles.
Interpretará las letras que hay, por lo tanto creería que sí, pero no captaría el mensaje.
La diferencia principal entre una computadora y una persona es el de la capacidad de sentir, el pensar, el cómo y de qué están hechos y la comunicación que tiene. Las computadoras, siguen instrucciones y no cuestionan. 
Legibilidad y buena sintaxis, para lograr una interpretación.

2)
La expresión “2+1” es correcta, con el resultado correspondiente, 3, está construida correctamente, sin embargo, la expresión errónea es “2+”, por falta de una constante y está incompleto.

3)
2 = 1 “False”
2 = 2  “True” 
2 =     “error” Mal construida, no hay una comparación/equivalencia.

4)
2 + (5 * 3)
4 - 2 + 2
Se justifican copilando ambas sin errores y dando el resultado correcto.

5)
2 + 4 * 
4 / 9 + 
No copilan, dan error y se encuentran incompletas por falta de constantes. 

6)
2 + 4 * 7 <= 42
Por que en ghci da de resultado True, siendo verdadera y no dando errores.

Clase 2.
https://docs.google.com/document/d/1cNzZxaYPUQrIc4NmS2wGi7fmPgHssDHZ-0I81p-z5nA/edit
https://famaf.aulavirtual.unc.edu.ar/pluginfile.php/37074/mod_resource/content/1/practico1-2024.pdf

7)

(8 − 6) ∗ x = (6 ∗ (x 2 )) + 3 ≡ { precedencia de ∗ por sobre + }

(8 − 6) ∗ x = 6 ∗ x2 + 3 ≡ { precedencia de ∗ por sobre + }

a)((5 + 1) + (3 ∗ 6)) ∗ (8 ∗ 5)
(5 + 1 + 3 * 6) * 8 * 5

b) ((22 ) + 5) < (2 + 4)
(2^2 + 5) < 2 + 4

8)
a) (5 * 3) + 4 ⩾ 7 − 7 + 3
b) (3 + 4) * x= 4

9) DONE.

10)
es :t (operacion)
(*) :: Num a => a -> a -> a
( /) :: Fractional a => a -> a -> a
( <=) :: Ord a => a -> a -> Bool
( >=) :: Ord a => a -> a -> Bool
( -) :: Num a => a -> a -> a

Multiplicación, división, elevado, menor igual que, mayor igual que, igual, menos

11)
Simplifica las siguientes expresiones
a) 70 ∗ 47/(3 + 2)
b) (3 + 1) ∗ 10 = 25
c) 2 ∗ x + y = 1 + 2 ∗ y

a)3290 / 5
b) 4 * 10 = 25
c) 2x+y=3y

12) EVALUADAS.
C) <interactive>:14:1: error:
    Parse error in pattern: 2 In a function binding for the ‘+’ operator.

No hay variables x y tampoco y.

Clase 3:
https://docs.google.com/document/u/6/d/1wUAubHc5JiyrDXICIvY_CHttqppP1-Cxg_MAqsq3j-I/edit 

13)
13. En las siguientes definiciones identifica las variables, las constantes y el nombre de la función
a) f.x = 5 ∗ x
f = función
x = variable
5 = constante

b) duplica.a = a + a
duplica = funcion
a = variable
constante = n/a

c) por2.y = 2 ∗ y
por2  = función
y = variable
2 = constante
constante = n/a

d) multiplicar.zz.tt .= zz ∗ tt
multiplicar = función
zz, tt = variable

14. Escribí una función que dados dos valores, calcule su promedio.

unaFuncion :: (Fractional a) => (a, a) -> a
unaFuncion (x, y) = (x + y) / 2

15. Tomando las definiciones del punto 13 evalu´a las siguientes expresiones. Justific´a cada paso utilizando la notaci´on aprendida. Luego, control´a los resultados en Haskell.

a) (multiplicar.(f,5),2) + 1

Estoy tomando de input los resultados de la funcion de 
el input de la funcion “f” es 5.
el input de la función multiplicar es 2 y + 1
 
b) por2.(duplica.(3 + 5))

por2 (valores de duplica(inputs)
toma los valores de duplica para poder usarlos de inputs en la funcion de por2.

Clase 4:
https://docs.google.com/document/d/1WjrWsUE-FMk7dzm_rKDg7su6s1QaCRoxppHn8GndaCY/edit



16)
a)f :: Num a => a -> a
b)duplica :: Num a => a -> a 
c)por2 :: Num a => a -> a
d)multiplicar :: Num a => a -> a -> a

17)
a) g y = 8 ∗ y  g :: Num a => a -> a 
b) h z w = z + w   h :: Num a => a -> a  -> a
c) j x = x ⩽ 0    j :: (Ord a, Num a) => a -> Bool


18)
a) sgn :: Int -> Bool

sgn x | x>=0 && x<=9 = True
          | x<0 && x>9 = False

b) sgn :: Int -> String
sgn x
  | x < 2000 = "Barato"
  | 2000 <= x  && 5000 >= x = "caro"
  | 5000>x = "Esto no puede ser"

C)
absoluto :: Int -> Int
absoluto x
    | x > 0     = x
    | otherwise = -x

d) sgn :: Int -> Bool
sgn x
  | (mod x 2 == 0) = True
  | (mod x 2 /= 0) = False

19)
24)
esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y = y `mod` x == 0

20)
esBisiesto :: Int -> Bool


esBisiesto x | x `mod` 400 == 0 || x `mod` 4 == 0 = True
            | otherwise                             = False
21) 
dispersion :: Int -> Int -> Int -> Int
dispersion x y z = (min (min x y) z)  - (max (max y z)x) 

22)

celsiusToFahr :: Float -> Float
celsiusToFahr x = (x * 1.8) + 32

23)

haceFrioF :: Float -> Bool

haceFrioF x | x>8 == "Hace Frio"
                    | x<8 == "Hace calor"
                    | otherwise == "nada."


25)
a) segundo3 :: (Int, Int, Int) -> Int

segundo3 (x,y,z) = y

b) ordena :: (Int, Int) -> (Int, Int)

ordena (a, b) | a>=b = (b, a)
           | a<b = (a, b)



Glosario:
Superfluo: Que esta demas
Los “quebrados: Fracciones (⅖)
int: integer, num entero, tipo de numero, hay muchos, como float.
precedencia: prioridad
parse: lectura del codigo.

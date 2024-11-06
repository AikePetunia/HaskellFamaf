{- 
  ------------------------------------------------------
                      Funciones en haskell:
  ------------------------------------------------------

      ##Función: 
          funcion :: [a] -> Bool 
             Indica que la función recibe una lista de tipo `a` y devuelve un valor booleano.

      ##Tuplas: 
        (a, a) 
          Representa un par ordenado que puede contener dos elementos del mismo tipo.
      
      ##Recursión
        sumatoria :: Num a => [a] -> a
        sumatoria [] = 0
        sumatoria (x:xs) = x + sumatoria xs
          Suma todos los elementos de una lista de forma recursiva
      
      ##Pattern Matching
          titulo :: Carrera -> String
          titulo Matematica   = "Licenciatura en Matemática"
          titulo Fisica       = "Licenciatura en Física"
          titulo Computacion  = "Licenciatura en Computación"
          titulo Astronomia   = "Licenciatura en Astronomía"

      Devuelve el nombre completo de una carrera utilizando pattern matching

     ##Filter
      Filtra segun una funcion p asignada, puede estar anteriormente asignada. 

        filter :: (a -> Bool) -> [a] -> [a]
        filter p [] = []
        filter p (x:xs)
            | p x       = x : filter p xs
            | otherwise = filter p xs

          Ejemplos:
          Prelude> filter (<2) [3,1,0,6,9]
          [1,0]
          Prelude> filter even [8,2,3,6,11]
          [8,2,6]

      ##TakeWhile
      Tomara mientras se cumpla una condicion sobre la lista. 

        takeWhile :: (a -> Bool) -> [a] -> [a]
        takeWhile _ [] = []
        takeWhile p (x:xs)
            | p x       = x : takeWhile p xs
            | otherwise = []

          Ejemplo de uso: 
          Prelude> takeWhile (<3) [1,2,3,4]
          [1,2]

      ##Case
        esPar :: Int -> Bool
        esPar n = case n `mod` 2 of
            0 -> True
            _ -> False
          Evalúa si un número es par usando 'case'

      ##Where
          hipotenusa :: Float -> Float -> Float
          hipotenusa a b = sqrt (cuadrado a + cuadrado b)
            where
              cuadrado x = x * x
            
        Define una función auxiliar cuadrado dentro de hipotenusa usando 'where'

      ##Take
          primeros :: Int -> [a] -> [a]
          primeros n lista = take n lista

            Devuelve los primeros n elementos de la lista


      ##Head
      primero :: [a] -> a
      primero lista = head lista
        Devuelve el primer elemento de una lista


      ##Tail
        resto :: [a] -> [a]
        resto lista = tail lista

        ##foldr
      foldr' :: (a -> b -> b) -> b -> [a] -> b
      foldr' _ z []     = z
      foldr' f z (x:xs) = f x (foldr' f z xs)

        ##foldl
      foldl' :: (b -> a -> b) -> b -> [a] -> b
      foldl' _ z []     = z
      foldl' f z (x:xs) = foldl' f (f z x) xs

      Ejemplos:
      Prelude> foldr' (+) 0 [1,2,3,4]     Resultado: 10
        --Suma de derecha a izq
      Prelude> foldl' (+) 0 [1,2,3,4]     Resultado: 10
        --Suma de izq a derecha

     ##map

        map :: (a -> b) -> [a] -> [b]
        map f xs = case xs of
                      []     -> []
                      (y:ys) -> f y : map f ys

           Ejemplos:
           Prelude> map succ [1,2,3,4]
           [2,3,4,5]
           Prelude> map not [False, False, True]
           [True, True, False]

        `mod` --> Saca el resto de una division

        `div` --> Divide 

      ##Maybe
      Maybe es un tipo de datos que se utiliza para representar valores que pueden o no estar presentes. 
      Es útil cuando una operación puede fallar o devolver un resultado vacío. El tipo Maybe tiene dos constructores:

      Nothing: Representa la ausencia de un valor.
      Just: Representa un valor existente.

      La definición de Maybe en Haskell es la siguiente:
      Ej:  
          data Maybe a = Nothing | Just a

         
            x :: Maybe Int
            x = Just 5

      ## Any en listas 

      
  ------------------------------------------------------
                        Definiciones:
  ------------------------------------------------------

        ## Definición de Tipos de Datos / Tipos Enumerados / Clases de tipos / Definicion de clases

          data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si
        
        ## Clases de Tipos
            Las clases de tipos permiten agrupar tipos que comparten ciertas operaciones.

              Clase Eq: proveen una noci ́on de igualdad (operador ==).
              Clase Ord: proveen una noci ́on de orden (operadores <=, >=, funciones min, max y m ́as).
              Clase Bounded: proveen una cota superior y una cota inferior para sus valores. Tienen entonces
              un elemento m ́as grande, definido como la constante maxBound, y un elemento m ́as chico, definido como
              minBound.
              Clase Show: tipos que proveen una representaci ́on en forma de texto (funci ́on show) para print.

        ## Polimorfismo ad hoc

            - Polimorfismo Paramétrico: 
                Una función polimórfica puede operar sobre cualquier tipo. Por ejemplo, la función identidad:

              id :: a -> a
                Esta función acepta un valor de cualquier tipo `a` y devuelve un valor del mismo tipo.

            - Ejemplo de Polimorfismo:

              existe :: [a] -> (a -> Bool) -> Bool
              existe [] _ = True
              existe (x:xs) t = t x || existe xs t
                Aquí, `(a -> Bool)` es un parámetro de la función, que permite evaluar cada elemento de la lista con un predicado.

        ## Currificación

           La currificación es una técnica que transforma funciones con múltiples argumentos en una serie de funciones de un solo argumento.

                ### Ejemplo de Currificación

                suma :: Num a => a -> a -> a
                suma x y = x + y

                sumaCurrificada :: Num a => a -> (a -> a)
                sumaCurrificada x = (\y -> x + y)

                agregar5 = sumaCurrificada 5
                resultado = agregar5 3     Resultado: 8

                Es basicamente pasar de:

                sumatoria : : [ a ] − > a
                sumatoria [ ] = 0
                sumatoria ( x : xs ) = x + sumatoria xs

                Que no copila, por que no hay un a que pueda sumarse, a no ser q sea Int

                sumatoria : : Num a => [ a ] −> a
                sumatoria [ ] = 0
                sumatoria ( x : xs ) = x + sumatoria xs

               En este ejemplo, `agregar5` se convierte en una función que toma un argumento y devuelve el resultado de sumar 5.

                  ## Tipos enumerados con polimorfismo. 

                    Usualmente nos encontramos con funciones que no est ́an definidas para ciertos valores de su dominio. Por
                      ejemplo, consideremos la siguiente funci ́on:

                    dividir : : I n t −> I n t −> I n t
                    dividir x y = x ` di v ` y
                    Podemos ver que, como la divisi ́on por 0 no est ́a definida, el int ́erprete de Haskell nos muestra un error:

                      data Maybe a = Nothing | Just a 

                    dividir :: Int -> Int -> Maybe Int
                    dividir x 0 = Nothing
                    dividir x y = just ( x `div` y )

        ## Funciones de Orden Superior

           Las funciones de orden superior son aquellas que pueden devolver funciones o tomar funciones como parámetros.

              ### Ejemplo

              applyTwice :: (a -> a) -> a -> a
              applyTwice f x = f (f x)

                En este caso, `applyTwice` toma una función `(a -> a)` y un valor `a`, aplicando la función dos veces al valor.

        ## Sinónimos de Tipos:
            Un sinónimo de tipo es simplemente un nuevo nombre que le das a un tipo existente. 
            Esto es útil para hacer el código más legible.

            type Altura = Int
            type NumCamiseta = Int

            Podes usar Altura y NumCamiseta en vez de usar dos veces Int y confunidir su orden con lo que son. 

              Tipos Algebraicos:

                Los tipos algebraicos permiten crear nuevos tipos a partir de otros tipos. 
                Tienen constructores que pueden no llevar argumentos (tipos enumerados sin parametros):
                Son data que simplemente se dan parametros que no estan definidos pero tampoco lo necesitan

                    data Zona = Arco | Defensa | Mediocampo | Delantera
                    data TipoReves = DosManos | UnaMano

                    Estos son tipos que solo tienen constructores sin datos adicionales.

                o pueden llevar uno o más argumentos (tipos con parámetros):
                  son data hechos con data con parametros 

                Debe de definirse antes:

                    type Altura = Int
                    type NumCamiseta = Int

                    data Zona = Arco | Defensa | Mediocampo | Delantera
                    data TipoReves = DosManos | UnaMano
                    data Modalidad = Carretera | Pista | Monte | BMX
                    data PiernaHabil = Izquierda | Derecha

                    data Deportista | Ajedrecista                        Constructor sin argumentos
                    | Ciclista Modalidad                 Constructor con un argumento
                    | Velocista Altura                   Constructor con un argumento
                    | Tenista TipoReves ManoHabil Altura     Constructor con tres argumentos
                    | Futbolista Zona NumCamiseta PiernaHabil Altura     Constructor con varios argumentos

                Estos tipos tienen constructores que llevan argumentos, lo que permite agregar información adicional.

        ## Tipos recursivos.

            Se define en términos de sí mismo. 
            Es útil para representar estructuras de datos que pueden crecer indefinidamente, como listas, árboles o colas. 
            La recursividad permite que un elemento del tipo incluya o haga referencia a otro elemento del mismo tipo.

            Ejemplo de tipo recursivo:
            En tu ejemplo, el tipo Cola es recursivo porque se define de esta manera:

                data Cola = VaciaC | Encolada Deportista (Cola)

            VaciaC: Representa una cola vacía.
            Encolada Deportista Cola: Representa a un deportista encolado seguido del resto de la cola (que es otro valor de tipo Cola).
            Este tipo es recursivo porque el constructor Encolada incluye un valor del mismo tipo (Cola).

        ## Tipo recurtsivos y polimorficos

        Son funciones definidas  como:

           data listaAsoc a b = Vacia \ Nodo a b (ListaAsoc a b)

        donde a y b pueden ser:

          type Diccionario = ListaAsoc String String
          type Padron = ListaAsoc Int String

        a y b arbitarios

        Igualdades Instance eq:
        instance Eq PiedrasPreciosas 
           where 
            (Diamante _ _ precio peso) == (Diamante _ _ precio' peso') = 
                eqDiamante (precio, peso) (precio', peso')
            (Esmeralda dureza _ precio) == (Esmeralda dureza' _ precio') = 
                eqEsmeralda (dureza, precio) (dureza', precio')
            (Rubi _ precio) == (Rubi _ precio') = 
                eqRubies precio precio'
            (Zafiro color precio) == (Zafiro color' precio') = 
              eqZafiros (color, precio) (color', precio')
            _ == _ = False

            eqDiamante :: (Precio, Peso) -> (Precio, Peso) -> Bool
            eqDiamante (precio, peso) (precio', peso') = True 

            eqEsmeralda :: (Dureza, Precio) -> (Dureza, Precio) -> Bool 
            eqEsmeralda (MuyDura, precio) (MuyDura, precio') = True
            eqEsmeralda (Dura, precio) (Dura, precio') = True
            eqEsmeralda (Fragil, precio) (Fragil, precio') = True

            eqRubies :: Precio -> Precio -> Bool 
            eqRubies precio precio' = precio == precio'

            eqZafiros :: (Color, Precio) -> (Color, Precio) -> Bool
            eqZafiros (Azul, precio) (Azul, precio') = True 
            eqZafiros (Rosa, precio) (Rosa, precio') = True
            eqZafiros (Amarillo, precio) (Amarillo, precio') = True
            eqZafiros (Marron, precio) (Marron, precio') = True
            eqZafiros (Gris, precio) (Gris, precio') = True
            eqZafiros (Blanco, precio) (Blanco, precio') = True

-}


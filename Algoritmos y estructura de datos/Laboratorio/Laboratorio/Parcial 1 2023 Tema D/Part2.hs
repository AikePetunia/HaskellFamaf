type Nombre = String 
data Division = Septima | Sexta | Quinta | Cuarta deriving (Eq, Show)
type NotaDefensa = Int
type NotaAtaque = Int
type NotaPases = Int
data NotasDelClub = NoHayMasJugadores 
                    | EvolucionJugador Nombre Division NotaDefensa NotaAtaque NotaPases NotasDelClub 

promoverDivision :: NotasDelClub -> String -> Bool 
promoverDivision NoHayMasJugadores s = False
promoverDivision (EvolucionJugador nombre division notaDefensa notaAtaque notaPases notasDelClub) s | nombre == s && division == Septima || division == Sexta && notaDefensa > 7 || notaAtaque > 7 && notaPases > 6 = True
                                                                                                     | nombre == s && division == Quinta && notaDefensa > 7 && notaAtaque > 7 && notaPases >= 8 = True
                                                                                                     | otherwise = promoverDivision notasDelClub s
devolverDivision :: NotasDelClub -> String -> Maybe Division
devolverDivision NoHayMasJugadores s = Nothing
devolverDivision (EvolucionJugador nombre division notaDefensa notaAtaque notaPases notasDelClub) s | nombre == s = Just division
                                                                                                   | otherwise = devolverDivision notasDelClub s

-- Lista de jugadores en el club
jugadoresClub :: NotasDelClub
jugadoresClub = EvolucionJugador "Juan" Septima 8 6 7
                  (EvolucionJugador "Carlos" Sexta 9 8 6
                    (EvolucionJugador "Pedro" Quinta 7 8 9
                      (EvolucionJugador "Luis" Cuarta 6 5 8
                        (EvolucionJugador "Andres" Septima 7 9 5
                          NoHayMasJugadores))))

{-
ghci> promoverDivision  jugadoresClub "Luis"
True
ghci> pro jugadoresClub "Juan"
product           promoverDivision  properFraction
ghci> promoverDivision  jugadoresClub "Juan"
True
ghci> promoverDivision  jugadoresClub "Juan"
True
ghci> devolverDivision jugadoresClub "Juan"
Just Septima
ghci> devolverDivision jugadoresClub "Luis"
Just Cuarta
ghci> promoverDivision  jugadoresClub "Luis"

-}